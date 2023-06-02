set runelite_folder=%LOCALAPPDATA%\Runelite

if exist "%runelite_folder%\devious-client-launcher.jar" (
    ren "%runelite_folder%\runelite.jar" "runelite-default.jar"
    ren "%runelite_folder%\devious-client-launcher.jar" "runelite.jar"
    cls
    echo Switched to Devious client successfully.
) else if exist "%runelite_folder%\runelite-default.jar" (
    ren "%runelite_folder%\runelite.jar" "devious-client-launcher.jar"
    ren "%runelite_folder%\runelite-default.jar" "runelite.jar"
    cls
    echo Switched to Default Runelite successfully.
) else (
    echo Unable to detect Runelite version.
    pause
) 

pause
