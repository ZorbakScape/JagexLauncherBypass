@echo off

set devious_launcher=https://github.com/jbx5/devious-client/releases/download/launcher-1.0.1/devious-client-launcher.jar
set runelite_folder=%LOCALAPPDATA%\Runelite

if exist "%runelite_folder%\devious-client-launcher.jar" (
    echo Devious launcher already installed in Runelite folder.
) else (
    echo Downloading Devious launcher file from GitHub...
    curl.exe --location --output "%runelite_folder%\devious-client-launcher.jar" %devious_launcher%
    echo Devious launcher file downloaded to Runelite folder successfully.
)
