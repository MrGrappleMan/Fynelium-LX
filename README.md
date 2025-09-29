# [Fynelium](https://www.notion.so/Fynelium-27642d161cf9808fbcede4e053ec533c?source=copy_link)

![Last commit made to repository](https://img.shields.io/github/last-commit/MrGrappleMan/Fynelium-LX?style=for-the-badge)

# Installation

1. Back up ALL your data on the disk
2. Get the [Bazzite](https://bazzite.gg/#image-picker) GNOME image for your hardware.
3. Get [Ventoy](https://github.com/ventoy/Ventoy/releases/latest), open it and use a spare USB drive for it.
4. Move that file, ending with ".iso" to "Ventoy" partition of the USB Drive with Ventoy installed.
5. Reboot your device, and boot into the drive
6. Within the Bazzite installer, choose to wipe out your entire system disk, avoid LUKS encryption if you want to double your system as a server.
7. After installing and getting to the desktop, run this script in the "Terminal" app to get started.

```
cd /tmp/
rm -rf /tmp/Fynelium-LX
mkdir -p /tmp/Fynelium-LX
git clone https://github.com/MrGrappleMan/Fynelium-LX.git /tmp/Fynelium-LX/

sudo fish /tmp/Fynelium-LX/script/userfrontend.fish
```
