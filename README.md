# JagexLauncherBypass

JagexLauncherBypass is a collection of scripts designed to simplify the process of switching between different third-party clients, including Runelite and Devious.

## Usage
To get started, please download the Devious client from [here](https://github.com/jbx5/devious-launcher/releases/download/devious-client-launcher-1.0.1/devious-client-launcher.jar).

### Windows

To switch to the Devious client, follow these steps:

1. Download the `client-switcher.cmd` script file.
2. Execute the `client-switcher.cmd` script file. It will switch to and from the Devious client each time it is executed.

### Linux
1. Ensure you are using this [Jagex launcher for Linux](https://github.com/TormStorm/jagex-launcher-linux).
2. Download the `client-switcher.sh` script file.
3. Execute the `client-switcher.sh` script file. It will switch to and from the Devious client each time it is executed.

#### Disclaimer
I do not have Linux, so if you encounter any issues, please report them in detail. You should find the information you need in Lutris.

## Compatibility

These script files are currently compatible with Windows and Linux operating systems. We're actively working on creating scripts for Mac OS as well.

#### Disclaimer
I do not own a second PC or a Mac or Linux, so we need information to support these systems. Thank you for your cooperation.

## Supported Clients

Our script files currently support switching between Runelite and Devious clients. We're committed to expanding support for additional free third-party clients as they become available. Additionally, we have a multi-client switcher in development to support even more clients.

## Troubleshooting

If you encounter any issues, try the following steps:

1. Navigate to the folder located at `%localappdata%/runelite`.

2. Verify that you have the correct JAR files in this folder. Ensure that the switching process is correctly modifying the filenames as expected.

3. To test the switching functionality, run `runelite.exe`. If the switching doesn't seem to work, follow these steps:

   a. Delete all JAR files in the folder.
   
   b. Download the backup Runelite JAR from RuneLite's GitHub [here](https://github.com/runelite/launcher/releases/latest). You are looking for `runelite.jar`.

   c. Re-download the switching script and run it again.

## Contributions

We welcome contributions to this project. Feel free to submit issues or pull requests with any improvements or bug fixes you may have.

Thank you for using JagexLauncherBypass.
