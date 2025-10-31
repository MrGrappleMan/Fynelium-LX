#!/usr/bin/env fish

# 📛 Alias
alias rot "rpm-ostree -q"
function rotUpd -d "Do non-destructive steps to refresh pkg mgr, no removal of caches"
    rot reload -b
    rot upgrade --trigger-automatic-update-policy --allow-downgrade --bypass-driver
end
function rotApplyLive -d "Apply changes live"
    rpm-ostree apply-live
    rpm-ostree apply-live --allow-replacement
end
function rotPkg+ -d "PKG ADD if present"
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
alias rotPkg- "rot uninstall --allow-inactive --idempotent -y"

# Rebase
#brh rebase testing -y

# Update
rotUpd

# PKG ADD
   rotPkg+ "rust-zram-generator-devel systemd-swap preload \
    tlp tlp-rdw \
    kernel-modules-extra uutils-coreutils util-linux \
    boinc-client boinc-client-static \
    \
    snapd \
    flatseal flatpak-selinux flatpak-session-helper xdg-desktop-portal flatpak-libs libportal host-spawn \
    dnf-plugins-core etckeeper-dnf dnf-repo dnfdaemon dnfdaemon-selinux fedora-repos fedora-repos-rawhide fedora-repos-ostree fedora-gpg-keys \
    \
    libei libei-utils \
    p7zip p7zip-plugins brotli \
    \
    docker-cli docker-compose docker-compose-switch docker-buildx docker-buildkit \
    nodejs pnpm \
    rust cargo clippy \
    git gh \
    cpp \
    distcc distcc-server gcc gcc-c++ \
    java-latest-openjdk \
    \
    plymouth plymouth-core-libs plymouth-graphic-libs plymouth-kcm plymouth-scripts \
    cosmic-epoch cosmic-desktop xdg-desktop-portal-cosmic initial-setup-gui-wayland-cosmic cosmic-greeter cosmic-comp cosmic-app-library cosmic-applets cosmic-edit cosmic-idle cosmic-osd cosmic-session cosmic-settings cosmic-settings-daemon cosmic-store fedora-release-cosmic-atomic cosmic-config-fedora greetd \
    \
    openssh openssh-server mosh \
    tor \
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

# Kernel Args
rot kargs \
  --append-if-missing=rhgb \
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
  --append-if-missing=zswap.enabled=0 \
  --append-if-missing=nowatchdog \
  --append-if-missing=pcie_aspm=on

# Server provided InitRAMFS, reliable and standardized system
rpm-ostree initramfs --disable

    ## GhosTTY ## ghostty-nightly ghostty-nightly-fish-completion ghostty-nightly-shell-integration

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
