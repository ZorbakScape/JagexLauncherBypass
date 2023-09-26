@echo off
setlocal enabledelayedexpansion

set "appdata_dir=%appdata%\runelite"
set "devious_launcher=devious-client-launcher.jar"
set "runelite_default=runelite-default.jar"
set "error_occurred=false"

if exist "%appdata_dir%\%devious_launcher%" (
    echo Devious is installed correctly.
) else (
    echo Devious is not currently installed.
    set "error_occurred=true"
)

if exist "%appdata_dir%\%runelite_default%" (
    echo Runelite is installed correctly.
) else (
    echo Runelite is not currently installed.
    set "error_occurred=true"
)

if !error_occurred! == true (
    echo There's been an error. You need to delete your .jar files.
    set /p "delete_files=Would you like to automatically delete all .jar files? (Y/N): "
    if /i "!delete_files!"=="Y" (
        del /q "%appdata_dir%\*.jar"
        echo All .jar files in "%appdata_dir%" have been deleted.
    ) else (
        echo .jar files were not deleted. You can manually delete them later.
    )
)

pause
