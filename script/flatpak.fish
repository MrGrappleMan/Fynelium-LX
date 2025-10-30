#!/usr/bin/env fish

# 📛 Alias
alias fpk "flatpak --system"
alias fpkUpd "fpk update -y"
alias fpkRep+ "fpk remote-add --if-not-exists"
alias fpkRep- "fpk remote-delete --force"
alias fpkPkg+ "fpk install -y --noninteractive --or-update"
alias fpkPkg- "fpk uninstall -y --noninteractive --force-remove"

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

# PKG - ## Flatpaks system wide, data stays separate for users. Standardizes location and saves storage.
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
   rocks.shy.VacuumTube io.github.ecotubehq.player \
   com.microsoft.EdgeDev \
   org.libreoffice.LibreOffice io.github.brunofin.Cohesion \
   org.torproject.torbrowser-launcher io.frama.tractor.carburetor \
   com.visualstudio.code \
   org.inkscape.Inkscape org.kde.krita \
   org.gnome.Boxes
