# Windows 11. If incompatible, try to install it via a custom ISO like Tiny11

### 1. Better performance
1. Avoid virtual memory and enable RAM content compression
2. Subtler animations
3. Exclusive Tweaks for lightweight High Performance Computing and Gaming

### 2. Productive yet peaceful environment
2. File Explorer tweaks for better file handling
3. Make UI responsive with priority over background processes
4. Preincluded Window Manager rice, via [Komorebi 🍉](https://lgug2z.github.io/komorebi/)
5. Updates interfere less with your experience
6. Abstraction of unnecessary information
7. Advoid suggestions
8. Smooth scrolling for no sudden movements
9. UI Text anti-aliasing

### 3. Automatic Management of all sorts
1. Updates handled automatically giving you the latest ones
2. Drivers are handled as per modern algorithms
3. Windows' engine handles UEFI setup utility settings for itself for optimal performance
4. Drive trimming or defragmentation
5. Advanced Telemetry for 

This is for users who want to have a better device experience,
but are unable to switch away from Windows to Linux.

Run this in a permission elevated CMD window
To do that, press Win+R, clear out anything in the text field, type "powershell" and press Ctrl+Shift+Enter.
Paste the text below into the newly launched window.
```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine
Remove-Item -Path "$env:windir\Temp\Fynelium\" -Recurse -Force
New-Item -Path "$env:windir\Temp\Fynelium\" -ItemType Directory -Force
winget install --id Git.Git -e --source winget
git clone https://github.com/MrGrappleMan/Fynelium.git %windir%\Temp\Fynelium\
%windir%\Temp\Fynelium\core\NT\m.ps1
```
You will be prompted for an input. Type "a" in uppercase or lowercase and hit enter.

Pre-included Applications:
| App Name | Description |
|:---:|:---:|
| BOINC | Help with contributing to science with idle power |
| Docker | For BOINC and containerization |
| Tor Snowflake Proxy | Help people worldwide access the unrestricted internet and prevent censorship with your idle internet |
| Edge Canary | A brower for everyday usage and productivity |
| Energy Star X | Save energy used by backgroud apps using the EcoQOS API |
| Free Download Manager | Better downloads and torrenting |
| Speedtest, by Ookla | Test internet speed |
| Spacedrive | A modern file manager |

### Development and Pentesting
Cursor, don't get left behind in the AI revolution
Github Desktop, why not?

### You might consider bloat
Uprock
Pawns.App
Honeygain
DATS
Grass.io
PacketShare
Proxyrack
HYRA AI

## Additional Notes

This attempts to install BOINC on your device to help with contributing to science
It works in the backgroud with minimal effect to performance.
Snooze it from the tray icon before using any demanding tasks. No effect on battery life btw!
Uninstall it if you like or your device is extremely old.






