# -----------------------------------------------------------------------------
# Script: Get-BiosInformation.ps1
# Author: ed wilson, msft
# Date: 04/22/2012 16:29:45
# Keywords: Scripting Techniques, Error Handling
# comments: 
# PowerShell 3.0 Step-by-Step, Microsoft Press, 2012
# Chapter 19
# -----------------------------------------------------------------------------
Param(
  [string]$computerName
) #end param

Function Get-BiosInformation($computerName)
{
 Get-WmiObject -class Win32_Bios -computerName $computername
} #end function Get-BiosName

# *** Entry Point To Script ***
If(-not($computerName)) { $computerName = $env:computerName }
Get-BiosInformation -computerName $computername
