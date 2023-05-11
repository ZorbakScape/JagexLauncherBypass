 IF EXIST %userprofile%\AppData\Local\Runelite\devious-client-launcher.jar (
    cd %userprofile%\AppData\Local\Runelite\
    ren runelite.jar runelite-default.jar
	ren devious-client-launcher.jar runelite.jar
 ) ELSE ( 
    cd %userprofile%\AppData\Local\Runelite\
	ren runelite.jar devious-client-launcher.jar
	ren runelite-default.jar runelite.jar
 )
 pause
