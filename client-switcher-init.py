import os
import shutil
import subprocess

devious_launcher = "https://github.com/jbx5/devious-client/releases/download/launcher-1.0.1/devious-client-launcher.jar"
downloads_folder = os.path.expanduser("~") + "\\Downloads"
runelite_folder = os.getenv("LOCALAPPDATA") + "\\Runelite"
launcher_filename = "devious-client-launcher.jar"
download_launcher = False

if not os.path.exists(runelite_folder + "\\devious-client-launcher.jar"):
    if not os.path.exists(runelite_folder + "\\runelite-default.jar"):
        download_launcher = True
    else:
        os.rename(runelite_folder + "\\runelite.jar", runelite_folder + "\\devious-client-launcher.jar")
        os.rename(runelite_folder + "\\runelite-default.jar", runelite_folder + "\\runelite.jar")
        mode = "runelite"
else:
    os.rename(runelite_folder + "\\runelite.jar", runelite_folder + "\\runelite-default.jar")
    os.rename(runelite_folder + "\\devious-client-launcher.jar", runelite_folder + "\\runelite.jar")
    mode = "devious"

if download_launcher:
    print("Unable to detect Runelite version or the devious-client-launcher file.")
    print("Launcher not found in Runelite folder, downloading from the website...")
    cmd = [
        "powershell.exe",
        "-ExecutionPolicy",
        "Bypass",
        "-Command",
        f"$sourceUrl = '{devious_launcher}'; $output = '{runelite_folder}\\{launcher_filename}'; "
        "if (-not (Test-Path $output)) { Invoke-WebRequest -Uri $sourceUrl -OutFile $output }",
    ]
    subprocess.run(cmd, shell=True)
    mode = "Unknown"

os.system("cls")
print(f"Switched to {mode} successfully.")

launcher_path = os.path.join(downloads_folder, launcher_filename)
if os.path.exists(launcher_path):
    print("Launcher found in Downloads folder, moving to Runelite folder...")
    shutil.move(launcher_path, os.path.join(runelite_folder, launcher_filename))
    if os.path.exists(os.path.join(runelite_folder, launcher_filename)):
        print("Successfully moved the launcher to Runelite folder.")
        print("Deleting the launcher from Downloads folder...")
        os.remove(launcher_path)
        print("Done.")
    else:
        print("Failed to move the launcher to Runelite folder.")
        print("Please make sure the Runelite folder exists and try again.")
        input("Press Enter to exit.")
        exit()
else:
    print("Launcher not found in Downloads folder.")

input("Press Enter to continue.")
