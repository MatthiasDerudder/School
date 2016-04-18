<#
.Synopsis
   Creates a share for the department
.DESCRIPTION
   Long description
.EXAMPLE
  Create-AfdelingShares -Name "Automatisering"
.EXAMPLE
   Another example of how to use this cmdlet
.NOTES
Author = Matthias Derudder 
#>
function Create-afdelingShares
{
    [CmdletBinding()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true)]
        [String]
        $Afdeling
		[Parameter(Mandatory=$true)]
        [String]
		$Domain
    )

    Begin
    {
    }
    Process
    {
    Cd f:\afdelingsfolders\afdeling$Afdeling
Mkdir afdeling$afdeling

New-ADGroup -Name "T_afdeling$afdeling" -GroupScope DomainLocal -Description "Toegang tot de afdelingsfolder"  -Path "OU=$afdeling,OU=$Afdeling,OU=PFAfdelingen,DC=$Domain,DC=nl"

Add-ADGroupMember -Identity "T_afdeling$afdeling" -Members "CN=$afdeling,OU=$afdeling,OU=$Afdeling,OU=PFAfdelingen,DC=$Domain,DC=nl"

New-SmbShare -Name "afdeling$afdeling" -Path "F:\afdelingsfolders\Afdeling$Afdeling\afdeling$afdeling" -Description "Share op de folder voor de afdeling $afdeling"

Revoke-SmbShareAccess -Name "afdeling$afdeling" -AccountName Everyone

Grant-SmbShareAccess -Name "afdeling$afdeling" -AccountName BUILTIN\Administrators -AccessRight Full

Grant-SmbShareAccess -Name "afdeling$afdeling" -AccountName $Domain\T_afdeling$afdeling -AccessRight Change
    }
    End
    {
    }
}