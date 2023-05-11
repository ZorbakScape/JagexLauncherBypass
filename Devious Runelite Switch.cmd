IF EXIST %userprofile%\Appdata\local\runelite\devious-client-launcher.jar (
    ren %userprofile%\Appdata\local\runelite\runelite.jar %userprofile%\Appdata\local\runelite\runelite-default.jar 
    ren %userprofile%\Appdata\local\runelite\devious-client-launcher.jar %userprofile%\Appdata\local\runelite\runelite.jar 
 ) ELSE ( 
    ren %userprofile%\Appdata\local\runelite\runelite.jar %userprofile%\Appdata\local\runelite\rdevious-client-launcher.jar
    ren %userprofile%\Appdata\local\runelite\runelite-default.jar %userprofile%\Appdata\local\runelite\runelite.jar
 )
