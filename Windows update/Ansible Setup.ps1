# Change PowerShell execution policy to allow remote scripts
Write-Host "Setting Execution Policy to RemoteSigned"
Set-ExecutionPolicy RemoteSigned -Force

# Check the current PowerShell execution policy
$executionPolicy = Get-ExecutionPolicy
Write-Host "Current Execution Policy: $executionPolicy"

# Check PowerShell version (should be 3.0 or above)
$psVersion = $PSVersionTable.PSVersion
if ($psVersion.Major -lt 3) {
    Write-Host "PowerShell version is lower than 3.0. Please upgrade to continue." -ForegroundColor Red
    exit 1
} else {
    Write-Host "PowerShell version is $psVersion"
}

# Check if WinRM service is running
Write-Host "Checking WinRM listener configuration"
$winrmListener = (winrm enumerate winrm/config/listener)
if ($winrmListener) {
    Write-Host "WinRM service is already running"
} else {
    Write-Host "Starting and configuring WinRM service"
    winrm quickconfig -Force
}

# Enable basic authentication for the WinRM service
Write-Host "Enabling Basic Authentication for WinRM service"
winrm set winrm/config/service/auth '@{Basic="true"}'

# Allow unencrypted data for WinRM service
Write-Host "Allowing unencrypted data for WinRM service"
winrm set winrm/config/service '@{AllowUnencrypted="true"}'

# Confirm WinRM listener status and configuration
Write-Host "WinRM listener configuration:"
winrm enumerate winrm/config/listener

Write-Host "WinRM setup complete."
