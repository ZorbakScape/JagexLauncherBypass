set devious_launcher=https://github.com/jbx5/devious-client/releases/download/launcher-1.0.1/devious-client-launcher.jar
set download_folder=%USERPROFILE%\Downloads
set runelite_folder=%LOCALAPPDATA%\runelite

if exist "%download_folder%\devious-client-launcher.jar" (
    echo Devious launcher already exists in Downloads. Copying to Runelite folder...
    copy "%download_folder%\devious-client-launcher.jar" "%runelite_folder%\devious-client-launcher.jar"
) else (
    echo Devious launcher not found in Downloads. Downloading from GitHub...
    curl.exe --output "%runelite_folder%\devious-client-launcher.jar" --url "%devious_launcher%"
)

echo Devious launcher installation complete.
pause
