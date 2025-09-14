# Linux, mainly Bazzite

## Get started
0. Back up ALL your data on the disk, as it will be completely wiped.
1. Get the [Bazzite](https://bazzite.gg/#image-picker) ISO. The following are images pre-listed for convenience
[Most PCs](https://download.bazzite.gg/bazzite-gnome-stable-amd64.iso) | [NVIDIA RTX | GTX 16xx+](https://download.bazzite.gg/bazzite-gnome-nvidia-open-stable-amd64.iso) | [Older NVIDIA Graphics cards](https://download.bazzite.gg/bazzite-gnome-nvidia-stable-amd64.iso)
2. Get [Ventoy](https://github.com/ventoy/Ventoy/releases/latest), open it and use a spare USB drive for it.
3. Move that file, ending with ".iso" to "Ventoy" partition of the USB Drive with Ventoy installed.
4. Reboot your device, and boot into the drive
5. Within the Bazzite installer, choose to wipe out your entire system disk, avoid LUKS encryption as you might find it annoying.
6. After installing and getting to the desktop, run this script in the "Terminal" app to get started.
```
cd /tmp/
rm -rf /tmp/Fynelium
mkdir /tmp/Fynelium
git clone https://github.com/MrGrappleMan/Fynelium.git /tmp/Fynelium/
sudo fish /tmp/Fynelium/core/LX/m.fish
```
Getting some errors is normal. Allow inhibiting shortcuts if requested.

It expects that you have read the instructions carefully and claims no responsibilty to any damage done, but you can report bugs.
This project's intended purpose is to have your system in a state with files preconfigured for a great user experience,
For a unified distribution with the intent of fulfilling consumer/user usage without having technical experience or using terminals.

Prioritize Flatpaks over Native packages.
Flatpaks are for user apps, mainly GUIs. It makes sense for things like libreoffice, Blanket or something like that.
They just get installed, work fine, do not require a reboot.
However, if you need system integration go with RPM-OSTree at your own risk, or try a Distrobox container.
They allow for better system integration and performance, but you risk dependancy hell and more complex system updates.
Keep it mainly for things the user doesn't see, like daemons.
Are you a developer, just go ahead with a Distrobox container for your dev envioroment.
There is no one stopping you from using proprietary software, you should compare the application in itself, not the development model.
Same base/framework, yet no limit to visual theming/customization, one of the things I belive in. Make hundreds of rices, but maintain the same code base/framework.

## Extra Tips:

| Software | Purpose | Extra notes
|---|---|---|
| [Tailscale](https://tailscale.com) | Remote networking without port forward | Provides a seamless networking experience. You can MoSH, host servers and even access your home network with it. Essential for home-labbing, server hosting and remotely accessing your home internet |
| [PlayIt.gg](https://playit.gg/) | Port forward an IP publicly without fees | Allows for a public IP that can be accessed/used by anyone on the internet, whether it be game servers, SFTP, anything |

Ensure the executable file's location is /opt/playit/playit
There should be no file at /etc/playit/playit.toml prior to execution of the command below.
For first time setup run this:
```
/opt/playit/playit --secret_path /etc/playit/playit.toml start
```
Get an error? Delete /etc/playit/playit.toml and try first time setup again.
The service autostarts at startup if the executable is found.

| Sunshine/Moonlight | Remote Desktop | High Performance, for gaming as well as regular usage. You may use w/Tailscale |

### Minecraft Server
Host your own Minecraft Server on your PC.

Note: For a vanilla experience, Bedrock is heavily recommended
You server folder's contents go in
```
/opt/mc-server/mc-server
```
And the main binary is to be called ```mc-server```

Want mods only possible to use on Java? Use server software like FabricMC
alongside mods like Lithium, GeyserMC and Floodgate to get started.

## Multi Platform Compatibility
| Platform | Tools | Info |
|---|---|---|
| Windows | Bottles, Lutris, WinBoat | Use WinBoat for full Windows experience, but with low performance |
| Android | Waydroid | ```ujust setup-waydroid``` |
| Linux | BoxBuddy, Distroshelf | Use any |
| Full Virtual Machines | GNOME Boxes, Virt-Manager |

## Included Packages
### RPM-OSTree
| Name | Description | ID |
|---|---|---|
| BOINC | Help with contributing to science with idle power | ```boinc-client boinc-client-static boinc-manager``` |
| Docker | For containerization and BOINC | ```docker-cli``` |
| TLP | A daemon that makes system calls to actively save power, while keeping the same system performance | ```tlp tlp-rdw``` |

### Flatpak
| Name | Description | ID |
|---|---|---|
| Tor | Access the unrestricted internet and get around censorship, and help others do the same | ```org.torproject.torbrowser-launcher io.frama.tractor.carburetor``` |
| Microsoft Edge | A great brower for everyday usage and productivity | ```com.microsoft.EdgeDev``` |

### Docker
