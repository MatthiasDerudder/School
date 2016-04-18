<#
.Synopsis
   Updates all users using a CSV file
.DESCRIPTION
   Imports a CSV file and uses its information to update the ADUsers.
.EXAMPLE
   PS C:\Users\Administrator> Update-ADUsers -CsvLocation .\adusers.csv
.Notes
    Author: Matthias Derudder
#>
function Update-ADUsers
{
    [CmdletBinding(confirmImpact='Medium')]
    Param
    (
        # Give a link to the Csv location
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [string]$CsvLocation
    )

    Begin
    {
    }
    Process
    {
    $Users = @()
If (Test-Path $CsvLocation ) {
   $Users = Import-CSV $CsvLocation | sort name
} else { 
   Throw  "This script requires a CSV file with user names and properties."
}
$Users|Foreach{

        Set-ADUSer -Identity $_.samaccountname`
                -Description $_.description `
              -GivenName $_.givenName `
              -SurName $_.sn `
              -UserPrincipalName $_.sAMAccountName `
              -HomePhone $_.telephoneNumber`
              -Title $_.title`
              -Office $_.physicalDeliveryOfficeName `              -Department $_.department `
              -Company $_.company`
              -Manager $_.manager`
              -OfficePhone $_.telephoneNumber `
              -ErrorAction SilentlyContinue
         
   
    }
    }
    End
    {
    }
}