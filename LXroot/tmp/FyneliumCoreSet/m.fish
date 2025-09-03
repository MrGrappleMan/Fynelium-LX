#!/bin/env /bin/fish
### This script is like a template for your system ###
### Some preferences might not meet your requirements ###
### Adjusting some userspace settings and apps yourself is recommended after the reboot ###

# Aliases
 alias rot "rpm-ostree -q --peer"
 alias rotpkgadd "rpm-ostree -q --peer install --allow-inactive --idempotent -y"
 alias rotpkgdel "rpm-ostree -q --peer uninstall --allow-inactive --idempotent -y"
 alias fpk "flatpak --system"
 alias fpkrepadd "flatpak --system remote-add --if-not-exists"
 alias fpkrepdel "flatpak --system remote-delete --force"
 alias fpkpkgadd "flatpak --system install -y --noninteractive --include-sdk --or-update"
 alias fpkpkgdel "flatpak --system uninstall -y --noninteractive --force-remove"

# Functions, actions, loops.

# Filesystem
 cd /tmp/Fynelium/LXroot
 cp -r /tmp/Fynelium/LXroot/etc/* /etc/
 cp -r /tmp/Fynelium/LXroot/var/* /var/
 cp -r /tmp/Fynelium/LXroot/opt/* /opt/
 ##cp -r /tmp/Fynelium/LXroot/root/* /root/
 mkdir -p /etc/playit
 mkdir -p /opt/playit

#InformTheUser
 clear
 echo "Setup started. Even if something may not seem to be occuring, the process is working in the background"
 echo "It all usually boils down to how fast your device is and the number of packages"
 echo "Be patient till your device reboots. Sometimes a password will be asked. Keep it copied and keep pasting it whenever prompted"

#MaintenanceCommands
rot cleanup -b 
rot reload
rpm-ostree apply-live
rpm-ostree apply-live --allow-replacement
fwupdmgr --allow-branch-switch --allow-older
flatpak update --system -y --noninteractive --force-remove 

#fwupdmr
 #repos
  fwupdmgr enable-remote lvfs -y
  fwupdmgr enable-remote lvfs-testing -y

#flatpak
 #SystemFlatpaksOnly
  flatpak uninstall -u --all -y --noninteractive --force-remove
 #remote-add
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
  fpkpkgadd flathub-beta \
   org.freedesktop.Platform org.gnome.Platform \
   org.freedesktop.Sdk org.gnome.Sdk
  fpkpkgadd flathub \
   io.github.celluloid_player.Celluloid \
   io.github.flattool.Warehouse \
   edu.berkeley.BOINC \
   com.microsoft.EdgeDev \
   org.virt_manager.virt-manager \
   com.rafaelmardojai.Blanket \
   org.libreoffice.LibreOffice \
   org.torproject.torbrowser-launcher io.frama.tractor.carburetor
  fpkpkgadd flathub-beta \
   com.visualstudio.code.insiders
 #uninstall
  fpkpkgdel org.mozilla.firefox

#brh
 brh rebase unstable -y

#ujust
 ujust setup-decky install
 ujust setup-decky prerelease # Still of utility on desktops
 ujust get-decky-bazzite-buddy # Know your changes you system undergoes to use it better
 ujust get-framegen install-decky-plugin
 ujust get-framegen install
 ujust get-lsfg install
 ujust get-lsfg install-decky-plugin
 ujust toggle-password-feedback off # You cannot trust anyone. People can get into accounts based on keyboard sounds.
 ujust configure-grub show # Better safe than sorry if you want to debug
 ujust enable-automounting
 ujust enable-steamos-automount
 ujust setup-sunshine enable # Remote Graphical desktop
 ujust get-media-app "YouTube" # Use this instead of your web browser, as browsers introduce some middleman overhead. This is just dedicated and optimized for specifically YT.
 ujust get-media-app "Spotify" # Stay sane
 ujust get-media-app "YouTube Music"

#snap

#rpm-ostree
 #install
   rotpkgadd \
    rust-zram-generator-devel preload \
    tlp tlp-rdw \
    pipewire wireplumber wireplumber-libs \
    kernel-modules-extra uutils-coreutils util-linux \
    cosmic-epoch cosmic-desktop xdg-desktop-portal-cosmic initial-setup-gui-wayland-cosmic cosmic-greeter cosmic-comp cosmic-app-library cosmic-applets cosmic-edit cosmic-idle cosmic-osd cosmic-session cosmic-settings cosmic-settings-daemon cosmic-store fedora-release-cosmic-atomic cosmic-config-fedora greetd \
    gdm \
    boinc-client boinc-client-static \
    flatseal flatpak-selinux flatpak-session-helper xdg-desktop-portal flatpak-libs libportal host-spawn \
    gnome-software gnome-software-rpm-ostree \
    dnf-plugins-core etckeeper-dnf dnf-repo dnfdaemon dnfdaemon-selinux fedora-repos fedora-repos-rawhide fedora-repos-ostree fedora-gpg-keys \
    fish \
    libei libei-utils \
    btop fastfetch \
    zstd brotli p7zip p7zip-plugins p7zip-gui \
    kuserfeedback gnome-info-collect \
    hblock speedtest-cli \
    docker-cli docker-compose docker-buildx bottles \
    tailscale openssh openssh-server mosh
    
    ## System Boosters ##
    ## Power management ##
    ## User environment ##
    ## Kernel mods ##
    ## COSMIC ##
    ## GDM ##
    ## Science United ##
    ## Flatpak ##
    ## GNOME Software ##
    ## DNF, RPM, OSTREE ##
    ## Fish ##
    ## Libei ##
    ## TTY Shows ##
    ## Compression ##
    ## Telemetry ##
    ## Networking ##
    ## Containerization, Orchestration, Virtualization, Emulation ##
    ## Remote access ##

    ## GhosTTY ## ghostty-nightly ghostty-nightly-fish-completion ghostty-nightly-shell-integration

    ### Developer Specific:-
    ### Suggested, use these in a container
     ## Version Control Systems:
      # git gh
     ## Rust:
      # rust cargo clippy
     ## C stuff:
      # cpp
     ## Java:
      # java-latest-openjdk
     ## Python:
      # 
     ## Compilation:
      # distcc distcc-server gcc gcc-c++
     ## Penetration testing / Hacking:
      # aircrack-ng turbo-attack golang-github-redteampentesting-monsoon
     ## Artificial Intelligence:
      # ollama

    ### Gaming:-
     ## Steam:
      # steam steam-devices
     ## Vavoom:
      # vavoom vavoom-engine

    ### Graphics:-
     ## Mesa:
      # mesa-va-drivers-freeworld mesa-vdpau-drivers-freeworld mesa-vulkan-drivers-freeworld
      # mesa-dri-drivers
      # mesa-va-drivers mesa-vdpau-drivers mesa-vulkan-drivers
      # mesa-libOSMesa mesa-compat-libOSMesa
     ## AMD: amd-gpu-firmware amd-ucode-firmware amdsmi am-utils
     ## Nvidia: nvidia-gpu-firmware libva-nvidia-driver envytools nvidia-patch

   ### Multipurpose:-
    ## PKGMGR Snap
     # snapd snapd-selinux

#System
 #Policies and permissions
  chmod a+x /opt/playit/playit
  chmod a+x /opt/mc-server/mc-server
 #refresh
  nohup systemctl daemon-reload &
  nohup timedatectl set-ntp true --no-ask-password &
 #Services 
  systemctl mask \
   systemd-rfkill systemd-rfkill.socket \
   tracker-store \
   rpm-ostree-countme rpm-ostree-countme.timer
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
   preload systemd-zram-setup@zram0
   mc-server

### For the inbuilt Minecraft server service, switch to Java edition by running the command below and editing it
### systemctl edit mc-server

#UserSpecifics

set user_commands_string "
 brh rebase unstable -y
 ujust setup-decky install
 ujust setup-decky prerelease # Still of utility on desktops
 ujust get-decky-bazzite-buddy # Know your changes you system undergoes to use it better
 ujust get-framegen install-decky-plugin
 ujust get-framegen install
 ujust get-lsfg install
 ujust get-lsfg install-decky-plugin
 ujust toggle-password-feedback off # You cannot trust anyone. People can get into accounts based on keyboard sounds.
 ujust configure-grub show # Better safe than sorry if you want to debug
 ujust enable-automounting
 ujust enable-steamos-automount
 ujust setup-sunshine enable # Remote Graphical desktop
 ujust get-media-app "YouTube" # Use this instead of your web browser, as browsers introduce some middleman overhead. This is just dedicated and optimized for specifically YT.
 ujust get-media-app "Spotify" # Stay sane
 ujust get-media-app "YouTube Music"
 gsettings set org.gnome.desktop.interface clock-show-seconds false
 gsettings set org.gnome.desktop.interface enable-animations true
 gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
 gsettings set org.gnome.software download-updates false
 gsettings set org.gnome.desktop.peripherals.mouse speed 1.0
 gsettings set org.gnome.shell.app-switcher current-workspace-only true
 gsettings set org.gnome.system.location max-accuracy-level 'exact'
 gsettings set org.gnome.system.location enabled true
 gsettings set org.gnome.login-screen allowed-failures 15
 gsettings set org.gnome.SessionManager auto-save-session true
 gsettings set org.gnome.SessionManager logout-prompt true
 gsettings set org.gnome.SessionManager auto-save-session-one-shot true
 gsettings set org.gnome.mutter dynamic-workspaces true
 gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
 gsettings set org.gnome.desktop.thumbnail-cache maximum-size 128
 gsettings set org.gnome.desktop.thumbnail-cache maximum-age 3
 gsettings set org.gnome.desktop.background picture-options 'none'
 gsettings set org.gnome.desktop.background primary-color '#000000'
 gsettings set org.gnome.desktop.background secondary-color '#000000'
 gsettings set org.gnome.desktop.background picture-uri ''
 gsettings set org.gnome.desktop.background picture-uri-dark ''
 gsettings set org.gnome.desktop.background picture-opacity 0
 gsettings set org.gnome.desktop.interface cursor-blink false
 gsettings set org.gnome.software allow-updates true
 gsettings set org.gnome.software download-updates true
 gsettings set org.gnome.software download-updates-notify false
 gsettings set org.gnome.software show-ratings true
 gsettings set org.gnome.software show-upgrade-prerelease true
 gsettings set org.gnome.software show-nonfree-ui true
 gsettings set org.gnome.software show-only-free-apps false
 gsettings set org.gnome.software show-only-verified-apps false
 gsettings set org.gnome.software prompt-for-nonfree true
 gsettings set org.gnome.software refresh-when-metered false
 gsettings set org.gnome.desktop.interface clock-show-weekday true
 gsettings set org.gnome.desktop.interface clock-show-date true
 gsettings set org.gnome.desktop.lockdown disable-lock-screen false
 gsettings set org.gnome.login-screen fallback-logo ''
 gsettings set org.gnome.login-screen logo ''
 gsettings set org.gnome.system.location enabled true
 gsettings set org.gnome.system.location max-accuracy-level 'exact'
 gsettings set org.gnome.online-accounts whitelisted-providers ['all']
 gsettings set org.gnome.mutter center-new-windows true
 gsettings set org.gnome.mutter auto-maximize true
 gsettings set org.gnome.desktop.interface cursor-blink false
 gsettings set org.gnome.desktop.interface font-hinting 'full'
 gsettings set org.gnome.desktop.interface font-antialiasing 'grayscale'
 gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
 gsettings set org.gnome.desktop.interface locate-pointer false
 gsettings set org.gnome.desktop.a11y.interface high-contrast false
 gsettings set org.freedesktop.Tracker3.Miner.Files crawling-interval 0
 gsettings set org.freedesktop.Tracker3.Miner.Files enable-monitors true
 ##gsettings set org.freedesktop.Tracker3.Miner.Files ignored-directories ['all']
 ##gsettings set org.freedesktop.Tracker3.Miner.Files ignored-directories-with-content ['all']
 ##gsettings set org.freedesktop.Tracker3.Miner.Files ignored-files ['all']
 gsettings set org.freedesktop.Tracker3.Miner.Files index-on-battery false
 gsettings set org.freedesktop.Tracker3.Miner.Files index-on-battery-first-time true
 gsettings set org.freedesktop.Tracker3.Miner.Files index-removable-devices true
 ##gsettings set org.freedesktop.Tracker3.Miner.Files index-recursive-directories []
 ##gsettings set org.freedesktop.Tracker3.Miner.Files index-single-directories []
 gsettings set org.freedesktop.Tracker3.Miner.Files initial-sleep 1
 gsettings set org.freedesktop.Tracker3.Miner.Files throttle 5
 gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'hibernate'
 gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
 gsettings set org.gnome.settings-daemon.plugins.power power-saver-profile-on-low-battery true
 gsettings set org.gnome.settings-daemon.plugins.power idle-dim true
 gsettings set org.gnome.desktop.session idle-delay 60
 gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
 gsettings set org.gnome.desktop.screensaver lock-delay 300
 gsettings set org.gnome.desktop.peripherals.keyboard remember-numlock-state true
 gsettings set org.gnome.desktop.break-reminders.eyesight fade-screen true
 gsettings set org.gnome.desktop.break-reminders.eyesight notify true
 gsettings set org.gnome.desktop.break-reminders.eyesight interval-seconds 1200
 gsettings set org.gnome.desktop.break-reminders.eyesight countdown false
 gsettings set org.gnome.desktop.break-reminders.eyesight delay-seconds 10
 gsettings set org.gnome.desktop.break-reminders.eyesight duration-seconds 20
 gsettings set org.gnome.desktop.break-reminders.eyesight play-sound true
 gsettings set org.gnome.desktop.break-reminders.eyesight notify-overdue true
 gsettings set org.gnome.desktop.break-reminders.eyesight notify-upcoming true
 gsettings set org.gnome.desktop.break-reminders.movement notify true
 gsettings set org.gnome.desktop.break-reminders.movement notify-overdue true
 gsettings set org.gnome.desktop.break-reminders.movement notify-upcoming true
 gsettings set org.gnome.desktop.break-reminders.movement play-sound true
 gsettings set org.gnome.desktop.break-reminders.movement countdown false
 gsettings set org.gnome.desktop.remote-desktop.vnc enable false
 gsettings set org.gnome.desktop.remote-desktop.rdp enable true
 gsettings set org.gnome.desktop.remote-desktop.rdp negotiate-port true
 gsettings set org.gnome.desktop.remote-desktop.rdp port 3389
 gsettings set org.gnome.desktop.remote-desktop.rdp view-only false
"

# Split the commands string into an array based on newlines
set user_commands (string split -n \n $user_commands_string)

# Iterate through each directory in /home/
# Bootleg goofy method to recognize users
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
                    echo "done correct"
                else
                    echo "Error for $username: $cmd"
                end
                echo "-------------------"
            end
        end
    end
end

# Kernel
 rot initramfs --enable
 plymouth-set-default-theme spinner
 rot kargs \
  --append-if-missing=rhgb \
  --append-if-missing=threadirqs \
  --append-if-missing=sysrq_always_enabled=1 \
  --append-if-missing=consoleblank=0 \
  --append-if-missing=quiet \
  --append-if-missing=profile \
  --append-if-missing=loglevel=3 \
  --append-if-missing=preempt=full \
  --append-if-missing=zswap.enabled=0

# Reboot
 systemctl reboot
