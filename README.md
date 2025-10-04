# Main installation

1. Backup ALL your data on the disk
2. Get the [Bazzite](https://bazzite.gg/#image-picker) GNOME image for your hardware.
3. Get [Ventoy](https://github.com/ventoy/Ventoy/releases/latest), open it and use a spare USB drive for it.
4. Move that file, ending with ".iso" to "Ventoy" partition of the USB Drive with Ventoy installed.
5. Reboot your device, and boot into the drive
6. In the Bazzite installer, choose to wipe out your entire system disk, avoid LUKS encryption if you want to double your system as a server that you can start without interaction
7. After installing and getting to the desktop, run this script in the "Terminal" app to get started.

```
sudo curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/main.fish" | sudo fish
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/ujust.fish" | fish
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/gsettings.fish" | fish
systemctl reboot

```

Seeing errors is normal. Allow inhibiting shortcuts if requested.

Sometimes your user password will be asked. Copy and paste it whenever prompted.

〽️ Some preferences might not meet your requirements, so 🪨 ➛ 🗿 as per your preferences
You may edit them only after the reboot, as doing so during the script runs can result in a disaster 🤯

9. ### [Documentation](notion.so/Bazzite-27642d161cf980a5a844e08f156d5950?source=copy_link)
