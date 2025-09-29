#!/bin/env /bin/fish

#____________________________________
# Shell setup
#____________________________________

# Aliases

# Interface Design
function fish_title
 echo 千ㄚ几乇ㄥ丨ㄩ爪
end
 alias eci "echo 󰋼"
 alias spr "echo ________________________________________________________________________________________________________________________________"
 clear
 spr
 echo "    ______                 ___               ";
 echo "   / ____/_  ______  ___  / (_)_  ______ ___ ";
 echo "  / /_  / / / / __ \\/ _ \\/ / / / / / __ \`__ \\";
 echo " / __/ / /_/ / / / /  __/ / / /_/ / / / / / /";
 echo "/_/    \\__, /_/ /_/\\___/_/_/\\__,_/_/ /_/ /_/ ";
 echo "      /____/                                 ";
 echo "";
 echo " GitHub https://github.com/MrGrappleMan/Fynelium-LX";
 echo "🌐 Main maintainer https://mrgrappleman.github.io";
 spr

#____________________________________
spr
eci Filesystem
spr
#____________________________________

#____________________________________
spr
eci Systemd
spr
#____________________________________

 # refresh
  systemctl daemon-reload
  nohup timedatectl set-ntp true --no-ask-password &
 #Services
  echo Edit Systemd services
  systemctl mask \
   systemd-rfkill systemd-rfkill.socket
  systemctl unmask \
   gdm \
   shutdown.target reboot.target poweroff.target halt.target
  systemctl reenable \
   systemd-timesyncd \
   tlp \
   uupd uupd.timer rpm-ostree-countme rpm-ostree-countme.timer \
   fstrim.timer \
   systemd-bsod \
   sshd tailscaled \
   preload systemd-zram-setup@zram0 \
   tor

#____________________________________
spr
eci User Specific modifications
eci Includes modifications for UJust and GNOME DConf options
spr
#____________________________________

set user_commands_string "
 echo emptyforfutureusesection
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
spr
eci Kernel
spr
#____________________________________

 #eci "BGRT boot theme"
 #plymouth-set-default-theme bgrt

#____________________________________
spr
eci Reboot
spr
#____________________________________
 systemctl reboot
