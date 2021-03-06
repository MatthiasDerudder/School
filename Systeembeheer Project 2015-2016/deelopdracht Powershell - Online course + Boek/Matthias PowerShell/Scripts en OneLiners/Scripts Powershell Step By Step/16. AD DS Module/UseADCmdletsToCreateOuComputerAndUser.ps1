# ---------------------------------------------
# UseADCmdletsToCreateOuComputerAndUser.ps1
#
# ed wilson, msft, 4/8/2012
#
# PowerShell 3 Step by Step
#
# chapter 16
# --------------------------------------------

Import-Module -Name ActiveDirectory
$Name = "HSG_ScriptTest"
$DomainName = "dc=nwtraders,dc=com"
$OUPath = "ou={0},{1}" -f $Name, $DomainName

New-ADOrganizationalUnit -Name $Name -Path $DomainName -ProtectedFromAccidentalDeletion $false

For($i = 0; $i -le 5; $i++)
{
 New-ADOrganizationalUnit -Name $Name$i -Path $OUPath -ProtectedFromAccidentalDeletion $false
}

For($i = 0 ; $i -le 5; $i++)
{
 New-ADComputer -Name  "HSGTestComputer$i" -Path $OUPath
 New-ADUser -Name "HSGTestUser$i" -Path $OUPath
}