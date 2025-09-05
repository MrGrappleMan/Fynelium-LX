# Windows, 11 is recommended

### 1. Better performance
1. Avoid virtual memory and enable RAM content compression
2. No useless animations
3. Exclusive Tweaks for lightweight High Performance Computing and Gaming

### 2. Productive yet peaceful environment
1. No animations that slow down your user experience
2. File Explorer Tweaks
3. Make UI responsive with priority over background processes
4. Preincluded Window Manager rice, via [Komorebi 🍉](https://lgug2z.github.io/komorebi/)
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
To do that, press Win+R, clear out anything in the text field, type CMD and hit Ctrl+Shift+Enter. Paste the text below into the window.

```
rmdir /s /q %windir%\Temp\Fynelium\
mkdir %windir%\Temp\Fynelium\
winget install --id Git.Git -e --source winget
git clone https://github.com/MrGrappleMan/Fynelium.git %windir%\Temp\Fynelium\
%windir%\Temp\Fynelium\core\NT\m.bat
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




















