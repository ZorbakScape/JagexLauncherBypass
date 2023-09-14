# JagexLauncherBypass

This repository contains a set of cmd files that enable users to easily switch between different third-party clients, including Runelite, Devious, and Meteor.

## Usage

To switch to the Devious client:

1. Download the `client-switcher.bat` cmd file.
2. Execute the `client-switcher.bat` file, which will automatically download the Devious client if it's not already on the system and switch to it. If the Devious client is downloaded for the first time, you will need to run the `client-switcher.bat` file again to switch to it.

## Compatibility

Currently, these cmd files are only compatible with Windows operating systems. However, we are working on creating scripts for Mac OS as well.

## Supported Clients

Currently, the cmd files support switching between Runelite and Devious clients. However, we are committed to updating and expanding support for more free third-party clients as they become available. A multi-client switcher thats supports more clients is also in development.

## Troubleshooting

1    Navigate to the folder located at %localappdata%/runelite.

2    Verify that you have the correct JAR files in this folder. Ensure that the switching process is actually changing the filenames as expected.

3    To test the switching functionality, you can run runelite.exe. If the switching does not appear to work, you can try the following:

   a. Delete all JAR files in the folder.

   b. Download the backup Runelite JAR provided in the repository.

   c. Re-download the switching script and run it again."

## Contributions

Contributions to this project are welcome. Please feel free to submit an issue or pull request with any improvements or bug fixes you may have.

Thank you for using JagexLauncherBypass!
