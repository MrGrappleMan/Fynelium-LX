#!/usr/bin/env fish

# 📛 Alias
alias rot "rpm-ostree -q"
function rotPkg+ -d "RPM-OSTree add package if present and dependancies met(deps met not implemented yet)"
    set packages $argv
    if test (count $argv) -eq 1 -a -n (string match '* *' $argv[1])
        set packages (string split ' ' $argv[1])
    end

    set -l install_list

    for pkg in $packages
        set -l output (rpm-ostree search $pkg)
        set -l lines (string split \n -- $output)
        set -l found false

        for line in $lines
            if string match -q '* *' $line
                set -l candidate (string split -m 1 ' ' $line)[1]
                if test "$candidate" = "$pkg"
                    set found true
                    break
                end
            end
        end

        if $found
            set install_list $install_list $pkg
        end
    end

    if test (count $install_list) -gt 0
        rpm-ostree install --allow-inactive --idempotent -y $install_list
    end
end
alias rotPkg+Adv "rot install --allow-inactive --idempotent -y" # Use only if yk what you are doing
alias rotPkg- "rot uninstall --allow-inactive --idempotent -y"

# Cancel background transactions

rot cancel


# Rebase - to Bazzite GNOME DX
echo "⎋ Attempting rebase to Bazzite Dev Experience - GNOME"
brh rebase bazzite-dx-gnome:latest -y # Great for general purpose development, productivity and gmaing. Most feature packed and well maintained - ignoring the bleeding edge-ness, but you can easily revert.
#rot rebase --experimental ostree-image-signed:docker://ghcr.io/ublue-os/bazzite-dx-gnome:latest # 
#rot rebase --experimental fedora:fedora/rawhide/x86_64/cosmic-atomic # Do not use, just for reference

# Update
rotUpd

# PKG ADD
   echo "🢷 Adding packages to RPM-OSTree, this may take time. Zero trust upon whatever packages that even the maintainer inserts, for safeguards."
   rotPkg+ "rust-zram-generator-devel systemd-swap preload \
    tlp tlp-rdw \
    kernel-modules-extra uutils-coreutils util-linux \
    boinc-client boinc-client-static \
    \
    snapd \
    flatseal flatpak-selinux flatpak-session-helper xdg-desktop-portal flatpak-libs libportal host-spawn \
    dnf-plugins-core etckeeper-dnf dnf-repo dnfdaemon dnfdaemon-selinux fedora-repos fedora-repos-rawhide fedora-repos-ostree fedora-gpg-keys \
    \
    mcpelauncher-manifest mcpelauncher-ui-manifest msa-manifest \
    \
    libei libei-utils \
    p7zip p7zip-plugins brotli \
    \
    ollama gemini-cli \
    code-insiders \
    nodejs pnpm \
    rust cargo clippy \
    git gh \
    distcc distcc-server \
    java-latest-openjdk \
    libvirt-daemon-kvm qemu-kvm qemu-kvm-core \
    \
    cosmic-epoch cosmic-desktop xdg-desktop-portal-cosmic initial-setup-gui-wayland-cosmic cosmic-greeter cosmic-comp cosmic-app-library cosmic-applets cosmic-edit cosmic-idle cosmic-osd cosmic-session cosmic-settings cosmic-settings-daemon cosmic-store fedora-release-cosmic-atomic cosmic-config-fedora greetd \
    mission-center \
    google-chrome-canary \
    obs-studio obs-studio-libs obs-studio-plugin-browser obs-studio-plugin-vaapi obs-studio-plugin-vkcapture obs-studio-plugin-droidcam \
    \
    hblock \
    qbittorrent persepolis \
    openssh openssh-server mosh \
    tor torbrowser-launcher \
    tailscale trayscale \
    rclone rclone-broswer"

    ## System Boosters ##
    ## Power management ##
    ## User environment ##
    ## Kernel mods ##
    ## Science United ##
    ## Flatpak ##
    ## GNOME Software ##
    ## DNF, RPM, OSTREE ##
    ## Libei ##
    ## Compression ##
    ## Telemetry ##
    ## Networking ##
    ## Containerization, Orchestration, Virtualization, Emulation ##
    ## Remote access ##

# Kernel Arguments
# No RHBG = faster boot, even if not by much
# Quiet suppresses unnecessary dialogs
# SysRq not required for average user
# Force Bluetooth ERTM - modern technology, enhances efficiency
# ZSwap >> ZRAM - Serves as a very efficient fallback to prevent OOM crashes. Lifespan not reduced by a lot on NVMe SSDs

echo "🗣️ Modifying kernel arguments"
rot kargs \
  --delete-if-present=rhgb \
  --append-if-missing=quiet \
  --append-if-missing=threadirqs \
  --append-if-missing=sysrq_always_enabled=0 \
  --append-if-missing=consoleblank=0 \
  --delete-if-present=profile \
  --delete-if-present=bluetooth.disable_ertm=1 \
  --append-if-missing=bluetooth.disable_ertm=0 \
  --delete-if-present=nomodeset \
  --append-if-missing=loglevel=3 \
  --append-if-missing=preempt=full \
  --delete-if-present=systemd.zram=1 \
  --append-if-missing=systemd.zram=0 \
  --append-if-missing=zswap.enabled=1 \
  --delete-if-present=zswap.enabled=0 \
  --append-if-missing=nowatchdog \
  --append-if-missing=pcie_aspm=on

# InitRAMFS - Centrally compiled provided, reliable, standardized system, reduced failure points
echo Forcing universal initramfs
rpm-ostree initramfs --disable

    ## GhosTTY ## ghostty-nightly ghostty-nightly-fish-completion ghostty-nightly-shell-integration

     ## Penetration testing / Hacking:
      # aircrack-ng turbo-attack golang-github-redteampentesting-monsoon
     ## Docker:
      # docker-cli docker-compose docker-compose-switch docker-buildx docker-buildkit
     ## C / C++:
      # gcc gcc-c++ cpp
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
