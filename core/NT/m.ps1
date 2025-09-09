# Admin Check
$isAdmin = ([System.Security.Principal.WindowsPrincipal] [System.Security.Principal.WindowsIdentity]#GetCurrent()).IsInRole([System.Security.Principal.WindowsBuiltInRole]#Administrator)
if (-not $isAdmin) {
    Write-Host "Re-run with admin rights" -ForegroundColor Red
    Write-Host "Press Enter to exit"
    Read-Host
    exit
}

# Variables and Functions
$arch = $env:PROCESSOR_ARCHITECTURE
$seperator = "_____________________________________________________________________________________________________________________________________________________________________________________________"
$svcset = {
    param($svcName)
    if ($choice -eq "1") {
        Stop-Service -Name $svcName -ErrorAction SilentlyContinue
        Set-Service -Name $svcName -StartupType Disabled
    } elseif ($choice -eq "2") {
        Start-Service -Name $svcName -ErrorAction SilentlyContinue
        Set-Service -Name $svcName -StartupType Automatic
    }
}
$userask = {
    Write-Host "Options:"
    Write-Host "X. Skip"
    Write-Host "1. No"
    Write-Host "2. Yes"
    $choice = Read-Host "Enter choice (1, 2, X)"
    return $choice
}

# PowerCFG
Write-Host "Modifying power configurations"
powercfg -h off

# Services
Write-Host "Modifying services"

Start-Service -Name "SensrSvc"
Set-Service -Name "SensrSvc" -StartupType Automatic
Start-Service -Name "SensorService"
Set-Service -Name "SensorService" -StartupType Automatic
Start-Service -Name "NetTcpPortSharing"
Set-Service -Name "NetTcpPortSharing" -StartupType Automatic
Start-Service -Name "wisvc"
Set-Service -Name "wisvc" -StartupType Automatic
Start-Service -Name "WpnUserService"
Set-Service -Name "WpnUserService" -StartupType Automatic
Start-Service -Name "WpnService"
Set-Service -Name "WpnService" -StartupType Automatic
Start-Service -Name "UserDataSvc"
Set-Service -Name "UserDataSvc" -StartupType Automatic
Start-Service -Name "UnistoreSvc"
Set-Service -Name "UnistoreSvc" -StartupType Automatic
Start-Service -Name "UevAgentService"
Set-Service -Name "UevAgentService" -StartupType Automatic
Start-Service -Name "UsoSvc"
Set-Service -Name "UsoSvc" -StartupType Automatic
Start-Service -Name "InstallServicec"
Set-Service -Name "InstallService" -StartupType Automatic
Start-Service -Name "DiagTrack"
Set-Service -Name "DiagTrack" -StartupType Automatic
Start-Service -Name "tzautoupdate"
Set-Service -Name "tzautoupdate" -StartupType Automatic
Start-Service -Name "BITS"
Set-Service -Name "BITS" -StartupType Automatic
Start-Service -Name "DoSvc"
Set-Service -Name "DoSvc" -StartupType Automatic
Start-Service -Name "wuauserv"
Set-Service -Name "wuauserv" -StartupType Automatic
Start-Service -Name "WaaSMedicSvc"
Set-Service -Name "WaaSMedicSvc" -StartupType Automatic
Start-Service -Name "Dnscache"
Set-Service -Name "Dnscache" -StartupType Automatic
Start-Service -Name "svsvc"
Set-Service -Name "svsvc" -StartupType Automatic
Start-Service -Name "Winmgmt"
Set-Service -Name "Winmgmt" -StartupType Automatic
Start-Service -Name "whesvc"
Set-Service -Name "whesvc" -StartupType Automatic
Start-Service -Name "WebClient"
Set-Service -Name "WebClient" -StartupType Automatic
Start-Service -Name "W32Time"
Set-Service -Name "W32Time" -StartupType Automatic
Start-Service -Name "WlanSvc"
Set-Service -Name "WlanSvc" -StartupType Automatic
Start-Service -Name "dot3svc"
Set-Service -Name "dot3svc" -StartupType Automatic
Start-Service -Name "SysMain"
Set-Service -Name "SysMain" -StartupType Automatic
Start-Service -Name "WSearch"
Set-Service -Name "WSearch" -StartupType Automatic

# MMAgent
Write-Host "Modifying MMAgents"

Enable-MMAgent -ApplicationLaunchPrefetching
Enable-MMAgent -ApplicationPreLaunch
Enable-MMAgent -MemoryCompression
Enable-MMAgent -OperationAPI
Enable-MMAgent -PageCombining
Set-MMAgent -MaxOperationAPIFiles 8192

# BCDEdit
Write-Host "Modifying BCDEdit settings"
bcdedit /set bootlog yes
bcdedit /set bootmenupolicy Standard
bcdedit /set bootstatuspolicy DisplayAllFailures
bcdedit /set quietboot off
bcdedit /set sos off
#bcdedit /set nocrashautoreboot off
bcdedit /set bootuxdisabled off
#bcdedit /set maxproc yes
bcdedit /set disabledynamictick no
#bcdedit /set usefirmwarepcisettings no
bcdedit /set nointegritychecks off
#bcdedit /set groupaware on
#bcdedit /set maxgroup on
#bcdedit /set onecpu off
#bcdedit /set vsmlaunchtype Auto
bcdedit /set nx Optin
#bcdedit /deletevalue useplatformclock
#bcdedit /set forcelegacyplatform no
#bcdedit /set nolowmem off
#bcdedit /set x2apicpolicy enable
#bcdedit /set useplatformtick yes
#bcdedit /set tscsyncpolicy enhanced
#bcdedit /set uselegacyapicmode no
#bcdedit /set usephysicaldestination no
#bcdedit /set tpmbootentropy default
#bcdedit /set testsigning No
#bcdedit /set hypervisorlaunchtype on

# NTP Settings
Write-Host "Setting up NTP"
w32tm /register
w32tm /config /syncfromflags:all /manualpeerlist:"time.google.com time.windows.com time.cloudflare.com pool.ntp.org time.facebook.com time.apple.com time.aws.com" /reliable:YES /update
w32tm /resync

# Registry Tweaks
Write-Host "Applying registry tweaks"
regedit /s %windir%\Temp\Fynelium\core\NT\r.reg

# Recommended Apps
Write-Host "Installing apps and packages that you may find useful"

## Other
winget install Discord.Discord.Canary
winget install UCBerkeley.BOINC

## General Productivity
winget install LGUG2Z.komorebi
winget install LGUG2Z.whkd
winget install SoftDeluxe.FreeDownloadManager
winget install Google.GoogleDrive
winget install Microsoft.Edge.Canary

## Software Development
winget install GoLang.Go
winget install GitHub.GitHubDesktop.Beta
winget install Microsoft.PowerShell.Preview

## System Maintenance
winget install Microsoft.PCManager.Beta
winget install Microsoft.WindowsPCHealthCheck

## Gaming
winget install Valve.Steam
winget install Valve.SteamCMD
