@echo off

set devious_launcher=https://github.com/jbx5/devious-client/releases/download/launcher-1.0.1/devious-client-launcher.jar
set download_folder=%USERPROFILE%\Downloads
set runelite_folder=%LOCALAPPDATA%\Runelite

if exist "%download_folder%\devious-client-launcher.jar" (
    echo Devious launcher file found in Downloads folder. Copying to Runelite folder...
    copy "%download_folder%\devious-client-launcher.jar" "%runelite_folder%\devious-client-launcher.jar"
    
    set /p delete_launcher=Devious launcher file copied successfully. Would you like to delete the downloaded file? (Y/N)
    if /i {%delete_launcher%} == {Y} (
        echo Deleting downloaded Devious launcher file...
        del "%download_folder%\devious-client-launcher.jar"
    ) else (
        echo Not deleting downloaded Devious launcher file.
    )
) else (
    echo Devious launcher not found in Downloads folder. Downloading from GitHub...
    curl.exe --output "%runelite_folder%\devious-client-launcher.jar"
