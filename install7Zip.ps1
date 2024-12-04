# Define the URL for the 7-Zip download page
$7zipUrl = "https://www.7-zip.org/"

# Get the download link for the latest 64-bit version of 7-Zip
$downloadLink = Invoke-WebRequest -Uri $7zipUrl | Select-Object -ExpandProperty Links | Where-Object { $_.href -match "7z.*-x64.exe" } | Select-Object -First 1 -ExpandProperty href

# Combine the base URL with the download link
$downloadUrl = "$7zipUrl$downloadLink"

# Define the path to save the installer
$installerPath = "$env:TEMP\7zip.exe"

# Download the installer
Invoke-WebRequest -Uri $downloadUrl -OutFile $installerPath

# Install 7-Zip silently
Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

# Remove the installer after installation
Remove-Item $installerPath

Write-Output "7-Zip has been installed successfully."
