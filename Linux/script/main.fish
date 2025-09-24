#!/bin/env /bin/fish
### This script is like a template for your system ###
### Some preferences might not meet your requirements ###
### Adjusting some userspace settings and apps yourself is recommended after the reboot ###

#____________________________________
# Fish, script based declaration and setup
#____________________________________

# Design and TUI
function fish_title
 echo 千ㄚ几乇ㄥ丨ㄩ爪
end
 clear
 spr
 echo "    ______                 ___               ";
 echo "   / ____/_  ______  ___  / (_)_  ______ ___ ";
 echo "  / /_  / / / / __ \\/ _ \\/ / / / / / __ \`__ \\";
 echo " / __/ / /_/ / / / /  __/ / / /_/ / / / / / /";
 echo "/_/    \\__, /_/ /_/\\___/_/_/\\__,_/_/ /_/ /_/ ";
 echo "      /____/                                 ";
 echo "";
 echo " GitHub https://github.com/MrGrappleMan/Fynelium";
 echo "🌐 Main maintainer https://mrgrappleman.github.io";
 spr
 fastfetch
 spr
 alias eci "echo 󰋼"
 alias spr "echo ________________________________________________________________________________________________________________________________"

#____________________________________
# Filesystem
#____________________________________
 
 eci "Setup started...please wait"
 eci "Sometimes a password will be asked. Copy and paste it whenever prompted."
 spr
 eci "Copy over FS contents"
 cd /tmp/Fynelium/Linux/FSRoot/
 cp -r /tmp/Fynelium/Linux/FSRoot/etc/* /etc/
 cp -r /tmp/Fynelium/Linux/FSRoot/var/* /var/
 cp -r /tmp/Fynelium/Linux/FSRoot/opt/* /opt/
 ##cp -r /tmp/Fynelium/Linux/FSRoot/root/* /root/
 mkdir -p /etc/playit
 mkdir -p /opt/playit

#____________________________________
# No Hangup offloading
#____________________________________
nohup fish /tmp/Fynelium/Linux/script/fwupdmgr.fish &
nohup fish /tmp/Fynelium/Linux/script/flatpak.fish &
nohup fish /tmp/Fynelium/Linux/script/rpm-ostree.fish &

#____________________________________
# System
#____________________________________

 #Policies and permissions
  chmod a+x /opt/playit/playit
  chmod a+x /opt/mc-server/mc-server
 #refresh
  nohup systemctl daemon-reload &
  nohup timedatectl set-ntp true --no-ask-password &
 #Services
  echo Edit Systemd services
  systemctl mask \
   systemd-rfkill systemd-rfkill.socket
  systemctl unmask \
   gdm \
   shutdown.target reboot.target poweroff.target halt.target
  systemctl reenable \
   systemd-resolved systemd-networkd systemd-timesyncd \
   tlp \
   uupd uupd.timer \
   fstrim.timer \
   systemd-bsod \
   sshd playit tailscaled \
   preload systemd-zram-setup@zram0 \
   mc-server \
   rpm-ostree-countme rpm-ostree-countme.timer \
   tor

#____________________________________
# User Specific commands
#____________________________________

set user_commands_string "
 ujust setup-decky install
 ujust setup-decky prerelease # Still of utility on desktops
 ujust get-decky-bazzite-buddy # Bazzite changelog view
 ujust get-framegen install-decky-plugin
 ujust get-framegen install
 ujust get-lsfg install
 ujust get-lsfg install-decky-plugin
 ujust toggle-password-feedback off # Safer
 ujust configure-grub unhide
 #ujust enable-automounting
 #ujust enable-steamos-automount
 #ujust setup-sunshine enable # Remote desktop access
 ujust get-media-app "YouTube" # Dedicated and optimized for YouTube with a cleaner interface.
 ujust get-media-app "Spotify" # Native Client
 ujust get-media-app "YouTube Music"
 dconf load / < /tmp/Fynelium/Linux/script/gnome.dconf
 dconf load /org/gnome/shell/extensions/ < /tmp/Fynelium/Linux/gnome-extensions.dconf
"

# Split the commands string into an array based on newlines
set user_commands (string split -n \n $user_commands_string)

# Iterate through each directory in /home/
# Redneck method to recognize users
for user_path in (ls -d /home/*)
    # Extract username from path
    set username (basename $user_path)

    # Check if it's a valid directory and not a system folder like lost+found
    if test -d "$user_path" -a "$username" != "lost+found"
        echo "For user: $username"

        # Run each command as the user
        for cmd in $user_commands
            # Skip empty lines
            if test -n "$cmd"
                sudo -u $username fish -c "$cmd"
                if test $status -eq 0
                    echo "y"
                else
                    echo "Error for $username: $cmd"
                end
            end
        end
    end
end

#____________________________________
# Kernel
#____________________________________

 eci "Verbose boot info"
 plymouth-set-default-theme details

#____________________________________
# End
#____________________________________
 exit
