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
function fyn_bascr
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
end
 alias eci "echo 󰋼"
 alias spr "echo ________________________________________________________________________________________________________________________________"

#____________________________________
# Preparation complete, so we start here
# Let's welcome our user, shall we?
#____________________________________

curl -L "https://wiki.teamfortress.com/w/images/b/b8/Engineer_specialcompleted-assistedkill01.wav" -o /tmp/Fynelium/core/audio/start1.wav
curl -L "https://wiki.teamfortress.com/w/images/0/07/Engineer_wranglekills01.wav" -o /tmp/Fynelium/core/audio/start2.wav
curl -L "https://wiki.teamfortress.com/w/images/7/75/Engineer_specialcompleted06.wav" -o /tmp/Fynelium/core/audio/end1.wav
curl -L "https://wiki.teamfortress.com/w/images/a/a1/Engineer_specialcompleted02.wav" -o /tmp/Fynelium/core/audio/end2.wav

pw-play /tmp/Fynelium/core/audio/start1.wav
pw-play /tmp/Fynelium/core/audio/start2.wav

#____________________________________
# Filesystem
#____________________________________
 fyn_bascr
 eci "Setup started. Even if it looks stuck, it is all part of the process"
 eci "Be patient till your device reboots. Sometimes a password will be asked. Keep it copied and keep pasting it whenever prompted."
 spr
 eci "Copying over Filesystem contents."
 cd /tmp/Fynelium/Linux/FSRoot/
 cp -r /tmp/Fynelium/Linux/FSRoot/etc/* /etc/
 cp -r /tmp/Fynelium/Linux/FSRoot/var/* /var/
 cp -r /tmp/Fynelium/Linux/FSRoot/opt/* /opt/
 ##cp -r /tmp/Fynelium/LXroot/root/* /root/
 mkdir -p /etc/playit
 mkdir -p /opt/playit

#____________________________________
# Firmware Update Manager
#____________________________________
alias fwu "fwupdmgr"
alias fwurepadd "fwupdmgr enable-remote -y"
fyn_bascr
 eci "Modifying Firmware Update Manager"
 #repos
  eci "Adding Repositories"
  fwurepadd lvfs
  fwurepadd lvfs-testing

#____________________________________
# Flatpak
#____________________________________
alias fpk "flatpak --system"
alias fpkrepadd "flatpak --system remote-add --if-not-exists"
alias fpkrepdel "flatpak --system remote-delete --force"
alias fpkpkgadd "flatpak --system install -y --noninteractive --include-sdk --or-update"
alias fpkpkgdel "flatpak --system uninstall -y --noninteractive --force-remove"
fyn_bascr
 eci "Modifying Flatpak"
 #uninstall
  eci "By the way, you should install Flatpaks system-wide, not just for a single user"
  eci "It has several advantages. It saves space for the same main files, but keeps data separate for each user."
  flatpak uninstall -u --all -y --noninteractive --force-remove
 #remote-add
  eci "Adding Repositories"
  fpkrepadd flathub https://flathub.org/repo/flathub.flatpakrepo
  fpkrepadd flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
  ###fpkrepadd eos-sdk https://ostree.endlessm.com/ostree/eos-sdk
  fpkrepadd igalia https://software.igalia.com/flatpak-refs/igalia.flatpakrepo
  fpkrepadd dragon-nightly https://cdn.kde.org/flatpak/dragon-nightly/dragon-nightly.flatpakrepo
  ###fpkrepadd eos-apps https://ostree.endlessm.com/ostree/eos-apps
  fpkrepadd webkit https://software.igalia.com/flatpak-refs/webkit-sdk.flatpakrepo
  fpkrepadd gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo
  fpkrepadd webkit-sdk https://software.igalia.com/flatpak-refs/webkit-sdk.flatpakrepo
  fpkrepadd fedora oci+https://registry.fedoraproject.org
  fpkrepadd fedora-testing oci+https://registry.fedoraproject.org/#testing
  fpkrepadd rhel https://flatpaks.redhat.io/rhel.flatpakrepo
  fpkrepadd eclipse-nightly https://download.eclipse.org/linuxtools/flatpak-I-builds/eclipse.flatpakrepo
  fpkrepadd elementaryos https://flatpak.elementary.io/repo.flatpakrepo
  fpkrepadd pureos https://store.puri.sm/repo/stable/pureos.flatpakrepo
  fpkrepadd kde-runtime-nightly https://cdn.kde.org/flatpak/kde-runtime-nightly/kde-runtime-nightly.flatpakrepo
 #install
  eci "Installing packages. Select the latest version of them if asked here."
  fpkpkgadd flathub-beta \
   org.freedesktop.Platform org.gnome.Platform \
   org.freedesktop.Sdk org.gnome.Sdk
  fpkpkgadd flathub \
   io.github.celluloid_player.Celluloid \
   io.github.flattool.Warehouse \
   edu.berkeley.BOINC \
   rocks.shy.VacuumTube \
   com.microsoft.EdgeDev \
   org.virt_manager.virt-manager \
   com.rafaelmardojai.Blanket \
   org.libreoffice.LibreOffice \
   org.torproject.torbrowser-launcher io.frama.tractor.carburetor
  fpkpkgadd flathub-beta \
   com.visualstudio.code.insiders
 #uninstall
  fpkpkgdel org.mozilla.firefox

#____________________________________
# Bazzite Rollback Helper
#____________________________________
fyn_bascr
 brh rebase unstable -y

#____________________________________
# Snapcraft
#____________________________________
fyn_bascr
eci "Modifying Snapcraft"

#____________________________________
# RPM-OSTree
#____________________________________


#____________________________________
# System
#____________________________________
fyn_bascr

 #Policies and permissions
  chmod a+x /opt/playit/playit
  chmod a+x /opt/mc-server/mc-server
 #refresh
  nohup systemctl daemon-reload &
  nohup timedatectl set-ntp true --no-ask-password &
 #Services
  echo Modifying System-D services
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
   rpm-ostree-countme rpm-ostree-countme.timer

#____________________________________
# User Specific commands
#____________________________________
fyn_bascr

set user_commands_string "
 ujust setup-decky install
 ujust setup-decky prerelease # Still of utility on desktops
 ujust get-decky-bazzite-buddy # Know your changes you system undergoes to use it better
 ujust get-framegen install-decky-plugin
 ujust get-framegen install
 ujust get-lsfg install
 ujust get-lsfg install-decky-plugin
 ujust toggle-password-feedback off # More Secure
 ujust configure-grub unhide
 #ujust enable-automounting
 #ujust enable-steamos-automount
 #ujust setup-sunshine enable # Remote desktop access
 ujust get-media-app "YouTube" # Dedicated and optimized for YouTube with a cleaner interface.
 ujust get-media-app "Spotify" # Native Client
 ujust get-media-app "YouTube Music"
 dconf load / < /tmp/Fynelium/core/LX/d.dconf
 dconf load /org/gnome/shell/extensions/ < /tmp/Fynelium/core/LX/e.dconf
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
fyn_bascr

 eci "Disable InitRAMFS regeneration, make system more reliable"
 rot initramfs --disable
 eci "Set Boot theme to BGRT"
 plymouth-set-default-theme bgrt
 eci "Modifying Kernel Arguments"
 rot kargs \
  --append-if-missing=rhgb \
  --append-if-missing=threadirqs \
  --append-if-missing=sysrq_always_enabled=1 \
  --append-if-missing=consoleblank=0 \
  --delete-if-present=quiet \
  --append-if-missing=profile \
  --append-if-missing=loglevel=3 \
  --append-if-missing=preempt=full \
  --append-if-missing=zswap.enabled=0

# End
 pw-play /tmp/Fynelium/core/audio/end1.wav
 pw-play /tmp/Fynelium/core/audio/end2.wav
 fyn_bascr
 echo ✨ Thank you for using this project!
 echo Please restart your system.
