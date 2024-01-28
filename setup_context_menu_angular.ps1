# Set base directory
$baseDirectory = "C:\Users\ericf\Desktop\DocuGen-byBrick\DocGen"  # Update this with your actual base directory
$logFile = "$baseDirectory\context_menu_log.txt"
$iconPath = "$baseDirectory\angular_icon.ico"  # Update this with the path to your Angular icon

# Function for logging
function Log {
    param([string]$message)
    Add-Content -Path $logFile -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $message"
}

# Log setup
Log "Setting up Angular context menu..."

# Create main menu registry key
$mainMenuRegistryPath = "HKCU:\Software\Classes\Directory\Background\shell\RustCLI"
New-Item -Path $mainMenuRegistryPath -Force | Out-Null

# Set main menu registry values
Set-ItemProperty -Path $mainMenuRegistryPath -Name "(Default)" -Value "RustCLI"

# Create subgroup for Angular
$angularSubMenuRegistryPath = "$mainMenuRegistryPath\AngularCompodoc"
New-Item -Path $angularSubMenuRegistryPath -Force | Out-Null

# Set subgroup registry values
Set-ItemProperty -Path $angularSubMenuRegistryPath -Name "(Default)" -Value "Generate Angular Docs"
Set-ItemProperty -Path $angularSubMenuRegistryPath -Name "Icon" -Value $iconPath

# Create command registry key for Angular subgroup
$commandRegistryPath = "$angularSubMenuRegistryPath\command"
New-Item -Path $commandRegistryPath -Force | Out-Null

# Set command registry value for Angular subgroup
Set-ItemProperty -Path $commandRegistryPath -Name "(Default)" -Value "cmd.exe /k `"npx -p @compodoc/compodoc compodoc -p`""

# Log completion
Log "Context menu entry added successfully for Angular."
Log "Angular context menu setup completed."
