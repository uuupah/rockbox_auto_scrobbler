#Requires AutoHotkey v2.0

OnMessage(0x219, notify_change)
PSPID := ""

notify_change(wParam, lParam, msg, hwnd)
{
  RunWait "PowerShell.exe  -ExecutionPolicy Bypass -Command .\rockbox_auto_scrobble.ps1", , "hide", &PSPID
  ProcessClose PSPID
}

Persistent