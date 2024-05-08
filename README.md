# RadeonRestart
A quick powershell script to restart all Radeon processes and services for Win10/11. Used when Adrenalin refuses to open.

# Requirements
You may need to allow scripts to execute on your machine. In an elevated PowerShell prompt, use the following:
`Set-Executionpolicy RemoteSigned` or `Set-Executionpolicy Unrestricted`
Please note that this will allow all PS scripts to execute on your machine. If this is not desirable, you can open a PowerShell prompt in a terminal, and run this script with
`powershell -ExecutionPolicy ByPass -File <path to RadeonRestart.ps1>`

# What it does
See the script for more details. If it finds processes or services like AMD, ATIE, AUEP, or RadeonSoftware, it terminates them and restarts the required services. Sorta crude w/o path checking, but it works. If you have other processes on your machine with those names, they're getting term'd.

Alternatively, it will ask if you'd like to restart the display driver (in case it's bricked). Expect any 3D applications to terminate abnormally, including composited windows or those using hardware acceleration. Sometimes they recover gracefully, others not so much. Largely depends on why the display driver went wonky in the first place.

You may want to restart any hardware monitoring or control software. I noticed about 1/5 times FanControl stops working and just pins the fan to 100%. Not that big of a deal, and I'd be mad too if someone ripped something I was watching away from me.
