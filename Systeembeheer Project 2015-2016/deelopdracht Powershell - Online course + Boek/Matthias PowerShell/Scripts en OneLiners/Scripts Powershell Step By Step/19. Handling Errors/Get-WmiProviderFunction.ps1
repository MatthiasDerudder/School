# -----------------------------------------------------------------------------
# Script: Get-WmiProviderFunction.ps1
# Author: ed wilson, msft
# Date: 04/22/2012 16:46:56
# Keywords: Scripting Techniques, Error Handling
# comments: Handling missing WMI providers
# PowerShell 3.0 Step-by-Step, Microsoft Press, 2012
# Chapter 19
# -----------------------------------------------------------------------------
Function Get-WmiProvider([string]$providerName, [switch]$verbose)
{
 $oldVerbosePreference = $VerbosePreference
 if($verbose) { $VerbosePreference = "continue" }
 $provider =  Get-WmiObject -Class __provider -filter "name = '$providerName'"
 If($provider -ne $null)
   {
    $clsID = $provider.clsID
    Write-Verbose "$providerName WMI provider found. ClsID is $($clsID)"
   }
 Else 
   {
     Return $false
   }
   Write-Verbose "Checking for proper registry registration ..."
   If(Test-Path -path HKCR:)
      {
        Write-Verbose "HKCR: drive found. Testing for $clsID"
        Test-path -path (Join-Path -path HKCR:\CLSID -childpath $clsID)  
      }
   Else
     {
      Write-Verbose "HKCR: drive not found. Creating same." 
      New-PSDrive -Name HKCR -PSProvider registry -Root Hkey_Classes_Root | Out-Null
      Write-Verbose "Testing for $clsID" 
      Test-path -path (Join-Path -path HKCR:\CLSID -childpath $clsID)  
      Write-Verbose "Test complete."
      Write-Verbose "Removing HKCR: drive." 
      Remove-PSDrive -Name HKCR | Out-Null
     }
  $VerbosePreference = $oldVerbosePreference
} #end Get-WmiProvider function

# *** Entry Point to Script ***
$providerName = "msiprov"
 if(Get-WmiProvider -providerName $providerName  -verbose ) 
  { 
    Get-WmiObject -class win32_product 
  } 
else 
  { 
   "$providerName provider not found" 
  }
