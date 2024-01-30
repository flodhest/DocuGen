$baseDirectory = "C:\Users\ericf\Desktop\DocuGen-byBrick\DocGen"
$logFile = "$baseDirectory\context_menu_log.txt"

function Log {
    param([string]$message)
    Add-Content -Path $logFile -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $message"
}

function Setup-ContextMenuAngular {
    Log "Setting up Angular context menu..."
    $mainMenuRegistryPath = "HKCU:\Software\Classes\Directory\Background\shell\Angular"
    New-Item -Path $mainMenuRegistryPath -Force | Out-Null
    Set-ItemProperty -Path $mainMenuRegistryPath -Name "(Default)" -Value "Angular Compodoc"
    Set-ItemProperty -Path $mainMenuRegistryPath -Name "Icon" -Value "$baseDirectory\Angular.ico"
    $commandRegistryPath = "$mainMenuRegistryPath\command"
    New-Item -Path $commandRegistryPath -Force | Out-Null
    $installCommand = 'if (-not (Test-Path -Path ".\documentation" -PathType Container)) { mkdir ".\documentation" } ; echo "{`n  `"title`": `"My Angular Project Documentation`",`n  `"output`": `"./documentation`",`n  `"tsconfig`": `"./tsconfig.app.json`",`n  `"extTheme`": `"./documentation/theme/my-theme.css`",`n  `"overview`": `"./documentation/overview.md`",`n  `"disableSourceCode`": false`n}" | Out-File -FilePath ".\compodoc.json" -Encoding utf8 ; npx -p @compodoc/compodoc compodoc -p tsconfig.app.json -s'
    Set-ItemProperty -Path $commandRegistryPath -Name "(Default)" -Value "cmd.exe /c start powershell -NoProfile -ExecutionPolicy Bypass -NoExit -Command `"$installCommand`""
    Log "Angular context menu entry added successfully."
    Log "Angular context menu setup completed."
}

Setup-ContextMenuAngular
