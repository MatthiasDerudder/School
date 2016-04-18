<#
.Synopsis
   Create a partion, format to the correct FileSystem and label it. 
.DESCRIPTION
   Using the variable DriveLetter,which will asign a driveletter, MbrType and Disknumber,which will provide the path to the right disk, we create a new partion. We take this partion and format it using format-volume for this we use the variable FileSystem, which will decide which filesystem it will format to, and the boolean Compress, which will decide whether the volume will be compressed or not. Lastly we label the new volume usiong the variable Label.
.EXAMPLE
PS C:\> Make-Volume -DriveLetter K -SizeInMB 10000 -Label "This is an example" -DiskNumber 0 -MbrType IFS -FileSystem NTFS -Compress $false


   Disk Number: 0

PartitionNumber  DriveLetter Offset                                   Size Type
---------------  ----------- ------                                   ---- ----
8                K           147309199360                          9.77 GB IFS

Confirm
Are you sure you want to perform this action?
Warning, all data on the volume will be lost!
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

DriveLetter     : K
DriveType       : Fixed
FileSystem      : NTFS
FileSystemLabel :
HealthStatus    : Healthy
ObjectId        : \\?\Volume{956cb0a5-85fb-11e5-9439-080027037fd8}\
Path            : \\?\Volume{956cb0a5-85fb-11e5-9439-080027037fd8}\
Size            : 10485755904
SizeRemaining   : 10394501120
PSComputerName  :


#The volume will now be available

PS C:\> Get-Volume |ft -AutoSize

DriveLetter FileSystemLabel                FileSystem DriveType HealthStatus SizeRemaining      Size
----------- ---------------                ---------- --------- ------------ -------------      ----
            System Reserved                NTFS       Fixed     Healthy           76.63 MB    350 MB
            PFSV1 2012_12_02 21:30 DISK_01 NTFS       Fixed     Healthy          139.22 GB 159.86 GB
F           PFSV1Data                      NTFS       Fixed     Healthy            9.24 GB   9.77 GB
G           PFSV1Dist                      NTFS       Fixed     Healthy           19.59 GB     20 GB
H           PFSV1SPEC                      FAT32      Fixed     Healthy            4.87 GB   4.87 GB
J           BackupOnce                     NTFS       Fixed     Healthy           14.06 GB  14.65 GB
K           This is an example             NTFS       Fixed     Healthy            9.68 GB   9.77 GB
C           PFSV1Syst                      NTFS       Fixed     Healthy           53.13 GB  68.02 GB
E           PFSV1Appl                      NTFS       Fixed     Healthy           19.13 GB  19.53 GB
D           VBOXADDITIONS_5.               CDFS       CD-ROM    Healthy                0 B  55.89 MB
.EXAMPLE

PS C:\> Make-Volume -DriveLetter K -SizeInMB 10000 -Label "This is an example" -D
iskNumber 0 -MbrType IFS -FileSystem NTFS -Compress $true


   Disk Number: 0

PartitionNumber  DriveLetter Offset                                   Size Type
---------------  ----------- ------                                   ---- ----
8                K           147309199360                          9.77 GB IFS

Confirm
Are you sure you want to perform this action?
Warning, all data on the volume will be lost!
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

DriveLetter     : K
DriveType       : Fixed
FileSystem      : NTFS
FileSystemLabel :
HealthStatus    : Healthy
ObjectId        : \\?\Volume{956cb0cf-85fb-11e5-9439-080027037fd8}\
Path            : \\?\Volume{956cb0cf-85fb-11e5-9439-080027037fd8}\
Size            : 10485755904
SizeRemaining   : 10394439680
PSComputerName  :


#The volume will be available and compressed:

PS C:\Users\Administrator\Documents> Get-WmiObject Win32_Volume -ComputerName "localhost"  | Select Name,Label
,Filesystem,Compressed | ft -AutoSize

Name                                              Label                          Filesystem Compressed
----                                              -----                          ---------- ----------
\\?\Volume{a9e17183-f7f9-11e1-93e8-806e6f6e6963}\ System Reserved                NTFS            False
\\?\Volume{7b553e1d-7a69-4d31-bfa2-f61ae41c0576}\ PFSV1 2012_12_02 21:30 DISK_01 NTFS            False
F:\                                               PFSV1Data                      NTFS             True
G:\                                               PFSV1Dist                      NTFS             True
H:\                                               PFSV1SPEC                      FAT32
J:\                                               BackupOnce                     NTFS            False
K:\                                               This is an example             NTFS             True
C:\                                               PFSV1Syst                      NTFS            False
E:\                                               PFSV1Appl                      NTFS            False
D:\                                               VBOXADDITIONS_5.               CDFS

.Notes
    Author: Matthias Derudder
#>
function Make-Volume
{
    [CmdletBinding(confirmImpact='High')]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,
                    HelpMessage= 'Give a DriveLetter. For example: C')]
        [char]$DriveLetter,
        [Parameter(Mandatory=$true,
                    HelpMessage= 'Give the size in MB')]
        #Must be in MB!
        [uint64]$SizeInMB,
        [Parameter(Mandatory=$true,
                    HelpMessage= 'Give the desired label')]
        [string]$Label,
        [Parameter(Mandatory=$true,
                    HelpMessage= 'Give the desired disk number')]
        #If you dont know what to pick here just take IFS
        [uint32]$DiskNumber,
        [Parameter(Mandatory=$True,
                    HelpMessage= 'Give the desired Mbrtype')]
        [ValidateSet('Extended','FAT12','FAT16','FAT32','Huge','IFS')]
        [string]$MbrType,
        [Parameter(Mandatory=$true,
                    HelpMessage= 'Give the desired FileSystem')]
                    [ValidateSet('ExFAT','FAT','FAT32','NTFS','reFS')]
        [string]$FileSystem,
        [Parameter(Mandatory=$true,
                    HelpMessage= 'Do you want to compress?')]
        [Boolean]$Compress

    )

    Begin{}
    Process
    {
    #Setting size to MB
    $SizeInMB= $SizeInMB*1048576
    #Create the partition
    New-Partition -DriveLetter $DriveLetter -Size $SizeInMB -MbrType $MbrType -DiskNumber $DiskNumber
    #Format
    if($Compress)
    {Get-Partition -DriveLetter $DriveLetter | format-volume -FileSystem $FileSystem -Compress}
    else
    {Get-Partition -DriveLetter $DriveLetter | format-volume -FileSystem $FileSystem}
    #Label
    Get-Volume -DriveLetter $DriveLetter | Set-Volume -NewFileSystemLabel $Label
    }
    End{}
}