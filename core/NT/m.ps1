# Admin Check
$isAdmin = ([System.Security.Principal.WindowsPrincipal] [System.Security.Principal.WindowsIdentity]#GetCurrent()).IsInRole([System.Security.Principal.WindowsBuiltInRole]#Administrator)
if (-not $isAdmin) {
    Write-Host "Re-run with admin rights" -ForegroundColor Red
    Write-Host "Press Enter to exit..."
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
echo "Modifying power configurations..."
powercfg -h off

# Services
echo "Modifying services..."


# MMAgent
echo "Modifying MMAgents..."
Enable-MMAgent -ApplicationLaunchPrefetching
Enable-MMAgent -ApplicationPreLaunch
Enable-MMAgent -MemoryCompression
Enable-MMAgent -OperationAPI
Enable-MMAgent -PageCombining
Set-MMAgent -MaxOperationAPIFiles 8192

# BCDEdit
echo "Modifying BCDEdit settings..."
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
echo "Setting up NTP..."
w32tm /register
w32tm /config /syncfromflags:all /manualpeerlist:"time.google.com time.windows.com time.cloudflare.com pool.ntp.org time.facebook.com time.apple.com time.aws.com" /reliable:YES /update
w32tm /resync

# Registry Tweaks
regedit /s %windir%\Temp\Fynelium\core\NT\r.reg

# Recommended Apps
echo Installing apps and packages that you may find useful,

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

## System Maintenance
winget install Microsoft.PCManager.Beta
winget install Microsoft.WindowsPCHealthCheck

## Gaming
winget install Valve.Steam
winget install Valve.SteamCMD
