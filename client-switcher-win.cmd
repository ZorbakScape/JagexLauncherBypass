@echo off

REM URL of the Python downloads page
set "url=https://www.python.org/downloads/"

REM Temporary directory to store downloaded files
set "tempDir=%temp%\python_installer"

REM Create the temporary directory if it doesn't exist
if not exist "%tempDir%" mkdir "%tempDir%"

REM Temporary file to store the webpage content
set "tempFile=%tempDir%\python_download_page.html"

REM Download the webpage
curl -s -o "%tempFile%" "%url%"

REM Check if the download was successful
if %errorlevel% equ 0 (
    REM Use findstr to extract the latest version information
    for /f "tokens=3" %%i in ('type "%tempFile%" ^| findstr /i /c:"Download Python"') do (
        set "latestVersion=%%i"
    )

    REM Remove any leading and trailing whitespace
    for /f "tokens=*" %%j in ("%latestVersion%") do (
        set "latestVersion=%%j"
    )

    echo Latest Python version: %latestVersion%

    REM Construct the URL for downloading the installer
    set "downloadUrl=https://www.python.org/ftp/python/%latestVersion%/python-%latestVersion%-amd64.exe"

    REM Download the installer to the temporary directory
    echo Downloading Python installer...
    curl -o "%tempDir%\python-installer.exe" "%downloadUrl%"
    echo Download completed.

    REM Run the installer silently from the temporary directory
    echo Installing Python silently...
    "%tempDir%\python-installer.exe" /quiet InstallAllUsers=1 PrependPath=1
    echo Python installation completed.

    REM Cleanup: Delete temporary files and directory
    del "%tempFile%"
    rmdir /s /q "%tempDir%"

    REM Download the Python script and run it
    echo Downloading and running Python script...
    curl -o "%tempDir%\your_script.py" "https://example.com/path/to/your_script.py"
    "%tempDir%\python.exe" "%tempDir%\your_script.py"
) else (
    echo Failed to download the Python downloads page.
)

REM Cleanup: Delete the Python script
del "%tempDir%\your_script.py"
