# rockbox_auto_scrobbler
auto scrobbler for rockbox ipods - very basic (functional) proof of concept

make a shortcut to the autohotkey file and add it to shell:startup

requires the windows version [rb-scrobbler](https://github.com/jeselnik/rb-scrobbler) to be in the same directory - run the scrobbler once to log in and modify the powershell script to add your timezone

this whole thing is very rudimentary - the ahk script looks for changes to the filesystem, if a new device appears (or disappears) it fires off [`rockbox_auto_scrobble.ps1`](https://github.com/uuupah/rockbox_auto_scrobbler/blob/main/rockbox_auto_scrobble.ps1). this script checks the root directories of all drives for a file called `.scrobbler.log` and if it is found, it handballs it to rb-scrobbler and notifies the user. rb-scrobbler will log the plays and delete the scrobbler file.
