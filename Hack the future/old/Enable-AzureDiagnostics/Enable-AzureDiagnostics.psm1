<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   PS C:\> Enable-AzureDiagnostics -StorageName "g06storage" -ServiceName "G06Service" -VirtualMachineName "G06srv1" -Verbo
se
VERBOSE: 19:32:37 - Begin Operation: Get-AzureStorageKey
VERBOSE: 19:32:39 - Completed Operation: Get-AzureStorageKey
VERBOSE: 19:32:39 - Begin Operation: Get-AzureVMAvailableExtension
VERBOSE: 19:32:42 - Completed Operation: Get-AzureVMAvailableExtension
VERBOSE: 19:32:44 - Completed Operation: Get Deployment
VERBOSE: 19:32:46 - Completed Operation: Get Deployment
VERBOSE: 19:32:46 - Begin Operation: Update-AzureVM

VERBOSE: 19:33:25 - Completed Operation: Update-AzureVM
OperationDescription OperationId                          OperationStatus
-------------------- -----------                          ---------------
Update-AzureVM       a0063817-716c-3f79-986f-036ea48c71df Succeeded

.EXAMPLE
   Another example of how to use this cmdlet
#>
function Enable-AzureDiagnostics
{
    [CmdletBinding()]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true)]
        [string]$StorageName,
        [Parameter(Mandatory=$true)]
        [string]$ServiceName,
        [Parameter(Mandatory=$true)]
        [string]$VirtualMachineName
    )

    Begin
    {
    }
    Process
    {
    #Construct Azure Diagnostics public config and convert to config format

    # Collect just system error events:
    $wad_xml_config = "<WadCfg><DiagnosticMonitorConfiguration><WindowsEventLog scheduledTransferPeriod=""PT1M""><DataSource name=""System!* "" /></WindowsEventLog></DiagnosticMonitorConfiguration></WadCfg>"

    $wad_b64_config = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($wad_xml_config))
    $wad_public_config = [string]::Format("{{""xmlCfg"":""{0}""}}",$wad_b64_config)

    #Construct Azure diagnostics private config

    $wad_storage_account_key = (Get-AzureStorageKey $StorageName).Primary
    $wad_private_config = [string]::Format("{{""storageAccountName"":""{0}"",""storageAccountKey"":""{1}""}}",$StorageName,$wad_storage_account_key)

    #Enable Diagnostics Extension for Virtual Machine

    $wad_extension_name = "IaaSDiagnostics"
    $wad_publisher = "Microsoft.Azure.Diagnostics"
    $wad_version = (Get-AzureVMAvailableExtension -Publisher $wad_publisher -ExtensionName $wad_extension_name).Version # Gets latest version of the extension

    (Get-AzureVM -ServiceName $ServiceName -Name $VirtualMachineName) | Set-AzureVMExtension -ExtensionName $wad_extension_name -Publisher $wad_publisher -PublicConfiguration $wad_public_config -PrivateConfiguration $wad_private_config -Version $wad_version | Update-AzureVM

    }
    End
    {
    }
}