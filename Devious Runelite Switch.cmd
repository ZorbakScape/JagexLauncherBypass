set runelite_folder=%LOCALAPPDATA%\Runelite

if exist "%runelite_folder%\devious-client-launcher.jar" (
    ren "%runelite_folder%\runelite.jar" "runelite-default.jar"
    ren "%runelite_folder%\devious-client-launcher.jar" "runelite.jar"
    set mode=devious
) else if exist "%runelite_folder%\runelite-default.jar" (
    ren "%runelite_folder%\runelite.jar" "devious-client-launcher.jar"
    ren "%runelite_folder%\runelite-default.jar" "runelite.jar"
    set mode=default
) else (
    echo Unable to detect Runelite version.
    pause
)

cls
echo Switched to %mode% Runelite successfully.
pause
