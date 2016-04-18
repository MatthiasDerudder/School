<#
.Synopsis
Imports users from a CSV file
.Description
We extract the AD user information from the csv and create a new aduser in the more session
.Example


.Parameter Path
The path to the input CSV file. The default value is ".\Documents\AdUsers.csv" .
 
.Notes
    Author: Matthias Derudder
#>

Function Import-AdUsersRemoteAzure{


[CmdletBinding()]
Param(
     [Parameter(Mandatory=$True)]
     [string]$Path,
     [Parameter(Mandatory=$True)]
     [string]$ServiceName,
     [Parameter(Mandatory=$True)]
     [string]$VirtualMachineName,
     [Parameter(Mandatory=$True)]
     [string]$LogPath

     )
     Begin
    {
      $AdminCredentials = Get-Credential
    }
    Process
    {
    # Initialize CSV
    $users
    If (Test-Path $Path ) {
        $users = Import-CSV $Path
    } else { 
        Throw  "This script requires a CSV file with user names and properties."
    }

    #Install Certificate for remote connections
    Install-WinRMCertificateForVM -ServiceName $ServiceName -Name $VirtualMachineName

    #Create remote session
    :outer while ($true)
        {
            if ((Get-AzureVM -ServiceName $ServiceName -Name $VirtualMachineName).Status -eq "ReadyRole")
            {
                $Uri = Get-AzureWinRMUri -ServiceName $ServiceName -Name $VirtualMachineName 

                $session = New-PSSession -ConnectionUri $Uri -Credential $AdminCredentials

                break :outer
            }

            "Waiting until the VirtualMachine is Ready"
            sleep (10)
        }

    #Add ad-users on remote session
    :outer while ($true)
        {
            if ((Get-AzureVM -ServiceName $ServiceName -Name $VirtualMachineName).Status -eq "ReadyRole")
            {
                $ScriptBlockContent = {
                 Param($user)
                    
                   
                       New-AdUser -DisplayName $user.DisplayName `
                                  -Description $user.Description `
                                  -GivenName $user.GivenName `
                                  -Name $user.Name `
                                  -SurName $user.SurName `
                                  -SAMAccountName $user.SAMAccountName `
                                  -Enabled $True `
                                  -PasswordNeverExpires $true `
                                  -UserPrincipalName $user.SAMAccountName `
                                  -AccountPassword (ConvertTo-SecureString -AsPlainText -Force -String "$user.Password") 

                      Get-ADObject -filter {(ObjectClass -eq "user")} | Where-Object {$_.Name -eq $user.Name} | Set-ADObject -ProtectedFromAccidentalDeletion:$true
                      $sam = $user.SAMAccountName
                      Write-Host "The user $sam has been added."

                    }
                 ForEach ($user in $users ) {
                 Try{
                 Invoke-Command -Session $session -ScriptBlock $ScriptBlockContent -ArgumentList ($user)
                 }
                 Catch
                 {
                    $DisplayName + " had errors during the creation. Please consult the error: $_.Exception.Message" | Out-File $LogPath -append
                 }
                 If(Test-Path $LogPath){
                 $pass = $user.Password
                 $sam = $user.SAMAccountName
                      $DisplayName + "New user added: UserName is $sam, password is $pass." | Out-File $LogPath -append}  
                 }
                break :outer
              }
             "Waiting until the VirtualMachine is Ready"
              sleep (10)
                 
            }
            
      }
      End
    {
    }
   }
   

