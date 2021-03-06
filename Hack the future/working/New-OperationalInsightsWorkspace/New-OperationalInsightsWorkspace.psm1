﻿<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function New-OperationalInsightsWorkspace
{
    [CmdletBinding()]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true)]
        [string]$StorageName,
        [Parameter(Mandatory=$true)]
        [string]$Location,
        [Parameter(Mandatory=$true)]
        [string]$WorkspaceName,
        [Parameter(Mandatory=$true)]
        [string]$ServiceName
    )

    Begin
    {
    }
    Process
    {
    #Create new OperationalInsightsWorkspace
    New-AzureRmOperationalInsightsWorkspace -ResourceGroupName $ServiceName -Name $WorkspaceName -Location $Location

    #Create a storage for the OperationalInsightsWorkspace
    $StorageNameRM = "$StorageName"+"ops"
    New-AzureRmStorageAccount -ResourceGroupName $ServiceName -Name $StorageNameRM -type Premium_LRS -Location "East US"

    #Adding the storage
    $Storage = Get-AzureRmStorageAccount –ResourceGroupName $ServiceName –Name $StorageNameRM
    $StorageKey = ($Storage | Get-AzureRmStorageAccountKey).Key1
    $ws=Get-AzureRmOperationalInsightsWorkspace -ResourceGroupName $ServiceName -Name $WorkspaceName
    New-AzureRmOperationalInsightsStorageInsight –Workspace $ws –Name $StorageNameRM –StorageAccountResourceId $Storage.Id –StorageAccountKey $StorageKey –Tables @("WADWindowsEventLogsTable")


    }
    End
    {
    }
}