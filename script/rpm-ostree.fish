#!/usr/bin/env fish

## Aliases
alias rot "rpm-ostree"
function rotpkgadd -d "RPM-OSTree PKG ADD if available"
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
alias rotpkgdel "rpm-ostree uninstall --allow-inactive --idempotent -y"

# Rebase
brh rebase testing -y

# PKG ADD
   rotpkgadd "rust-zram-generator-devel preload \
    tlp tlp-rdw \ 
    kernel-modules-extra uutils-coreutils util-linux \
    boinc-client boinc-client-static \
    flatseal flatpak-selinux flatpak-session-helper xdg-desktop-portal flatpak-libs libportal host-spawn \
    dnf-plugins-core etckeeper-dnf dnf-repo dnfdaemon dnfdaemon-selinux fedora-repos fedora-repos-rawhide fedora-repos-ostree fedora-gpg-keys \
    libei libei-utils \
    p7zip p7zip-plugins \
    kuserfeedback gnome-info-collect \
    hblock \
    plymouth plymouth-core-libs plymouth-graphic-libs plymouth-kcm plymouth-scripts \
    docker-cli docker-compose docker-buildx bottles \
    cosmic-epoch cosmic-desktop xdg-desktop-portal-cosmic initial-setup-gui-wayland-cosmic cosmic-greeter cosmic-comp cosmic-app-library cosmic-applets cosmic-edit cosmic-idle cosmic-osd cosmic-session cosmic-settings cosmic-settings-daemon cosmic-store fedora-release-cosmic-atomic cosmic-config-fedora greetd \
    openssh openssh-server mosh tor"

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
rpm-ostree kargs \
  --delete-if-present=rhgb \
  --append-if-missing=threadirqs \
  --append-if-missing=sysrq_always_enabled=0 \
  --append-if-missing=consoleblank=0 \
  --append-if-missing=quiet \
  --delete-if-present=profile \
  --append-if-missing=loglevel=3 \
  --append-if-missing=preempt=full \
  --append-if-missing=zswap.enabled=0 \
  --append-if-missing=nowatchdog

# Universal InitRAMFS, reliable and standardized system
rpm-ostree initramfs --disable

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
