IF EXIST %userprofile%\Downloads\devious-client-launcher.jar (
    copy %userprofile%\Downloads\devious-client-launcher.jar %userprofile%\AppData\local\runelite\devious-client-launcher.jar
 ) ELSE ( 
    curl.exe --output %userprofile%\AppData\local\runelite\devious-client-launcher.jar --url https://github.com/jbx5/devious-client/releases/download/launcher-1.0.1/devious-client-launcher.jar
 )
