@echo off
setlocal enabledelayedexpansion

title Fynelium

:: Admin Check
net session
set el=!errorlevel!
if !el!==2 (
color 04
cls
echo Re-run with admin rights
echo Press any key to exit...
pause>nul
exit
)

:: Functions and Variables
set arch=%PROCESSOR_ARCHITECTURE%
set seperator=echo _____________________________________________________________________________________________________________________________________________________________________________________________
set svcset="if !el!==1 (sc stop "!svcnme!" ^& sc config "!svcnme!" start=disabled) ^& if !el!==2 (sc start "!svcnme!" ^& sc config "!svcnme!" start=auto)"
set userask="echo Options: ^& echo X. Skip ^& echo 1. No ^& echo 2. Yes ^& choice /C 12X /N"

color 07
cls

	echo Do you use a printer, fax or a virtual print service?
	echo.
	echo Service(s) Name: PrintNotify Spooler
	echo Manages print jobs sent from the computer to the printer or print server
	echo It can store multiple print jobs in the print queue or buffer retrieved by the printer or print server
	!userask!
    set svcnme=PrintNotify
  	!svcset!
	set svcnme=Spooler
	!svcset!
	set svcnme=Fax
	!svcset!
	set svcnme=PrintWorkflowUserSvc
	!svcset!
	cls

	echo Do you use image scanners, Android PTP or connect cameras?
	echo.
	echo Service(s) Name: StiSvc FrameServer WiaRpc
	echo Waits until you press the button on your scanner and then manages the process of getting the image where it needs to go
	echo This also affects communication with cameras and Android PTP that you connect directly to your computer, so be aware of that if you need this function
	!userask!
	set svcnme=StiSvc
	!svcset!
	set svcnme=FrameServer
	!svcset!
	set svcnme=WiaRpc
    !svcset!
	cls

	echo Do you use anything related to Xbox?
	echo.
	echo Service(s) Name: XblAuthManager GameSave
	!userask!
	set svcnme=XblAuthManager
	!svcset!
	set svcnme=GameSave
	!svcset!
	cls

	echo Do you use Bluetooth for anything? This even considers for Nearby Share
	echo.
	echo Service(s) Name: BluetoothUserService BTAGService bthserv
	echo Stopping this service causes paired Bluetooth devices to fail to operate
	echo It prevent new devices from being discovered or paired
	echo Yet it can also serve as a safety measure from attacks like KNOB or BLUFFS
	!userask!
	set svcnme=BluetoothUserService
	!userask!
	set svcnme=BTAGService
	!svcset!
	set svcnme=bthserv
	!svcset!
	cls

	echo Do you use remote desktop or remotely manage your device?
	echo.
	Service(s) Name: SessionEnv TermService UmRdpService RemoteRegistry
	echo These services make remote control of your computer possible.
	echo However, Microsoft Support could use this to fix issues.
	echo Windows's Remote support won't work if you disable these services.
	echo So, disabling these helps improve the security of your device, as they can be used in fake support scams.
	echo You may use Chrome Remote Desktop or most other 3rd party apps without any issues.
	!userask!
	set svcnme=SessionEnv
	!svcset!
	set svcnme=TermService
	!svcset!
	set svcnme=UmRdpService
	!svcset!
    set svcnme=RemoteRegistry
	!svcset!
	cls

	echo Name: Do you use Docker, VirtualBox, Hyper-V, WSL, VMware, Android emulator, or any other virtualization, containerization or emulation software?
	echo.
	!userask!
	if !el!==1 (bcdedit /set hypervisorlaunchtype off)
	if !el!==2 (bcdedit /set hypervisorlaunchtype on)
    cls

echo The main process has started. Keep this window open and check back after every 10-15 minutes.
echo For the time-being, avoid modifying your system files or installing or using software that does that.
echo Do not do important work or programs that keep progress via save-files on your disk.
echo Device will restart automatically within a 2 minutes and show a warning once done.

::Trigger Tweaks OR Repairs

echo Checking for health and repairs...
sfc /scannow
chkdsk /f /r
wsreset.exe
dism /Online /CheckHealth 
dism /Online /ScanHealth
dism /Online /Cleanup-Image /RestoreHealth

:: Toggle Tweaks:
echo Disabling hibernation
powercfg -h off

