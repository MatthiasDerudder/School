# -----------------------------------------------------------------
# Script to set a Windows Server Backup policy for a server
#
# Assumes: Volumes C: and D: to backup.
#        : Target - \storageserverserverbackup
#        : Exclusions - D:temp, D:Users*.MP3, D:Users*.WMA
#        : VSS Mode - Full Backup
#        : System State - True
#        : Bare Metal Recovery - True
#        : Schedule - 12:30 PM, 11:00 PM
# Requires: Elevated PowerShell 
#         :   (Must be run As Administrator)
# 
# Planned Improvements: [minor] Check for elevated priv, error politely if not
#                     : [minor] Check for Server Backup PSSnapin before trying to load
#                     : [major] Accept cmdline parameters
#
# ModHist: 1/31/11 - initial (Charlie Russel)
#        : 
#
# With profound thanks to Richard Siddaway, Windows PowerShell MVP
# -----------------------------------------------------------------
# By default, the PSSnapin isn''t loaded automatically, so first load it.
Add-PSSnapin Windows.ServerBackup # will error if already loaded, but continue
# First, create a new empty policy
# Alternately, you can open the existing policy in Edit mode with 
#   $BackupPolicy = Get-WBPolicy -edit
$BackupPolicy = New-WBPolicy
# Now,define the parts of it. 
# First,let''s do the "source" volumes that will be part of the backup. 
# This requires us to first get a list of them, and then parse that list 
# to add the ones we want (C: and D:)
# We don''t actually need C:, since we''ll get that as part of Bare Metal Restore, 
# but we include it anyway for completeness
$volC = Get-WBVolume -AllVolumes | Where {$_.MountPath -eq "C:"}
$volD = Get-WBVolume -AllVolumes | Where {$_.MountPath -eq "E:"}
$volF = Get-WBVolume -AllVolumes | Where {$_.MountPath -eq "F:"}
$volG = Get-WBVolume -AllVolumes | Where {$_.MountPath -eq "G:"}
$Volumes = $volC,$volD,$volF,$volG
# Now, add those volumes to the blank policy. 
Add-WBVolume -policy $BackupPolicy -volume $Volumes
# If you want to do the entire volume, you don''t need to define any exclusions, 
# but if you want to exclude any files or folders, you need to define that exclusion
# and add that to the backup policy you''re building. First, define it.  
# and then add that to the policy we''re building
# Define the backup target, this time as a network share. 
# For backup to share, you need to create a credential to connect to the remote share.
# This wouldn''t be required for specifying a removable disk.
# You can specify the username here (DOMAINUser) but will be prompted for password

$Disks = Get-WBDisk
# Now, define the target

$Target = New-WBBackupTarget -Disk $Disks[1]
# Add the target to the policy
Add-WBBackupTarget -policy $BackupPolicy -target $Target
# Define the schedule
$sch1 = [datetime]"01/31/2011 12:30:00"
$sch2 = [datetime]"01/31/2011 21:00:00"
Set-WBSchedule -policy $BackupPolicy -schedule $sch1,$sch2
# Set for system state and for bare metal recovery
Add-WBSystemState -policy $BackupPolicy
Add-WBBareMetalRecovery -policy $BackupPolicy
# Finally, set for full VSS Backup
Set-WBVssBackupOptions -policy $BackupPolicy -VssFullBackup
# Finally, we need to SET the policy before it actually takes control
Set-WBPolicy -force -policy $BackupPolicy
# This completes the configuration of the SBS server backup policy
$Server = (hostname).tolower()
" The server $Server now has the following backup configuration: "
""