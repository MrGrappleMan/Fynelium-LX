#!/usr/bin/env fish

# 📛 Alias
alias rot "rpm-ostree"
function rotPkg+ -d "RPM-OSTree add package if present(dependancy checks not implemented yet)"
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
alias rotPkg+Adv "rpm-ostree install --allow-inactive --idempotent -y" # Use if you know the package exists and there won't be dependency conflicts
alias rotPkg- "rpm-ostree uninstall --allow-inactive --idempotent -y"

# Cancel background transactions
rot cancel

# Rebase - to Bazzite GNOME DX
echo "⎋ Rebase to Bazzite Dev Experience - GNOME desktop base image"
brh rebase bazzite-dx-gnome:latest -y # Great for general purpose development, productivity and gaming. Most feature packed and well maintained - ignoring the bleeding edge-ness, but you can easily revert.
#rot rebase --experimental ostree-image-signed:docker://ghcr.io/ublue-os/bazzite-dx-gnome:latest # Same outcome, but different method
#rot rebase --experimental fedora:fedora/rawhide/x86_64/cosmic-atomic # Do not use, just for reference

# PKG DEL

# PKG ADD

### Notes:
### Always update system before installing packages.
### Manually creating systemd unit files in /etc/systemd/system/ can potentially cause an rpm-ostree hardlinking 
### file exists error when you try to install the actual packages that provide those same files later. 
### Systemd units placed in /etc/systemd/system/ are part of the mutable host configuration, 
### which rpm-ostree attempts to manage or migrate across deployments. When a package providing the exact same 
### file is introduced, the conflict occurs. It it happens, rename the doubtful one to *.bak, rpm-ostree operation goes here, rename to original.

   echo "🢷 Adding packages to RPM-OSTree, this may take time. Zero trust upon whatever packages that even the maintainer inserts, for safeguards."
   rotPkg+ "rust-zram-generator-devel systemd-swap preload \
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
    rust cargo rustup clippy \
    git gh \
    distcc distcc-server \
    java-latest-openjdk \
    libvirt-daemon-kvm qemu-kvm qemu-kvm-core \
    \
    warp-terminal \
    cosmic-epoch cosmic-desktop xdg-desktop-portal-cosmic initial-setup-gui-wayland-cosmic cosmic-greeter cosmic-comp cosmic-app-library cosmic-applets cosmic-edit cosmic-idle cosmic-osd cosmic-session cosmic-settings cosmic-settings-daemon cosmic-store fedora-release-cosmic-atomic cosmic-config-fedora greetd \
    mission-center \
    thunar featherpad \
    google-chrome-canary \
    obs-studio obs-studio-libs obs-studio-plugin-browser \
    krita krita-libs \
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

###### Reserved/reference pacakges:
## CONFLICTS ##
# warp-cli | warp-terminal ( it already includes warp-cli )
# tlp, tlp-rdw | tuned-ppd, power-profiles-daemon ( architectural shift in tlp. great but inconvenient, therefore it conflicts with the base image, error: Checkout tlp-1.9.0-6.fc44.noarch: Hardlinking 22/4ea4cdcf902e721f5550bca4e5e6e1630672751aa0931cdad5634f7eb49201.file to net.hadess.PowerProfiles.service: File exists )

## PORTS ## for GUI/applications that work better on other package managers
# boinc-manager | fpk:edu.berkeley.BOINC

#obs-studio-plugin-vaapi obs-studio-plugin-vkcapture obs-studio-plugin-droidcam
## GhosTTY ## ghostty-nightly ghostty-nightly-fish-completion ghostty-nightly-shell-integration

     ## Pentesting / Hacking:
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

# Kernel Arguments
# (n) rhgb - faster boot, even if not by much
# quiet - Suppresses unnecessary dialogs
# SysRq not required for average user
# bluetooth.disable_ertm=0 - modern technology, enhances efficiency
# zswap > (n) zram - Serves as a very efficient fallback to prevent OOM crashes. Lifespan not reduced by a lot on NVMe SSDs
# preempt=full - Dynamic Preempt: full
# nowatchdog - no system watchdog
# threadirqs - threaded irqs have dynamic priority management, unlike hard irqs
# amd_pstate/intel_pstate - always better than acpi-cpufreq

echo "🗣️ Modifying kernel arguments"
rot kargs \
  --delete-if-present=rhgb \
  --append-if-missing=quiet \
  --append-if-missing=threadirqs \
  --append-if-missing=sysrq_always_enabled=1 --delete-if-present=sysrq_always_enabled=0 \
  --append-if-missing=consoleblank=0 \
  --delete-if-present=profile \
  --delete-if-present=bluetooth.disable_ertm=1 --append-if-missing=bluetooth.disable_ertm=0 \
  --delete-if-present=nomodeset \
  --append-if-missing=loglevel=3 \
  --append-if-missing=preempt=full \
  --delete-if-present=systemd.zram=1 --append-if-missing=systemd.zram=0 \
  --append-if-missing=zswap.enabled=1 --delete-if-present=zswap.enabled=0 \
  --append-if-missing=zswap.shrinker_enabled=Y --delete-if-present=zswap.shrinker_enabled=N \
  --append-if-missing=zswap.zpool=zsmalloc \
  --append-if-missing=zswap.compressor=lz4 --delete-if-present=zswap.compressor=lzo zswap.compressor=zstd \
  --append-if-missing=nowatchdog \
  --append-if-missing=pcie_aspm=on \
  --append-if-missing=amd_pstate=guided --append-if-missing=amd_pstate.enable=1 --append-if-missing=amd_pstate.shared_mem=1 \
  --append-if-missing=intel_pstate=active --append-if-missing=intel_pstate.enable=1

# intel_pstate=guided does not exist
# lz4 > lzo in terms of efficiency and modernity. zstd fine for speed but great for balanced usage. brotli is unsuitable for this, as memory content is dynamic.
# lz4 overall lowest latency

# initramfs
echo InitRAMFS - Centrally compiled provided, reliable, standardized system, reduced failure points
rpm-ostree -q initramfs --disable
