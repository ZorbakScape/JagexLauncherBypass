@echo off

set runelite_folder=%LOCALAPPDATA%\runelite
set meteor_folder=%LOCALAPPDATA%\meteor
set revert_flag_file=revert_flag

if exist "%revert_flag_file%" (
    echo Reverting changes...
    if exist "%meteor_folder%\runelite.exe" (
        ren "%meteor_folder%\runelite.exe" "meteor-launcher.exe"
        ren "%meteor_folder%\app\runelite.cfg" "meteor-launcher.cfg"
    )
    if exist "%runelite_folder%\meteor-launcher.cfg" (
        ren "%runelite_folder%\meteor-launcher.exe" "runelite.exe"
        ren "%runelite_folder%\meteor-launcher.cfg" "runelite.cfg"
    )
    ren "%meteor_folder%" "Runelite"
    ren "%runelite_folder%" "runelite-default"
    del "%revert_flag_file%"
    goto :EOF
)

echo Checking if Meteor is installed...

if exist "%meteor_folder%\runelite.exe" (
    echo Meteor is currently installed.
    set is_meteor=true
) else if exist "%runelite_folder%\runelite.exe" (
    echo Default Runelite is currently installed.
    set is_meteor=false
) else (
    echo Unable to detect default installation.
    pause
    goto :EOF
)

ren "%runelite_folder%" "runelite-default"

ren "%meteor_folder%" "Runelite"

ren "%meteor_folder%\runelite.exe" "runelite.exe"

if %is_meteor%==true (
    ren "%meteor_folder%\app\runelite.cfg" "runelite.cfg"
) else (
    echo Configuration file is not available in Meteor folder. Skipping.
)

