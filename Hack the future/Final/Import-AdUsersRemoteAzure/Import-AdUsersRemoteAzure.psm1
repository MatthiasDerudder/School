<#
.Synopsis
Imports users from a CSV file
.Description
We extract the AD user information from the csv and create a new aduser in the more session
.Example


.Parameter Path
The path to the input CSV file. The default value is ".\Documents\AdUsers.csv" .
 
.Notes
Authors: Matthias Derudder
         Frederik Van Brussel
#>

Function Import-AdUsersRemoteAzure{


[CmdletBinding()]
Param(
     #The path to the CSV file
     [Parameter(Mandatory=$True)]
     [string]$Path,
     #The service in which the virtual machine is hosted.
     [Parameter(Mandatory=$True)]
     [string]$ServiceName,
     #The name of the virtual machine
     [Parameter(Mandatory=$True)]
     [string]$VirtualMachineName,
     #The path to the logfile, if not existing a new one will be created.
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

    # Check logpath
    If (!(Test-Path $LogPath) ) {
        new-item $LogPath -ItemType File  
    }
    $date = get-date
    "-----Following Users have been added on $date-----" | Out-File $LogPath -append

    

   

    $session = New-PSSession -ComputerName $VirtualMachineName

                

    #Add ad-users on remote session
    :outer while ($true)
        {
            if ((Get-AzureRmVM -ResourceGroupName $ResourceGroupName -Name $VirtualMachineName).Status -eq "ReadyRole")
            {
                $ScriptBlockContent = {
                 Param($user)
                 $sam = $user.SAMAccountName
                 try{
                       New-AdUser -DisplayName $user.DisplayName `
                                  -Description $user.Description `
                                  -GivenName $user.GivenName `
                                  -Name $user.Name `
                                  -SurName $user.SurName `
                                  -SAMAccountName $user.SAMAccountName `
                                  -Enabled $True `
                                  -PasswordNeverExpires $true `
                                  -UserPrincipalName $user.SAMAccountName `
                                  -AccountPassword (ConvertTo-SecureString -AsPlainText -Force -String $user.Password) 

                      Get-ADObject -filter {(ObjectClass -eq "user")} | Where-Object {$_.Name -eq $user.Name} | Set-ADObject -ProtectedFromAccidentalDeletion:$true
                      Try{
                      Add-ADGroupMember -Identity $user.Security -Members $user.SAMAccountName
                      }
                      Catch{
                      New-ADGroup -Name $user.Security -GroupScope Global -GroupCategory Security
                      Add-ADGroupMember -Identity $user.Security -Members $user.SAMAccountName
                      }

                      Write-Host "The user $sam has been successfully added."
                      new-object pscustomobject –property @{
                      logobject = "$sam has been succesfully added"
                      }
                      }
                 Catch{
                      Write-Host "There was an error for $sam. Please consult the log file."
                      new-object pscustomobject –property @{
                      logobject = $Error[0].Exception
                      }
                      }
                    }
                 ForEach ($user in $users ) {

                 $AddUser = Invoke-Command -Session $session -ScriptBlock $ScriptBlockContent -ArgumentList ($user)
                 $sam = $user.SAMAccountName
                 $Logging = $AddUser.logobject
                 "$sam" | Out-File $LogPath -append
                 $Logging | Out-File $LogPath -append
                 
                 }
 
                break :outer
              }
             "Waiting until the VirtualMachine is Ready"
              sleep (10)
                 
            }
            $Error.Exception
            
      }
      End
    {
    
       
        
    }
   }
   

