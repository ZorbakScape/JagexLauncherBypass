@echo off

setlocal enabledelayedexpansion

set "downloads_folder=%USERPROFILE%\Downloads"
set "runelite_folder=%LOCALAPPDATA%\Runelite"
set "launcher_filename=devious-client-launcher.jar"
set "download_launcher=false"

if not exist "%runelite_folder%" (
    echo Runelite folder does not exist. Please make sure Runelite is installed and try again.
    pause
    exit /b 1
)

if exist "%runelite_folder%\runelite-default.jar" (
    ren "%runelite_folder%\runelite.jar" "devious-client-launcher.jar"
    ren "%runelite_folder%\runelite-default.jar" "runelite.jar"
    set "mode=runelite"
) else (
    if exist "%runelite_folder%\devious-client-launcher.jar" (
        ren "%runelite_folder%\runelite.jar" "runelite-default.jar"
        ren "%runelite_folder%\devious-client-launcher.jar" "runelite.jar"
        set "mode=devious"
    ) else (
        set "mode=unknown"
    )
)

if "%mode%"=="unknown" (
    if not exist "%downloads_folder%\%launcher_filename%" (
        echo Launcher not found in Runelite folder, and no launcher found in Downloads folder.
        echo Please make sure the launcher is downloaded and try again.
        pause
        exit /b 1
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

cls
echo Switched to %mode% successfully.
endlocal
pause
