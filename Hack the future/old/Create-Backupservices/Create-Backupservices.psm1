
<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.Notes
Author: Matthias
#>
function Create-Backupservices
{
    [CmdletBinding()]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true)]
        [string]$ResourceGroup,

        [Parameter(Mandatory=$true)]
        [string]$VirtualMachineName,

        # Param2 help description
        [Parameter(Mandatory=$true)]
        [string]$serviceName,
        # Param2 help description
        [Parameter(Mandatory=$true)]
        [string]$Backupname,

        [Parameter(Mandatory=$true)]
        [string]$Location
    )

    Begin
    {
    }
    Process
    {
    #BACKUP
    #Create backupvault

    New-AzureRMResourceGroup –Name $ResourceGroup –Location $Location
    $backupvault = New-AzureRMBackupVault –ResourceGroupName $ResourceGroup –Name $Backupname –Region $Location –Storage GeoRedundant
    $registerjob = Register-AzureRMBackupContainer -Vault $backupvault -Name $VirtualMachineName -ServiceName $serviceName

    #Schedule
    $Daily = New-AzureRMBackupRetentionPolicyObject -DailyRetention -Retention 30
    $newpolicy = New-AzureRMBackupProtectionPolicy -Name DailyBackup01 -Type AzureVM -Daily -BackupTime ([datetime]"3:30 PM") -RetentionPolicy ($Daily) -Vault $backupvault
    Get-AzureRMBackupContainer -Type AzureVM -Status Registered -Vault $backupvault | Get-AzureRMBackupItem | Enable-AzureRMBackupProtection -Policy $newpolicy

    #Backup now
    $container = Get-AzureRMBackupContainer -Vault $backupvault -type AzureVM -name $VirtualMachineName
    $backupjob = Get-AzureRMBackupItem -Container $container | Backup-AzureRMBackupItem
    $backupjob
    }
    End
    {
    }
}