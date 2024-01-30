#!/bin/bash

echo "=============================================="
echo "      Welcome to DocuGen Setup Script        "
echo "=============================================="
echo ""

read -p "Select the project to set up (Enter 'R' for React, 'A' for Angular): " choice

case $choice in
[Rr])
    powershell_script="setup_context_menu_react.ps1"
    ;;
[Aa])
    powershell_script="setup_context_menu_angular.ps1"
    ;;
*)
    echo "Invalid choice. Please enter 'R' for React or 'A' for Angular."
    exit 1
    ;;
esac

base_directory="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
powershell_script_path="$base_directory\\$powershell_script"

# Check if the PowerShell script file exists
if [ ! -f "$powershell_script_path" ]; then
    echo "Error: PowerShell script file does not exist at the specified path: $powershell_script_path"
    exit 1
fi

# Run the selected PowerShell script
pwsh -ExecutionPolicy Bypass -File "$powershell_script_path"

echo "Setup complete!"
