@echo off

set devious_launcher=https://github.com/jbx5/devious-client/releases/download/launcher-1.0.1/devious-client-launcher.jar
set downloads_folder=%USERPROFILE%\Downloads
set runelite_folder=%LOCALAPPDATA%\Runelite
set launcher_filename=devious-client-launcher.jar
set download_launcher=false

if not exist "%runelite_folder%\devious-client-launcher.jar" (
    if not exist "%runelite_folder%\runelite-default.jar" (
        set download_launcher=true
    ) else (
        ren "%runelite_folder%\runelite.jar" "devious-client-launcher.jar"
        ren "%runelite_folder%\runelite-default.jar" "runelite.jar"
        set mode=runelite
    )
) else (
    ren "%runelite_folder%\runelite.jar" "runelite-default.jar"
    ren "%runelite_folder%\devious-client-launcher.jar" "runelite.jar"
    set mode=devious
)

if %download_launcher%==true (
    echo Unable to detect Runelite version or the devious-client-launcher file.
    echo Launcher not found in Runelite folder, downloading from the website...
    powershell.exe -ExecutionPolicy Bypass -Command "$sourceUrl = '%devious_launcher%'; $output = '%runelite_folder%\%launcher_filename%'; if (-not (Test-Path $output)) { Invoke-WebRequest -Uri $sourceUrl -OutFile $output }"
    set mode="Unknown"
)

cls
echo Switched to %mode% successfully.

if exist "%downloads_folder%%launcher_filename%" (
    echo Launcher found in Downloads folder, moving to Runelite folder...
    move "%downloads_folder%%launcher_filename%" "%runelite_folder%%launcher_filename%" > nul
    if exist "%runelite_folder%%launcher_filename%" (
        echo Successfully moved the launcher to Runelite folder.
        echo Deleting the launcher from Downloads folder...
        del /f "%downloads_folder%%launcher_filename%" > nul
        echo Done.
    ) else (
        echo Failed to move the launcher to Runelite folder.
        echo Please make sure the Runelite folder exists and try again.
        pause
        exit
    )
) else (
    echo Launcher not found in Downloads folder.
)

pause
