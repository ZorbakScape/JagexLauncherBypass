@echo off

set runelite_folder=%LOCALAPPDATA%\runelite
set meteor_folder=%LOCALAPPDATA%\meteor
set revert_flag_file=revert_flag

if exist "%revert_flag_file%" (
    echo Reverting changes...
    if exist "%meteor_folder%\meteor-launcher.exe" (
        ren "%meteor_folder%\meteor-launcher.exe" "runelite.exe"
        ren "%meteor_folder%\meteor-launcher.cfg" "runelite.cfg"
    )
    if exist "%runelite_folder%\runelite.exe" (
        ren "%runelite_folder%\runelite.exe" "meteor-launcher.exe"
        ren "%runelite_folder%\runelite.cfg" "meteor-launcher.cfg"
    )
    ren "%meteor_folder%" "meteor"
    ren "%runelite_folder%" "runelite-default"
    del "%revert_flag_file%"
    echo Reverted successfully.
    pause
    goto :EOF
)

if exist "%meteor_folder%\meteor-launcher.exe" (
    echo You are now running Meteor.
    set is_meteor=true
) else if exist "%runelite_folder%\runelite.exe" (
    echo You are now running Runelite.
    set is_meteor=false
) else (
    echo Unable to detect default installation.
    pause
    goto :EOF
)

ren "%runelite_folder%" "runelite-default"

ren "%meteor_folder%" "meteor"

ren "%meteor_folder%\meteor-launcher.exe" "runelite.exe"

if %is_meteor%==true (
    ren "%meteor_folder%\meteor-launcher.cfg" "runelite
