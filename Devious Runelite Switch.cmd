
set runelite_folder=%LOCALAPPDATA%\Runelite

if exist "%runelite_folder%\devious-client-launcher.jar" (
    ren "%runelite_folder%\runelite.jar" "runelite-default.jar"
    ren "%runelite_folder%\devious-client-launcher.jar" "runelite.jar"
    echo You are now running Devious.
    pause
) else if exist "%runelite_folder%\runelite-default.jar" (
    ren "%runelite_folder%\runelite.jar" "devious-client-launcher.jar"
    ren "%runelite_folder%\runelite-default.jar" "runelite.jar"
    echo You are now running default Runelite.
    pause
) else (
    echo Unable to detect Runelite version.
    pause
)
