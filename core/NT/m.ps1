# Admin Check
$isAdmin = ([System.Security.Principal.WindowsPrincipal] [System.Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "Re-run with admin rights" -ForegroundColor Red
    echo "Press Enter to exit..."
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

# MMAgent
Enable-MMAgent -ApplicationLaunchPrefetching
Enable-MMAgent -ApplicationPreLaunch
Enable-MMAgent -MemoryCompression
Enable-MMAgent -OperationAPI
Enable-MMAgent -PageCombining
Set-MMAgent -MaxOperationAPIFiles 8192