echo Starting recommended services
sc start "SensrSvc" & sc config "SensrSvc" start=auto
sc start "SensorService" & sc config "SensorService" start=auto
sc start "NetTcpPortSharing" & sc config "NetTcpPortSharing" start=auto
sc start "wisvc" & sc config "wisvc" start=auto
sc start "WpnUserService" & sc config "WpnUserService" start=auto
sc start "WpnService" & sc config "WpnService" start=auto
sc start "UserDataSvc" & sc config "UserDataSvc" start=auto
sc start "UnistoreSvc" & sc config "UnistoreSvc" start=auto
sc start "UevAgentService" & sc config "UevAgentService" start=auto
sc start "UsoSvc" & sc config "UsoSvc" start=auto
sc start "InstallServicec" & sc config "InstallService" start=auto
sc start "DiagTrack" & sc config "DiagTrack" start=auto
sc start "tzautoupdate" & sc config "tzautoupdate" start=auto
sc start "BITS" & sc config "BITS" start=auto
sc start "DoSvc" & sc config "DoSvc" start=auto
sc start "wuauserv" & sc config "wuauserv" start=auto
sc start "WaaSMedicSvc" & sc config "WaaSMedicSvc" start=auto
sc start "Dnscache" & sc config "Dnscache" start=auto
sc start "svsvc" & sc config "svsvc" start=auto
sc start "Winmgmt" & sc config "Winmgmt" start=auto
sc start "whesvc" & sc config "whesvc" start=auto
sc start "WebClient" & sc config "WebClient" start=auto
sc start "W32Time" & sc config "W32Time" start=auto
sc start "WlanSvc" & sc config "WlanSvc" start=auto
sc start "dot3svc" & sc config "dot3svc" start=auto
sc start "SysMain" & sc config "SysMain" start=auto
sc start "WSearch" & sc config "WSearch" start=auto

echo Modifying BCDEdit settings...
bcdedit /set bootlog yes
bcdedit /set bootmenupolicy Standard
bcdedit /set bootstatuspolicy DisplayAllFailures
bcdedit /set quietboot off
bcdedit /set sos off
bcdedit /set nocrashautoreboot off
bcdedit /set bootuxdisabled off
bcdedit /set maxproc yes
bcdedit /set onecpu no
bcdedit /set disabledynamictick no
bcdedit /set usefirmwarepcisettings no
bcdedit /set nointegritychecks off
bcdedit /set groupaware on
bcdedit /set maxgroup on
bcdedit /set onecpu off
bcdedit /set vsmlaunchtype Auto
bcdedit /set nx Optin
bcdedit /deletevalue useplatformclock

:: bcdedit /set forcelegacyplatform no
:: bcdedit /set nolowmem off
:: bcdedit /set x2apicpolicy enable
:: bcdedit /set useplatformtick yes
:: bcdedit /set tscsyncpolicy enhanced
:: bcdedit /set uselegacyapicmode no
:: bcdedit /set usephysicaldestination no
:: bcdedit /set tpmbootentropy default
:: bcdedit /set testsigning No
:: bcdedit /set hypervisorlaunchtype on

echo Setting up trustworthy NTP servers
w32tm /register
w32tm /config /syncfromflags:all /manualpeerlist:"time.google.com time.windows.com time.cloudflare.com pool.ntp.org time.facebook.com time.apple.com time.aws.com" /reliable:YES /update
w32tm /resync

echo Applying registry tweaks
regedit /s %windir%\Temp\Fynelium\core\r.reg

:: Power plan. idk if this works, last tried it in 2022, did not work across PCs
:: powercfg.exe -import "!cd!\powerplan.pow">nul

:: Recommended Apps
echo Installing apps and packages that you may find useful,

winget install Discord.Discord.Canary
winget install UCBerkeley.BOINC

::General Productivity
winget install LGUG2Z.komorebi
winget install LGUG2Z.whkd
winget install SoftDeluxe.FreeDownloadManager
winget install Google.GoogleDrive
winget install Microsoft.Edge.Canary

::Software Development
winget install GoLang.Go
winget install GitHub.GitHubDesktop.Beta

::System Maintenance
winget install Microsoft.PCManager.Beta
winget install Microsoft.WindowsPCHealthCheck

::Gaming
winget install Valve.Steam
winget install Valve.SteamCMD

exit
endlocal
