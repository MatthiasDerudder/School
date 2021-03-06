# -----------------------------------------------------------------------------
# Get-MyModule.ps1
# ed wilson, msft, 6/30/2012
# 
# 
# -----------------------------------------------------------------------------
Function Get-MyModule
{
 Param([string]$name)
 if(-not(Get-Module -name $name)) 
   { 
    if(Get-Module -ListAvailable | 
        Where-Object { $_.name -eq $name })
       { 
        Import-Module -Name $name 
        $true
       } #end if module available then import
    else { $false } #module not available
    } # end if not module
  else { $true } #module already loaded
        
} #end function get-MyModule

get-mymodule -name "bitsTransfer"