

Set objShell = CreateObject("WScript.Shell")

' Move the mouse cursor to the specified coordinates (x, y)
Sub MoveMouseCursor(x, y)
    objShell.Run "cmd /c echo wshshell.sendkeys " & Chr(34) & "{ESC}" & Chr(34) & " > tmp.vbs", 0, True
    objShell.Run "cmd /c echo Set WshShell = WScript.CreateObject(" & Chr(34) & "WScript.Shell" & Chr(34) & ") >> tmp.vbs", 0, True
    objShell.Run "cmd /c echo WshShell.Run " & Chr(34) & "rundll32 user32,SetCursorPos " & x & "," & y & Chr(34) & " >> tmp.vbs", 0, True
    objShell.Run "tmp.vbs", 0, True
    objShell.Run "cmd /c del tmp.vbs", 0, True
End Sub

' Usage example
MoveMouseCursor 500, 500 ' Move the cursor to position (500, 500)
