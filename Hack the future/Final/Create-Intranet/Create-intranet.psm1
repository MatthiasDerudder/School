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
function Create-IntranetSite
{
    [CmdletBinding()]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true)]
        $locationsite,
        [Parameter(Mandatory=$true)]
        $site,
        [Parameter(Mandatory=$true)]
        $IP

    )

    Begin
    {

    $session =  New-PSSession -ComputerName $VMName
    $site = Get-ChildItem -Path $locationsite

    $ScriptBlockContent = {
    Param($site)
    Install-WindowsFeature Web-WebServer -IncludeManagementTools
    Import-Module WebAdministration
    Get-ChildItem -Path C:\inetpub\wwwroot | Remove-Item -Force -Recurse
    $site | Move-Item  -Destination C:\inetpub\wwwroot 
    Add-DnsServerResourceRecordA -Name "IntraNet" -ZoneName $env:USERDNSDOMAIN -AllowUpdateAny -IPv4Address $IP 
    }
    Invoke-Command -Session $session -ScriptBlock $ScriptBlockContent -ArgumentList ($site)
    
    Import-
    }
    Process
    {
    }
    End
    {
    }
}