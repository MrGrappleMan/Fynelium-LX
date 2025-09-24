#!/bin/fish

# Aliases
alias fpk "flatpak --system"
alias fpkrepadd "flatpak --system remote-add --if-not-exists"
alias fpkrepdel "flatpak --system remote-delete --force"
alias fpkpkgadd "flatpak --system install -y --noninteractive --include-sdk --or-update"
alias fpkpkgdel "flatpak --system uninstall -y --noninteractive --force-remove"

# PKG DEL
  flatpak uninstall -u --all -y --noninteractive --force-remove
  fpkpkgdel org.mozilla.firefox
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
# PKG ADD
  #fpkpkgadd flathub-beta \
   #org.freedesktop.Platform org.gnome.Platform \
   #org.freedesktop.Sdk org.gnome.Sdk
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

