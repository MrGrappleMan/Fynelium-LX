# Linux, mainly Bazzite

Get [Bazzite](https://bazzite.gg/#image-picker) GNOME with no Steam Gaming Mode's ISO file

Move the file ending with ".iso" to a spare USB Drive with Ventoy installed.

Within the installer,
Back up ALL your data on the disk. In the Bazzite installer, wipe out your entire system disk, avoid LUKS encryption if you want to. But it is generally safe and recommended, you might find it annoying though.
After installing and getting to the desktop, run this script in the "Terminal" app to get started.

```
cd /tmp/
rm -rf /tmp/Fynelium
mkdir /tmp/Fynelium
git clone https://github.com/MrGrappleMan/Fynelium.git /tmp/Fynelium/
sudo fish /tmp/Fynelium/core/LX/m.fish
```
Getting some errors is normal. Allow inhibiting shortcuts if requested.

Included apps:
| App Name | Description | Source | Technical Package IDs |
|:---:|:---:|:---:|:---:|
| BOINC | Help with contributing to science with idle power | R | boinc-client boinc-client-static boinc-manager |
| Docker | For containerization and BOINC | R | docker-cli |
| Tor | Access the unrestricted internet and get around censorship, and help others do the same | F | org.torproject.torbrowser-launcher io.frama.tractor.carburetor |
| Microsoft Edge | Truly the best brower for everyday usage and productivity | F | com.microsoft.EdgeDev |
| TLP | A daemon that makes system calls to actively save power, while keeping the same system performance | R | tlp tlp-rdw |
| Free Download Manager |  Faster downloads and passive lightweight torrenting | | |
| Speedtest, by Ookla | Test internet speed from CLI | R | speedtest-cli |

Windows environments »→ use Bottles/Lutris
Linux environments »→ use BoxBuddy/DistroShelf

It expects that you have read this paragraph carefully and it claims no responsibilty to any damage done to your system, but I can try helping!

My take: Prioritize Flatpaks over Native packages. Why?
Flatpaks are for user apps, mainly GUIs. It makes sense for things like libreoffice, Blanket or something like that.
They just get installed, work fine, do not require a reboot.
However, if you need system integration go with RPM-OSTree at your own risk, or try a Distrobox container.
They allow for better system integration and performance, but you risk dependancy hell and more complex system updates.
Keep it mainly for things the user doesn't see, like daemons.
Are you a developer, just go ahead with a Distrobox container for your dev envioroment.
Don't hold back from using proprietary software, RMS won't haunt you if you use it to contribute to OSS.

Same base/framework, yet no limit to visual theming/customization, one of the things I belive in. Make hundreds of rices, but maintain the same code base/framework.

This project's intended purpose is to have your system in a state with files preconfigured for a great user experience,
For a unified distribution with the intent of fulfilling consumer/user usage without having technical experience or using terminals
Asahi Linux support not confirmed(could use unc work macbook, maybe. defaults is just like gsettings by experience).

In the GNOME Display Manager, change your desktop environment to COSMIC.

Bazzite is used as it has access to a wide range of
### supported hardware
### user friendly software
### community support greater than that of regular atomic Fedora alone

#
# Extra Tips:

### [Tailscale](https://tailscale.com)
Provides a seamless networking experience. You can MoSH, host servers and even access your home network with it.
Best for home-labbing, server hosting and remotely accessing your home internet.
Use it with Sunshine / Moonlight to use your desktop from anywhere as long as you 

### [PlayIt.gg](https://playit.gg/)
Port forwarding made simple for all.
Allows for a public IP that can be accessed/used by anyone on the internet.

Ensure the executable file's location is /opt/playit/playit
There should be no file at /etc/playit/playit.toml prior to execution of the command below.
For first time setup run this:
```
/opt/playit/playit --secret_path /etc/playit/playit.toml start
```
Get an error? Delete /etc/playit/playit.toml and try first time setup again.
The service autostarts at startup if the executable is found.

### Sunshine/Moonlight
Access your device from everywhere with high performance. Pair it with Tailscale and you have an easily accessible desktop!
Best for screen sharing + remote gaming. Better than Steam Remote Play and not restricted to just games.

### Minecraft Server
Host your own Minecraft Server on your PC.

Note: Using Bedrock edition is heavily recommended.
It is faster, scalable, efficient and the language used for it is significantly better.
Want a great vanilla experience? Use this!
You can infact get mods, worlds and skins for free! The marketplace is just an optional way to support Mojang and UGC creators
There are plenty of mods here that can satisfy your needs.
Move the contents inside the server folder to
```
/opt/mc-server/
```
such that the server executable is located at and named as
```
/opt/mc-server/mc-server
```

Want mods only possible to use on Java? Use server software like FabricMC
alongside mods like Lithium, GeyserMC and Floodgate to get started.

### Running other Linux distributions

Use tools like DistroShelf or BoxBuddy to get started with containers.
Or run something in podman. You are all by yourself in this case.
Prefer installing RPM package by GNOME Software over using RPM packages you manually download over the internet.
Unlike LayeredPackages, LocalPackages do not get any updates.

### Running Android apps

Use Waydroid



