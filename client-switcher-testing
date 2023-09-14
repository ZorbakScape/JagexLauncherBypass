@echo off
setlocal enabledelayedexpansion

set "downloads_folder=%USERPROFILE%\Downloads"
set "runelite_folder=%LOCALAPPDATA%\Runelite"
set "launcher_filename=devious-client-launcher.jar"
set "download_launcher=false"
set "downloaded_runelite=false"

if not exist "%runelite_folder%" (
    echo Runelite folder does not exist. Please make sure Runelite is installed and try again.
    pause
    exit /b 1
)

rem Check if 'devious-client-launcher.jar' exists in the Runelite folder
if exist "%runelite_folder%\devious-client-launcher.jar" (
    set "mode=runelite"
) else (
    set "mode=devious"
)

rem Check if 'runelite-default.jar' exists in the Runelite folder
if exist "%runelite_folder%\runelite-default.jar" (
    set "download_launcher=true"
    set "mode=devious"
)

if "%mode%"=="unknown" (
    if not exist "%downloads_folder%\%launcher_filename%" (
        echo Launcher not found in Runelite folder or Downloads folder.
        echo Downloading the launcher from the website...

        rem Store the previous mode in a temporary variable
        set "previous_mode=!mode!"
        
        powershell.exe -ExecutionPolicy Bypass -Command "$sourceUrl = 'https://github.com/jbx5/devious-client/releases/download/launcher-1.0.1/devious-client-launcher.jar'; $output = '%runelite_folder%\%launcher_filename%'; Invoke-WebRequest -Uri $sourceUrl -OutFile $output"
        set "mode=devious"
        
        echo Download completed. To use the downloaded launcher, please run the script again.
        pause
        exit /b 0
    ) else (
        echo Launcher found in Downloads folder, moving to Runelite folder...
        move "%downloads_folder%\%launcher_filename%" "%runelite_folder%\%launcher_filename%" > nul
        if exist "%runelite_folder%\%launcher_filename%" (
            echo Successfully moved the launcher to Runelite folder.
            echo Deleting the launcher from Downloads folder...
            del /f "%downloads_folder%\%launcher_filename%" > nul
            set "mode=devious"
        ) else (
            echo Failed to move the launcher to Runelite folder.
            echo Please make sure the Runelite folder exists and try again.
            pause
            exit /b 1
        )
    )
)

rem Check if 'runelite.jar' needs to be downloaded
if not exist "%runelite_folder%\runelite.jar" (
    echo 'runelite.jar' not found. Downloading 'runelite.jar'...

    powershell.exe -ExecutionPolicy Bypass -Command "$sourceUrl = 'https://github.com/ZorbakScape/JagexLauncherBypass/raw/main/runelite.jar'; $output = '%runelite_folder%\runelite.jar'; Invoke-WebRequest -Uri $sourceUrl -OutFile $output"
    
    echo Download completed. To use the downloaded launcher, please run the script again.
    pause
    exit /b 0
)

rem Restore the previous mode if 'download_launcher' is true
if %download_launcher%==true (
    if "!previous_mode!"=="devious" (
        ren "%runelite_folder%\runelite.jar" "runelite-default.jar"
        ren "%runelite_folder%\devious-client-launcher.jar" "runelite.jar"
    ) else if "!previous_mode!"=="runelite" (
        ren "%runelite_folder%\runelite.jar" "devious-client-launcher.jar"
        ren "%runelite_folder%\runelite-default.jar" "runelite.jar"
    )
    set "mode=!previous_mode!"
}

cls
echo Switched to %mode% successfully.
endlocal
pause
