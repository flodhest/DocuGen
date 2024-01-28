# 🛠️ DocuGen Setup Script

## Introduction

Welcome to the DocuGen Setup Script! This script automates the setup process for generating documentation for React and Angular projects. It streamlines the installation of necessary tools and configurations, making it easier to generate documentation for your projects.

## Functionality

### 1. Setup Options

- **React Setup**: Configures the environment for generating documentation for React projects using Storybook.
- **Angular Setup**: Sets up the environment for generating documentation for Angular projects using Compodoc.

### 2. Context Menu Integration

- Adds context menu entries in Windows Explorer for easy access to documentation generation options.
- Provides seamless integration with the Windows context menu for both React and Angular projects.

### 3. Documentation Generation

- Installs necessary documentation generators and tools automatically.
- Ensures that all dependencies are in place for smooth documentation generation.

### 4. Logging

- Logs setup actions and errors to a `setup_log.txt` file for easy troubleshooting and tracking.

## Usage

1. Run the script and choose the project type (React or Angular).
2. Follow the prompts to proceed with the setup.
3. The script will handle the installation of necessary dependencies and configurations.
4. Upon completion, the setup log will be available for reference.

## Requirements

- Windows operating system
- PowerShell (version 5.1 or later)

## Setup

1. Clone or download the repository.
2. Ensure that PowerShell execution policy allows running scripts (`Set-ExecutionPolicy RemoteSigned`).
3. Run the `./setup.dh` script as an administrator in bash

## Troubleshooting

- If encountering errors, check the setup log (`setup_log.txt`) for details.
- Ensure that all prerequisites are met and paths are correctly configured.

## License

This project is licensed under the [MIT License](LICENSE).
