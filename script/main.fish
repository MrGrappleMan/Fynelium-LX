#!/bin/env /bin/fish

#____________________________________
# Shell setup
#____________________________________

# Aliases
alias fpk "flatpak --system"
alias fpkrepadd "flatpak --system remote-add --if-not-exists"
alias fpkrepdel "flatpak --system remote-delete --force"
alias fpkpkgadd "flatpak --system install -y --noninteractive --or-update"
alias fpkpkgdel "flatpak --system uninstall -y --noninteractive --force-remove"

alias fwu "fwupdmgr"
alias fwurepadd "fwupdmgr enable-remote -y"

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
 eci "Setup started...please wait. "
 eci "Sometimes a password will be asked. Copy and paste it whenever prompted."
 eci "This script is like a template for your system 🪨 ➛ 🗿"
 eci "〽️ Some preferences might not meet your requirements"
 eci "You may edit them after the reboot. ⚠️ Doing so now can result in a disaster 🤯"
 spr

#____________________________________
spr
eci Filesystem
spr
#____________________________________
 
 cd /tmp/Fynelium-LX/FSRoot/
 cp -r /tmp/Fynelium-LX/FSRoot/etc/* /etc/
 cp -r /tmp/Fynelium-LX/FSRoot/var/* /var/
 cp -r /tmp/Fynelium-LX/FSRoot/opt/* /opt/
 ##cp -r /tmp/Fynelium-LX/FSRoot/root/* /root/
 mkdir -p /etc/playit
 mkdir -p /opt/playit
 chmod a+x /opt/playit/playit
 chmod a+x /opt/mc-server/mc-server

#____________________________________
spr
eci Firmware Update Manager
spr
#____________________________________

# REP ADD
 fwurepadd lvfs
 fwurepadd lvfs-testing

#____________________________________
spr
eci Flatpak
spr
#____________________________________

# REP ADD
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
  ###fpkrepadd rhel https://flatpaks.redhat.io/rhel.flatpakrepo
  fpkrepadd eclipse-nightly https://download.eclipse.org/linuxtools/flatpak-I-builds/eclipse.flatpakrepo
  fpkrepadd elementaryos https://flatpak.elementary.io/repo.flatpakrepo
  fpkrepadd pureos https://store.puri.sm/repo/stable/pureos.flatpakrepo
  fpkrepadd kde-runtime-nightly https://cdn.kde.org/flatpak/kde-runtime-nightly/kde-runtime-nightly.flatpakrepo

# PKG DEL
  flatpak uninstall -u --all -y --noninteractive --force-remove

# PKG ADD
  ##fpkpkgadd flathub-beta \
   ##org.freedesktop.Platform org.gnome.Platform \
   ##org.freedesktop.Sdk org.gnome.Sdk
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

#____________________________________
spr
eci RPM-OSTree
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
