## Lactanet VPN Swapper
$url = "https://pkgs.tailscale.com/stable/tailscale-ipn-setup-1.16.2.exe"
$output = "C:\Users\Public\tailscale-ipn-setup-1.16.2.exe"
$start_time = Get-Date
cls
Write "This program will install Tailscale and remove Hamachi from this computer."
Start-Sleep -Seconds 2
cls
Write "Downloading Tailscale installer..."
Invoke-WebRequest -Uri $url -OutFile $output
Write "Download Complete"
cd C:\Users\Public\
Write "Installing Tailscale..."
Start-Process -Wait -FilePath "C:\Users\Public\tailscale-ipn-setup-1.16.2.exe" -ArgumentList "/S" -PassThru
Write "Tailscale has been installed successfully"
Start-Sleep -Seconds 2
Write "Cleaning Up"
Start-Sleep -Seconds 2
rm tailscale-ipn-setup-1.16.2.exe
rm tsdl.ps1
rm tsdldownloader.ps1
cls
Write "Uninstalling Hamachi..."
get-package Logmein* | uninstall-package
Write "Hamachi Uninstalled Successfully"
Start-Sleep -Seconds 2
cls
Write "Please Log in to Tailscale"
iex "tailscale up"
Start-Sleep -Seconds 2
cls
Write "Process Complete. Exiting..."
Sleep-Wait -Seconds 3
Stop-Process -Id $PID
