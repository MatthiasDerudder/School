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
function Create-GlobalSecurityGroup
{
    [CmdletBinding()]
    Param
    (
        # What should the name be?
        [Parameter(Mandatory=$true)]
        [String]$Name,
        #Where will it be located
        [Parameter(Mandatory=$true)]
        [String]$Path,
        #Who'll be the manager?
        [String]$ManagerName,
        #A description
        [String]$Description
    )

    Begin
    {
    $Manager = Get-ADUser -Filter {name -eq $ManagerName}
    $UsersFromOU = Get-Aduser -filter * | Where-Object {$_.DistinguishedName -Like "*,$Path"}
    $ADGroupPath = "CN=$Name,$Path"
    [String]$Scope = "Global"
    }
    Process
    {
    New-ADGroup -Name $Name -GroupScope $Scope  -ManagedBy $Manager.DistinguishedName -Path $Path -Description $Description 
    Add-ADGroupMember -Identity $ADGroupPath -Members $Manager
    foreach($User in $UsersFromOU){
    Add-ADGroupMember -Identity $ADGroupPath -Members $User
    }
   
    }
    End
    {
    }
}