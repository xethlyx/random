Set objShell = CreateObject("Wscript.Shell")
Set args = Wscript.Arguments
objShell.Run("powershell -WindowStyle Hidden -ExecutionPolicy Bypass -NonInteractive ""&"" ""'C:\Program Files\WireGuard\reconfigure.ps1'"""),0
