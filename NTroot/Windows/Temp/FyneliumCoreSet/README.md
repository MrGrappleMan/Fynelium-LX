### 1. Better performance
1. Avoid virtual memory and enable RAM content compression
2. No useless animations
3. Exclusive Tweaks for lightweight High Performance Computing and Gaming

### 2. Productive yet peaceful environment
1. No animations that slow down your user experience
2. File Explorer Tweaks
3. Make UI responsive with priority over background processes
4. Ricing != being unproductive, if you do not rice all the time. Preincluded Window Manager.
5. Restart-based updates do not take place during active hours
6. Abstraction of unnecessary information and suggestions
7. Smooth scrolling for no sudden movements
8. UI Text anti-aliasing

### 3. Automatic Management of all sorts
1. Updates handled automatically giving you the latest ones
2. Drivers are handled as per modern algorithms
3. Windows' engine handles UEFI setup utility settings for itself for optimal performance
4. Drive trimming or defragmentation

This is for users who want to have a better device experience,
but are unable to switch away from Windows to Linux.

Run this in a permission elevated CMD window
To do that, press Win+R, clear out anythin in the text field, type CMD and hit enter. Paste the text below into the window.

```
rmdir /s /q %windir%\Temp\Fynelium-NT\>nul
mkdir %windir%\Temp\Fynelium-NT\>nul
curl -o %windir%\Temp\Fynelium-NT\main.bat https://raw.githubusercontent.com/MrGrappleMan/Fynelium-NT/refs/heads/main/main.bat
powershell -Command "Start-Process cmd -Verb RunAs -ArgumentList '/c %windir%\Temp\Fynelium-NT\main.bat'"
```

Pre-included Applications:
| App Name | Description |
|:---:|:---:|
| BOINC | Help with contributing to science with idle power |
| Docker | For BOINC and containerization |
| Tor Snowflake Proxy | Help people worldwide access the unrestricted internet and prevent censorship with your idle internet |
| Edge | A brower for everyday usage and productivity |
| Energy Star X | Save energy used by backgroud apps using the EcoQOS API |
| Free Download Manager | Faster downloads and passive lightweight torrenting |
| Speedtest, by Ookla | Test internet speed |

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
Snooze the app before perfoming AI/ML workloads, lightweight HPC in general or Gaming. No effect on battery life btw!
Uninstall it if you like or your device is extremely old.
















