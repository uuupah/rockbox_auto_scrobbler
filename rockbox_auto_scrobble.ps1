Add-type -AssemblyName System.Windows.Forms
$global:notif = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $PID).path
$notif.Icon=[System.Drawing.Icon]::ExtractAssociatedIcon($path)
$notif.BalloonTipIcon=[System.Windows.Forms.ToolTipIcon]::Info

$Drives = Get-PSDrive -PSProvider 'FileSystem'
foreach($Drive in $drives) {
  Get-ChildItem -Path $Drive.Root -File -ErrorAction SilentlyContinue | 
  ForEach-Object {
    if ($_.name -eq ".scrobbler.log") {
      $scrobbler_location = $_.directoryname + $_.name
      echo ($scrobbler_location)

      .\rb-scrobbler-windows.exe -f $scrobbler_location -n "delete-on-success" -o "+9.5h"

      $notif.BalloonTipText="succesfully loaded listening history to last.fm"
      $notif.BalloonTipTitle="scrobbles uploaded"
      $notif.Visible=$true
      $notif.ShowBalloonTip(3000)
    }
  }
} 