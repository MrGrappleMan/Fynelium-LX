<div align="center">

# 🌌 Fynelium for Bazzite

![License](https://img.shields.io/github/license/MrGrappleMan/Fynelium-LX?style=for-the-badge)
![Last Commit](https://img.shields.io/github/last-commit/MrGrappleMan/Fynelium-LX?style=for-the-badge)
![Contributors](https://img.shields.io/github/contributors/MrGrappleMan/Fynelium-LX?style=for-the-badge)
![Stars](https://img.shields.io/github/stars/MrGrappleMan/Fynelium-LX?style=for-the-badge)
![Forks](https://img.shields.io/github/forks/MrGrappleMan/Fynelium-LX?style=for-the-badge)

**✨ Optimize 🔹 Beautify 🔹 Automate 🔹 Effortlessly ✨**

</div>

<div align="center">
  
## Installation

</div>

### 1. Get Bazzite installer ISO 🍓

- [Regular](https://download.bazzite.gg/bazzite-gnome-stable-amd64.iso)
- [Nvidia](https://download.bazzite.gg/bazzite-gnome-nvidia-open-stable-amd64.iso)
- [Nvidia GTX 9xx-10xx Series](https://download.bazzite.gg/bazzite-gnome-nvidia-stable-amd64.iso)

### 2. Setup Ventoy on an external drive 🔌 - **Warning**: data will be wiped!
- Grab a spare USB drive (minimum 8GB, bigger is better).
- Get [Ventoy](https://github.com/ventoy/Ventoy/releases/latest) for your OS
- Unzip the download, then **run Ventoy setup** (`Ventoy2Disk.exe` on Windows).  
- Plug in your USB, select it in the app, and click **Install**. – Ventoy is now on your USB! 🪄

### 3. Shift the installer image 📂
- In your file manager, you will see two partitions on the device
  "Ventoy" - where you will store `.iso` files \
  "VTOYEFI" - where Ventoy, the utility stores its files)*
- Move the installer image `.iso` file into the Ventoy partition.

### 4. Boot the installer ⚙️
- Plug the USB into the PC where you want to install Bazzite.
- Restart your PC and **enter the boot menu / UEFI setup screen** (usually by spamming F1, F12, F10, Esc, or Del – check device splash screen or motherboard OEM details).  
- Pick your USB drive from the list.  
- Ventoy will show a menu – select the Bazzite `.iso` and enter.  

### 5. Installing Bazzite 🛠️
- Pick Keyboard layout, language, timezone, create a user(choose a single lowercase alphabet for user name, whatever for Full name), etc.
- **Make it your only OS, recommend ed** Select your main drive and let it format, delete all partitions on it by freeing up space, preserve none ON THAT disk.  
- **Dual-booting with Windows?** Shrink your Windows partition first (in Windows Disk Management), then pick the free space from the installer here.  
- **Drive Encryption** Turn on **LUKS encryption** – password asked on every boot 🔒  
- Wait till it installs, keep an eye on its execution

### 6. Post install script ✨
- Once you're on the desktop, open a **Terminal** (search for it in the menu).
- Paste and run this script to finish setup:
```
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/main.fish" | fish

```
- In terminals, `Ctrl + Shift + C` to copy and `Ctrl + Shift + V` to paste
- Activate Caffeine from the top right menu
Some errors are expected. Allow inhibiting shortcuts if requested.

Sometimes your user password will be asked. Paste it whenever it is asked.

Avoid interaction with your device when the script is running, unless the window mentions

What to do with the drive? Keep it as a backup troubleshooting drive!
You can move ISOs like UBCD Live, HBCD, Tails, a spare copy of EndeavourOS, etc.

### [Extra Documentation](https://notion.so/Bazzite-27642d161cf980a5a844e08f156d5950?source=copy_link)
