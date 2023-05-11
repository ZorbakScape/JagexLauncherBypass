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
        ren "%runelite_folder
