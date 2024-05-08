$admin = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")
if ( $admin ) {
  Write-Output "Running as admin..."
  Stop-Process -Name "*atie*","*RadeonSoftware*","*amd*" -Force -PassThru
  Get-Process | Where-Object {$_.HasExited}
  Restart-Service -name '*amd*','*AUEP*'
  $response = Read-Host -Prompt "Do you want to restart the display driver?"
  if ($response -eq 'y') {
    pnputil /restart-device /class Display
  }
} else {
  $response = Read-Host -Prompt "This script requires elevation. Restart now?"
  if ($response -eq 'y') {
    Write-Output "Restarting as admin..."
    $currentScriptLocation = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath('.\')
    Start-Process powershell -ArgumentList "&'$currentScriptLocation\RadeonRestart.ps1'" -Verb Runas
  }
}