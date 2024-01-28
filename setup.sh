#!/bin/bash

echo "=============================================="
echo "      Welcome to DocuGen Setup Script        "
echo "=============================================="
echo ""

read -p "Select the project to set up (Enter 'R' for React, 'A' for Angular): " choice

case $choice in
  [Rr])
    project_type="React"
    icon_url="https://example.com/react_icon.ico"
    ;;
  [Aa])
    project_type="Angular"
    icon_url="https://example.com/angular_icon.ico"
    ;;
  *)
    echo "Invalid choice. Please enter 'R' for React or 'A' for Angular."
    exit 1
    ;;
esac

base_directory="C:/Users/ericf/Desktop/DocuGen-byBrick/DocGen"
scripts_directory="$base_directory"

mkdir -p "$base_directory"

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$base_directory/setup_log.txt"
}

handle_error() {
  echo "Error: $1"
  exit 1
}

setup_angular() {
  log "Setting up Angular with Compodoc for an existing project..."
  echo "Setting up Angular..."
  npx -p @compodoc/compodoc compodoc -p
}

setup_react() {
  log "Setting up React with Storybook for an existing project..."
  echo "Setting up React..."
  cd "$base_directory/"
  npx -p @storybook/cli sb init
  pnpm run storybook1
}

install_documentation_generators() {
  log "Installing documentation generators using PowerShell..."
  echo "Installing documentation generators..."
  if [ ! -f "$base_directory/context_menu_log.txt" ]; then
    handle_error "Context menu not installed. Please run the context menu setup first."
  fi
}

setup_context_menu() {
  log "Setting up context menu entries using PowerShell..."
  if [ "$project_type" == "Angular" ]; then
    echo "Running Angular context menu setup..."
    powershell -ExecutionPolicy Bypass -File "$base_directory/setup_context_menu_angular.ps1"
  elif [ "$project_type" == "React" ]; then
    echo "Running React context menu setup..."
    powershell -ExecutionPolicy Bypass -File "$base_directory/setup_context_menu_react.ps1"
  fi
}

setup_registry_and_launcher() {
  log "Setting up registry and context menu launcher using PowerShell..."
  if [ "$project_type" == "Angular" ]; then
    echo "Running Angular registry setup and launcher script..."
    powershell -ExecutionPolicy Bypass -File "$base_directory/setup_context_menu_angular.ps1"
  elif [ "$project_type" == "React" ]; then
    echo "Running React registry setup and launcher script..."
    powershell -ExecutionPolicy Bypass -File "$base_directory/setup_context_menu_react.ps1"
  fi
}

# Display the current value of the scripts_directory variable
echo "Scripts Directory: $base_directory"

# Check if the Angular script file exists
angular_script="$base_directory/setup_context_menu_angular.ps1"
if [ -f "$angular_script" ]; then
    echo "Angular script file exists."
else
    echo "Angular script file does not exist at the specified path: $angular_script"
fi

# Check if the React script file exists
react_script="$base_directory/setup_context_menu_react.ps1"
if [ -f "$react_script" ]; then
    echo "React script file exists."
else
    echo "React script file does not exist at the specified path: $react_script"
fi

# Check if the documentation generators script file exists
documentation_generators_script="$base_directory/install_documentation_generators.ps1"
if [ -f "$documentation_generators_script" ]; then
    echo "Documentation generators script file exists."
else
    echo "Documentation generators script file does not exist at the specified path: $documentation_generators_script"
fi

ask_for_confirmation() {
  read -p "Do you want to proceed with setup? (y/n): " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    log "Operation canceled by the user."
    exit 0
  fi
}

mkdir -p "$base_directory"
mkdir -p "$scripts_directory"

ask_for_confirmation

if [ "$project_type" == "Angular" ]; then
  setup_angular
elif [ "$project_type" == "React" ]; then
  setup_react
fi

setup_context_menu

read -p "Do you want to set up registry and context menu launcher? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  setup_registry_and_launcher
fi

log "Setup complete!"
echo "Setup complete!"
