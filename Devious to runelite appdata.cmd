@echo off

powershell.exe -ExecutionPolicy Bypass -Command "$sourceUrl = 'https://github.com/jbx5/devious-client/releases/download/launcher-1.0.1/devious-client-launcher.jar'; $output = $env:LOCALAPPDATA + '\Runelite\devious-client-launcher.jar'; if (-not (Test-Path $output)) { Invoke-WebRequest -Uri $sourceUrl -OutFile $output }"
