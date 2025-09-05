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
set svcset="if !el!==1 (sc stop "!svcnme!" ^& sc config "!svcnme!" start=disabled) ^& if !el!==2 (sc start "!svcnme!" ^& sc config "!svcnme!">nul start=auto)"
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
@echo on
sfc /scannow
chkdsk /f /r
wsreset.exe
dism /Online /CheckHealth 
dism /Online /ScanHealth
dism /Online /Cleanup-Image /RestoreHealth
@echo off

:: Toggle Tweaks:
echo Disabling hibernation>nul
@echo on
powercfg -h off>nul
@echo off

echo Modifying services...
@echo on
sc start "SensrSvc"nul> & sc config "SensrSvc">nul start=auto
sc start "SensorService"nul> & sc config "SensorService">nul start=auto
sc start "NetTcpPortSharing"nul> & sc config "NetTcpPortSharing">nul start=auto
sc start "wisvc"nul> & sc config "wisvc">nul start=auto
sc start "WpnUserService"nul> & sc config "WpnUserService">nul start=auto
sc start "WpnService"nul> & sc config "WpnService">nul start=auto
sc start "UserDataSvc"nul> & sc config "UserDataSvc">nul start=auto
sc start "UnistoreSvc"nul> & sc config "UnistoreSvc">nul start=auto
sc start "UevAgentService"nul> & sc config "UevAgentService">nul start=auto
sc start "UsoSvc"nul> & sc config "UsoSvc">nul start=auto
sc start "InstallServicec"nul> & sc config "InstallService">nul start=auto
sc start "DiagTrack"nul> & sc config "DiagTrack">nul start=auto
sc start "tzautoupdate"nul> & sc config "tzautoupdate">nul start=auto
sc start "BITS"nul> & sc config "BITS">nul start=auto
sc start "DoSvc"nul> & sc config "DoSvc">nul start=auto
sc start "wuauserv"nul> & sc config "wuauserv">nul start=auto
sc start "WaaSMedicSvc"nul> & sc config "WaaSMedicSvc">nul start=auto
sc start "Dnscache"nul> & sc config "Dnscache">nul start=auto
sc start "svsvc"nul> & sc config "svsvc">nul start=auto
sc start "Winmgmt"nul> & sc config "Winmgmt">nul start=auto
sc start "whesvc"nul> & sc config "whesvc">nul start=auto
sc start "WebClient"nul> & sc config "WebClient">nul start=auto
sc start "W32Time"nul> & sc config "W32Time">nul start=auto
sc start "WlanSvc"nul> & sc config "WlanSvc">nul start=auto
sc start "dot3svc"nul> & sc config "dot3svc">nul start=auto
sc start "SysMain"nul> & sc config "SysMain">nul start=auto
sc start "WSearch"nul> & sc config "WSearch">nul start=auto
@echo off

echo Modifying BCDEdit settings...
@echo on
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
@echo off

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
@echo on
w32tm /register
w32tm /config /syncfromflags:all /manualpeerlist:"time.google.com time.windows.com time.cloudflare.com pool.ntp.org time.facebook.com time.apple.com time.aws.com" /reliable:YES /update
w32tm /resync
@echo off

echo Applying registry tweaks
regedit /s %windir%\Temp\Fynelium\core\r.reg

:: Power plan. idk if this works, last tried it in 2022, did not work across PCs
:: powercfg.exe -import "!cd!\powerplan.pow">nul

:: Recommended Apps
echo Installing apps and packages that you may find useful,

@echo on
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

@echo off
exit
endlocal


