@echo off

set url=https://github.com/MeteorLite/meteor-launcher/releases/download/0.9.8/meteor-launcher-win64-0.9.8.rar
set target_folder=%LOCALAPPDATA%\Meteor
set rar_file=%USERPROFILE%\Downloads\meteor-launcher-win64-0.9.8.rar

set /p delete_rar=Would you like to delete the downloaded archive after extraction (Y/N)?

if not exist "%rar_file%" (
  echo Downloading Meteor client archive...
  curl -L --output "%rar_file%" "%url%"
) else (
  echo Meteor client archive already exists. Skipping download.
)

echo Extracting Meteor client archive to %target_folder% ...
if not exist "%target_folder%" (
  mkdir "%target_folder%"
)
7z x -o"%target_folder%" "%rar_file%" -y

if /i {%delete_rar%} == {Y} (
    echo Deleting downloaded archive...
    del "%rar_file%"
) else if /i {%delete_rar%} == {N} (
    echo Not deleting downloaded archive.
) else (
    echo Invalid input. Not deleting downloaded archive.
)

echo Meteor client installation complete.
pause
