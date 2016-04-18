<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function Verb-Noun
{
    [CmdletBinding()]
    Param
    (
        # Parameters for storage
        [Parameter(Mandatory=$true, HelpMessage='Do you want to create a new storage?')]
        [ValidateSet('$True','$False')]
        [Boolean]$CreateStorage,
        [Parameter(Mandatory=$true, HelpMessage='What is the storage name?')]
        [String]$StorageName,
        [Parameter(Mandatory=$true, HelpMessage='What is your subscription name?')]
        [String]$SubscriptionName,
        [Parameter(Mandatory=$true, HelpMessage='Where are the downloads from your default browser stored? For example: D:\Downloads')]
        [String]$DownloadLocation,
                
        #Parameters for the Virtual Machine configuration. Note that the sized could require an update.
        #[Parameter(Mandatory=$true, Position=2, HelpMessage='What version of Windows Server would you like to use?')]
        #[ValidateSet('Windows Server 2012 R2 Datacenter', 'Windows Server 2012 Datacenter', 'Windows Server 2008 R2 SP1')]
        #[String]$WindowServerVersion,
        [Parameter(Mandatory=$true, HelpMessage='Specify the administrators username')]
        [String]$adminUserName,
        [Parameter(Mandatory=$true, HelpMessage='Specify the administrators password')]
        [String]$adminPassword,
        [Parameter(Mandatory=$true, HelpMessage='Specify the name of the Virtual Machine')]
        [String]$VirtualMachineName,
        [Parameter(Mandatory=$true, HelpMessage='Specify the name of the Virtual Machine')]
        [ValidateSet('ExtraSmall','Small','Medium','Large','ExtraLarge','A5','A6','A7','A8','A9','Basic_A0','Basic_A1','Basic_A2','Basic_A3','Basic_A4','Standard_D1','Standard_D2','Standard_D3','Standard_D4','Standard_D11','Standard_D12','Standard_D13','Standard_D14')]
        [String]$Size,

        #Configuration of the domain
        [Parameter(Mandatory=$true, HelpMessage='Specify the name of the Domain. Example: test.com')]
        [ValidatePattern("[a-z0-9]+([\-\.][a-z0-9]+)*\.[a-z]{2,5}$")]
        [String]$DomainName,

        #Configuring static IP 
        [Parameter(Mandatory=$true, HelpMessage='Specifies the list of subnet names')]
        [String]$SubnetNames,
        [Parameter(Mandatory=$true, HelpMessage='Specifies the Microsoft Azure affinity group the cloud service will reside in. Only valid when creating a new cloud service.')]
        [String]$AffinityGroup,
        [Parameter(Mandatory=$true, HelpMessage='Specifies the virtual network name where the new virtual machine will be deployed.')]
        [String]$VNetName,
        [Parameter(Mandatory=$true, HelpMessage='Specify a static VNet IP Address')]
        [ValidatePattern("\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b")]
        [String]$IP
        
    )

    Begin
    {
    # These variables don't change often hence why they are made static. 
    # When another mayor version releases it's very likely that you'll have to edit these.

    #The windows version from which we'll be taking the most recent version
    $WindowsVersion = “Windows Server 2012 R2 Datacenter”
    
    #Additional Parameters for the AD deployment
    $NetBiosName = $DomainName.Split(".")
    $NetBiosName = $NetBiosName[0]
    $ForestMode = "Win2012R2"
    $DomainMode = "Win2012R2"
    $databasePath = "C:\Windows\NTDS"
    $logPath = "C:\Windows\NTDS"
    $sysVolPath = "C:\Windows\SYSVOL"
    }
    Process
    {
        #Configuration of the Storage account
        
        #This module needs to be imported
        Acquire-AzurePublishSettingsFile -DownloadLocation $DownloadLocation

        Select-AzureSubscription -SubscriptionName $SubscriptionName
        if($CreateStorage){New-AzureStorageAccount -StorageAccountName $StorageName -Location "West Europe"}
        Set-AzureSubscription -SubscriptionName $SubscriptionName -CurrentStorageAccountName $StorageName

        #Creating the VM
        $WindowsImage = Get-AzureVMImage | where { $_.ImageFamily -eq $WindowsVersion } | sort -Property PublishedDate -Descending
        $WindowsImage = $WindowsImage[0].ImageName

        $VirtualMachineCreator = New-AzureVMConfig -Name $VirtualMachineName -InstanceSize $Size -ImageName $WindowsImage `
        | Add-AzureProvisioningConfig -Windows -AdminUsername $adminUserName -Password $adminPassword -DisableGuestAgent `
        | Set-AzureSubnet -SubnetNames $SubnetNames -Verbose | Set-AzureStaticVNetIP -IPAddress $IP `
        | New-AzureVM -ServiceName $VirtualMachineName -VNetName $VNetName -AffinityGroup $AffinityGroup 

        #Starting the VM
        Start-AzureVM -ServiceName $VirtualMachineName -Name $VirtualMachineName -Verbose
        
        #Install the WinRMCertificate
        D:\InstallWinRMCertAzureVM.ps1 -SubscriptionName $SubscriptionName -ServiceName $VirtualMachineName -Name $VirtualMachineName


        #Preparing the remote session to the VM
        :outer while ($true)
        {
            if ((Get-AzureVM -ServiceName $VirtualMachineName -Name $VirtualMachineName).Status -eq "ReadyRole")
            {
                $Uri = Get-AzureWinRMUri -ServiceName $VirtualMachineName -Name $VirtualMachineName -Verbose

                $SecurePassword = ConvertTo-SecureString $adminPassword -AsPlainText -Force
                $AdminCredentials = New-Object System.Management.Automation.PSCredential($adminUserName, $SecurePassword)

                $session = New-PSSession -ConnectionUri $Uri -Credential $AdminCredentials

                break :outer
            }

            "waiting... until connection can be made to the server"
            sleep (10)
        }

        #Renaming the computer
        :outer while ($true)
        {
            if ((Get-AzureVM -ServiceName $VirtualMachineName -Name $VirtualMachineName).Status -eq "ReadyRole")
            {
                Invoke-Command -Session $session -ScriptBlock {

                    Rename-Computer -NewName $VirtualMachineName -Force -Verbose 
                    Restart-Computer
                }

                break :outer
            }

            "waiting..."
            sleep (25)
        }

        # Configure Domain 
        :outer while ($true)
        {
            if ((Get-AzureVM -ServiceName $VirtualMachineName -Name $VirtualMachineName).Status -eq "ReadyRole")
            {
                Invoke-Command -Session $session -ScriptBlock {

                # Install domain services 
                Install-WindowsFeature AD-Domain-Services -IncludeManagementTools


                # Create New Forest, add Domain Controller 
                Import-Module ADDSDeployment

                #Domain

                Install-ADDSForest `
                -InstallDns `
                -DatabasePath $DatabasePath `
                -DomainMode $DomainMode `
                -DomainName $DomainName `
                -DomainNetbiosName $NetbiosName `
                -ForestMode $ForestMode `
                -LogPath $LogPath `
                -SysvolPath $SysVolPath `
                -Safemodeadministratorpassword ($SecurePassword) `
                -Force

                break :outer
            }

            "waiting..."
            sleep (25)
            }
        }


    }
    End
    {
    }
}