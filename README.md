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
### 1. Grab Your Bazzite Image 🍓
First, download the right version for your setup (pick one!):

- **Regular (for most AMD/Intel GPUs)**: [Click here to download](https://download.bazzite.gg/bazzite-stable-amd64.iso)  
- **NVIDIA (newer cards, 10XX series and up)**: [Click here](https://download.bazzite.gg/bazzite-nvidia-open-stable-amd64.iso)  
- **NVIDIA (older cards, pre-10XX)**: [Click here](https://download.bazzite.gg/bazzite-nvidia-stable-amd64.iso)  

Save that `.iso` file somewhere easy, like your Downloads folder. 📥

### 2. Set Up Ventoy on a USB Drive 🔌
- Grab a spare USB drive (at least 8GB, but bigger is better). **Warning**: This will erase everything on it!  
- Download the latest Ventoy from here: [Ventoy Releases](https://github.com/ventoy/Ventoy/releases/latest) – get the one for your OS (Windows, Linux, etc.).  
- Unzip the download, then **run the Ventoy app** (it's called something like `Ventoy2Disk.exe` on Windows).  
- Plug in your USB, select it in the app, and click **Install**. Boom – Ventoy is now on your USB! 🪄  
  *(It'll create two partitions: one small for Ventoy, one big for your files.)*

### 3. Toss the Bazzite File onto the USB 📂
- Open your USB drive in File Explorer (or your file manager).  
- You'll see a big partition called **Ventoy** – that's where the magic happens!  
- Just **drag and drop** your downloaded `.iso` file right into that Ventoy partition. Easy peasy! 🚀

### 4. Boot Up & Install! ⚙️
- Plug the USB into the PC you want to install Bazzite on.  
- Restart your PC and **enter the boot menu** (usually by spamming F12, F10, Esc, or Del – check your PC's splash screen).  
- Pick your USB drive from the list (it'll say Ventoy).  
- Ventoy will show a menu – select your Bazzite `.iso` and hit Enter.  
- Choose **"Bazzite Installer"** when it asks. You're in! 🎮

### 5. Install Options (Your Choice!) 🛠️
- The installer is super user-friendly with a graphical wizard.  
- **Wanna wipe everything?** Select your main drive and let it format.  
- **Dual-booting with Windows?** Shrink your Windows partition first (in Windows Disk Management), then pick the free space.  
- **Want extra security?** Turn on **LUKS encryption** – it'll ask for a password on boot. 🔒  
- Follow the on-screen steps: pick language, timezone, create a user, etc. It'll handle the rest!

### 6. First Boot Magic ✨
- In terminals, usually it is `Ctrl` + `Shift` + `C` and `Ctrl` + `Shift` + `V` for copy-pasting
- Once you're on the Bazzite desktop (yay!), open a **Terminal** (search for it in the menu).  
- Paste and run this script to finish setup:

```
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/main.fish" | fish

```
Paste with `Ctrl + Shift + V`
Some errors are expected. Allow inhibiting shortcuts if requested.

Sometimes your user password will be asked. Paste it whenever it is asked.

You may not like some preferences so 🪨 ➛ 🗿 as you like only after the reboot,
as doing so during the script runs can result in errors 🤯

What to do with the drive? Keep it as a backup troubleshooting drive!
You can move ISOs like UBCD Live, HBCD, or even Tails if ykyk

### [Extra Documentation](notion.so/Bazzite-27642d161cf980a5a844e08f156d5950?source=copy_link)
