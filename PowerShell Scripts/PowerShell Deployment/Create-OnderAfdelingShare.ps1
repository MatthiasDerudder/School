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
function Create-OnderAfdelingShares
{
    [CmdletBinding()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true)]
        [String]
        $OnderAfdeling,
        [Parameter(Mandatory=$true)]
        [String]
        $Afdeling
    )

    Begin
    {
    }
    Process
    {
    Cd f:\afdelingsfolders\afdeling$Afdeling
Mkdir OnderAfdeling$OnderAfdeling

New-ADGroup -Name "T_OnderAfdeling$OnderAfdeling" -GroupScope DomainLocal -Description "Toegang tot de afdelingsfolder"  -Path "OU=$OnderAfdeling,OU=$Afdeling,OU=PFAfdelingen,DC=Poliforma,DC=nl"

Add-ADGroupMember -Identity "T_OnderAfdeling$OnderAfdeling" -Members "CN=$OnderAfdeling,OU=$OnderAfdeling,OU=$Afdeling,OU=PFAfdelingen,DC=PoliForma,DC=nl"

New-SmbShare -Name "OnderAfdeling$OnderAfdeling" -Path "F:\afdelingsfolders\Afdeling$Afdeling\Onderafdeling$OnderAfdeling" -Description "Share op de folder voor de Onderafdeling $OnderAfdeling"

Revoke-SmbShareAccess -Name "OnderAfdeling$OnderAfdeling" -AccountName Everyone

Grant-SmbShareAccess -Name "OnderAfdeling$OnderAfdeling" -AccountName BUILTIN\Administrators -AccessRight Full

Grant-SmbShareAccess -Name "OnderAfdeling$OnderAfdeling" -AccountName POLIFORMA\T_OnderAfdeling$OnderAfdeling -AccessRight Change
    }
    End
    {
    }
}