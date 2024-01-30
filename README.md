# 🛠️ DocuGen Setup Script

## Introduction

Welcome to the DocuGen Setup Script! This script automates the setup process for generating documentation for React and Angular projects. The script not only adds context menu entries but also automatically generates documentation based on the content and structure of your projects. Choose between React Storybook and Angular Compodoc to suit your project needs.

## Functionality

### 1. Setup Options

- **React Setup:** Configures the environment for generating documentation for React projects using Storybook.
- **Angular Setup:** Sets up the environment for generating documentation for Angular projects using Compodoc.

### 2. Context Menu Integration

- Adds context menu entries in Windows Explorer for easy access to documentation generation options.
- Provides seamless integration with the Windows context menu for both React and Angular projects.

### 3. Documentation Generation

- Installs necessary documentation generators and tools automatically.
- Ensures that all dependencies are in place for smooth documentation generation.

## Usage

1. Ensure that PowerShell execution policy allows running scripts (`Set-ExecutionPolicy RemoteSigned`).
2. Run the `./setup.dh` script as an administrator in bash.
3. This runs the script to add context menu entries for Angular or React.
4. Right-click in your React or Angular-projects rootfolder.
5. Choose either "React Storybook" or "Angular Compodoc" from the context menu.
6. Follow the prompts to initiate automatic documentation generation.

## Requirements

- Existing Angular or React project.
- Windows operating system
- PowerShell (version 5.1 or later)

## License

This project is licensed under the [MIT License](LICENSE).
