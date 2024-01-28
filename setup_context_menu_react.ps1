# Set base directory
$baseDirectory = "C:\Users\ericf\Desktop\DocuGen-byBrick\DocGen"  # Update this with your actual base directory
$logFile = "$baseDirectory\context_menu_log.txt"
$iconPath = "$baseDirectory\react_icon.ico"  # Update this with the path to your React icon

# Function for logging
function Log {
    param([string]$message)
    Add-Content -Path $logFile -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $message"
}

# Log setup
Log "Setting up React context menu..."

# Create main menu registry key
$mainMenuRegistryPath = "HKCU:\Software\Classes\Directory\Background\shell\RustCLI"
New-Item -Path $mainMenuRegistryPath -Force | Out-Null

# Set main menu registry values
Set-ItemProperty -Path $mainMenuRegistryPath -Name "(Default)" -Value "RustCLI"

# Create subgroup for React
$reactSubMenuRegistryPath = "$mainMenuRegistryPath\ReactStorybook"
New-Item -Path $reactSubMenuRegistryPath -Force | Out-Null

# Set subgroup registry values
Set-ItemProperty -Path $reactSubMenuRegistryPath -Name "(Default)" -Value "Generate React Docs"
Set-ItemProperty -Path $reactSubMenuRegistryPath -Name "Icon" -Value $iconPath

# Create command registry key for React subgroup
$commandRegistryPath = "$reactSubMenuRegistryPath\command"
New-Item -Path $commandRegistryPath -Force | Out-Null

# Set command registry value for React subgroup
Set-ItemProperty -Path $commandRegistryPath -Name "(Default)" -Value "cmd.exe /k `"npx -p @storybook/cli sb init && pnp1m run storybook1`""

# Log completion
Log "Context menu entry added successfully for React."
Log "React context menu setup completed."
