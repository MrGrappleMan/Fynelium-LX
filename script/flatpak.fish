#!/usr/bin/env fish

# 📛 Alias
alias fpk "flatpak --system"
alias fpkUpd "fpk update -y"
alias fpkRep+ "fpk remote-add --if-not-exists"
alias fpkRep- "fpk remote-delete --force"
alias fpkPkg+ "fpk install -y --noninteractive --or-update"
alias fpkPkg- "fpk uninstall -y --noninteractive --force-remove"

# REP -

# REP +
  fpkRep+ flathub https://flathub.org/repo/flathub.flatpakrepo
  fpkRep+ flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
  ###fpkRep+ eos-sdk https://ostree.endlessm.com/ostree/eos-sdk
  fpkRep+ igalia https://software.igalia.com/flatpak-refs/igalia.flatpakrepo
  fpkRep+ dragon-nightly https://cdn.kde.org/flatpak/dragon-nightly/dragon-nightly.flatpakrepo
  ###fpkRep+ eos-apps https://ostree.endlessm.com/ostree/eos-apps
  fpkRep+ webkit https://software.igalia.com/flatpak-refs/webkit-sdk.flatpakrepo
  fpkRep+ gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo
  fpkRep+ webkit-sdk https://software.igalia.com/flatpak-refs/webkit-sdk.flatpakrepo
  fpkRep+ fedora oci+https://registry.fedoraproject.org
  fpkRep+ fedora-testing oci+https://registry.fedoraproject.org/#testing
  ###fpkRep+ rhel https://flatpaks.redhat.io/rhel.flatpakrepo
  fpkRep+ eclipse-nightly https://download.eclipse.org/linuxtools/flatpak-I-builds/eclipse.flatpakrepo
  fpkRep+ elementaryos https://flatpak.elementary.io/repo.flatpakrepo
  fpkRep+ pureos https://store.puri.sm/repo/stable/pureos.flatpakrepo
  fpkRep+ kde-runtime-nightly https://cdn.kde.org/flatpak/kde-runtime-nightly/kde-runtime-nightly.flatpakrepo
  fpkRep+ cosmic https://apt.pop-os.org/cosmic/cosmic.flatpakrepo

# PKG - ## Keeping Flatpaks system wide tandardizes location and saves storage, yet data stays separate for users.
  flatpak uninstall -u --all -y --noninteractive --force-remove

# PKG +
  ##fpkPkg+ flathub-beta \
   ##org.freedesktop.Platform org.gnome.Platform \
   ##org.freedesktop.Sdk org.gnome.Sdk

  fpkPkg+ flathub \
    com.rafaelmardojai.Blanket \
    io.github.flattool.Warehouse \
    edu.berkeley.BOINC \
    org.vinegarhq.Sober io.mrarm.mcpelauncher \
    rocks.shy.VacuumTube com.warlordsoftwares.youtube-downloader-4ktube io.github.ecotubehq.player \
    com.microsoft.EdgeDev com.gopeed.Gopeed org.qbittorrent.qBittorrent \
    com.ranfdev.DistroShelf org.gnome.Boxes rs.ruffle.Ruffle \
    org.libreoffice.LibreOffice io.github.brunofin.Cohesion \
    org.torproject.torbrowser-launcher io.frama.tractor.carburetor \
    com.visualstudio.code \
    org.inkscape.Inkscape org.upscayl.Upscayl org.kde.krita org.blender.Blender xyz.woxel.Woxel com.obsproject.Studio \
    org.telegram.desktop io.github.tobagin.karere dev.vencord.Vesktop \
    com.github.wwmm.easyeffects org.nickvision.cavalier

    fpkPkg+ cosmic \
      io.github.cosmic_utils.cosmic-ext-applet-clipboard-manager \
      io.github.cosmic_utils.cosmic-ext-applet-external-monitor-brightness \
      io.github.cosmic_utils.minimon-applet
