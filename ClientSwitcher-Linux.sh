#!/bin/bash

downloads_folder="$HOME/Downloads"
runelite_folder="$HOME/Games/jagex-launcher/drive_c/Program Files (x86)/Jagex Launcher/Games/RuneLite/"
launcher_filename="devious-client-launcher.jar"
download_launcher=false

if [ ! -d "$runelite_folder" ]; then
    echo "Runelite folder does not exist. Please make sure Runelite is installed and try again."
    read -p "Press Enter to exit"
    exit 1
fi

if [ -f "$runelite_folder/RuneLite-default.jar" ]; then
    mv "$runelite_folder/RuneLite.jar" "$runelite_folder/devious-client-launcher.jar"
    mv "$runelite_folder/RuneLite-default.jar" "$runelite_folder/RuneLite.jar"
    mode="runelite"
else
    if [ -f "$runelite_folder/devious-client-launcher.jar" ]; then
        mv "$runelite_folder/RuneLite.jar" "$runelite_folder/RuneLite-default.jar"
        mv "$runelite_folder/devious-client-launcher.jar" "$runelite_folder/RuneLite.jar"
        mode="devious"
    else
        mode="unknown"
    fi
fi

if [ "$mode" = "unknown" ]; then
    if [ ! -f "$downloads_folder/$launcher_filename" ]; then
        echo "Launcher not found in Runelite folder, and no launcher found in Downloads folder."
        echo "Please make sure the launcher is downloaded and try again."
        read -p "Press Enter to exit"
        exit 1
    else
        echo "Launcher found in Downloads folder, moving to Runelite folder..."
        mv "$downloads_folder/$launcher_filename" "$runelite_folder/$launcher_filename" > /dev/null
        if [ -f "$runelite_folder/$launcher_filename" ]; then
            echo "Successfully moved the launcher to Runelite folder."
            echo "Deleting the launcher from Downloads folder..."
            rm -f "$downloads_folder/$launcher_filename" > /dev/null
            mode="devious"
        else
            echo "Failed to move the launcher to Runelite folder."
            echo "Please make sure the Runelite folder exists and try again."
            read -p "Press Enter to exit"
            exit 1
        fi
    fi
fi

clear
echo "Switched to $mode successfully."
read -p "Press Enter to exit"
