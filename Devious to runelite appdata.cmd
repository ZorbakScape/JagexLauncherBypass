@echo off

set devious_launcher=https://github.com/jbx5/devious-client/releases/download/launcher-1.0.1/devious-client-launcher.jar
set downloads_folder=%USERPROFILE%\Downloads
set runelite_folder=%LOCALAPPDATA%\Runelite
set launcher_filename=devious-client-launcher.jar

if exist "%downloads_folder%\%launcher_filename%" (
    echo Launcher found in Downloads folder, moving to Runelite folder...
    move "%downloads_folder%\%launcher_filename%" "%runelite_folder%\%launcher_filename%" > nul
    if exist "%runelite_folder%\%launcher_filename%" (
        echo Successfully moved the launcher to Runelite folder.
        echo Deleting the launcher from Downloads folder...
        del /f "%downloads_folder%\%launcher_filename%" > nul
        echo Done.
    ) else (
        echo Failed to move the launcher to Runelite folder.
        echo Please make sure the Runelite folder exists and try again.
        pause
        exit
    )
) else (
    echo Launcher not found in Downloads folder, downloading from the website...
    powershell.exe -ExecutionPolicy Bypass -Command "$sourceUrl = '%devious_launcher%'; $output = '%runelite_folder%\%launcher_filename%'; if (-not (Test-Path $output)) { Invoke-WebRequest -Uri $sourceUrl -OutFile $output }"
    echo Done.
)
