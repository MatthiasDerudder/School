#TrapNonTerminatingError.ps1
try {
 Get-Content bogusFile -Ea stop
 }
Catch [system.Exception] {
  Write-Host $_.Exception.ToString()
}
Finally {Write-Output "error count:" $error.Count}