$baseDirectory = "C:\Users\ericf\Desktop\DocuGen-byBrick\DocGen"
$logFile = "$baseDirectory\context_menu_log.txt"

function Log {
    param([string]$message)
    Add-Content -Path $logFile -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $message"
}

function Setup-ContextMenuReact {
    Log "Setting up React context menu..."
    $mainMenuRegistryPath = "HKCU:\Software\Classes\Directory\Background\shell\React"
    New-Item -Path $mainMenuRegistryPath -Force | Out-Null
    Set-ItemProperty -Path $mainMenuRegistryPath -Name "(Default)" -Value "React Storybook"
    Set-ItemProperty -Path $mainMenuRegistryPath -Name "Icon" -Value "$baseDirectory\React.ico"
    $commandRegistryPath = "$mainMenuRegistryPath\command"
    New-Item -Path $commandRegistryPath -Force | Out-Null
    $installCommand = "npx -p @storybook/cli sb init ; npm run storybook"
    Set-ItemProperty -Path $commandRegistryPath -Name "(Default)" -Value ('cmd.exe /c start powershell -NoProfile -ExecutionPolicy Bypass -NoExit -Command "{0}"' -f $installCommand)
    Log "React context menu entry added successfully."
    Log "React context menu setup completed."
}

Setup-ContextMenuReact
