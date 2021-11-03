## Lactanet VPN Swapper
$url = "https://pkgs.tailscale.com/stable/tailscale-ipn-setup-1.14.4.exe"
$output = "C:\Users\Public\tailscale-ipn-setup-1.14.4.exe"
cls
Write "This script will install Tailscale and remove Hamachi from this computer."
Start-Sleep -Seconds 2
cls
Write "Downloading Tailscale installer..."
import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output
Start-BitsTransfer -Source $url -Destination $output -Asynchronous
Start-Sleep -Seconds 1
cd C:\Users\Public\
Start-Process -Wait -FilePath "C:\Users\Public\tailscale-ipn-setup-1.14.4.exe" -ArgumentList "/S" -PassThru
cls
Write "Installing Tailscale"
cls
Write "Tailscale has been installed successfully"
Start-Sleep -Seconds 2
Write "Cleaning Up"
Start-Sleep -Seconds 1
rm tailscale-ipn-setup-1.14.4.exe
cls
Write "Uninstalling Hamachi..."
get-package Logmein* | uninstall-package
cls
Write "Hamachi Uninstalled Successfully"
Start-Sleep -Seconds 2
cls
Write "Please Log in to Tailscale"
Start-Sleep -Seconds 2
cls
Write "Process Complete. Exiting..."
Start-Sleep -Seconds 3
Stop-Process -Id $PID