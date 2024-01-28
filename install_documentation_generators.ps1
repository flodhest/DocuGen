# Set base directory
$baseDirectory = "C:\Users\ericf\RustDocsCL"  # Set a default or read from a configuration file
$logFile = "$baseDirectory\documentation_generators_log.txt"

# Function for logging
function Log {
    param([string]$message)
    Add-Content -Path $logFile -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $message"
}


Log "Installing documentation generators for existing projects..."

# Your documentation generators installation code here

Log "Documentation generators installed successfully."

# Log completion
Log "Documentation generators installation completed."