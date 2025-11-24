#!/usr/bin/env fish

# 📛 Alias
alias fpk "flatpak --system" # Main alias
alias fpkUpd "fpk update -y" # Updation
alias fpkRep+ "fpk remote-add --if-not-exists" # Repository add
alias fpkRep- "fpk remote-delete --force" # Repository remove
function fpkPkg+ -d "Flatpak add packages with additional checks, right now incomplete"
    set -l remote $argv[2]
    set packages $argv
    if test (count $argv) -eq 1 -a -n (string match '* *' $argv[1])
        set packages (string split ' ' $argv[1])
    end
    set -l install_list
    for pkg in $packages
        # Search and parse output (tab-separated by default)
        set -l output (flatpak search --columns=application,remotes $pkg $scope 2>/dev/null)
        if test -z "$output"
            continue  # No results
        end
        set -l lines (string split \n -- $output)
        # Skip header if present
        set -l found false
        for line in $lines[2..-1]  # Assume first line is header
            set -l fields (string split \t -- $line)
            set -l candidate $fields[1]
            set -l remotes $fields[2]
            if test "$candidate" = "$pkg"
                # Exact match; check if our remote is available
                if string match -q "*$remote*" $remotes
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
        flatpak install -y --noninteractive --or-update --system $remote $install_list
    end
end
alias fpkPkg+Adv "flatpak install -y --noninteractive --or-update --system"
alias fpkPkg- "fpk uninstall -y --noninteractive --force-remove" # Package remove

# REP ( - Removal )

# REP ( + Install )
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

# PKG ( - Removal )
   flatpak uninstall -u --all -y --noninteractive --force-remove ## System wide Flatpaks standardize location and save storage, yet data stays separate for users.
   fpkPkg- \
     org.mozilla.firefox \
     com.google.Chrome
   
   # Use "app.zen_browser.zen" over "org.mozilla.firefox" - Polished experience
   # Use "com.google.ChromeDev" over "com.google.Chrome" - Faster updates

# PKG ( + Install )
   ##fpkPkg+ "flathub-beta \
   ##org.freedesktop.Platform org.gnome.Platform \
   ##org.freedesktop.Sdk org.gnome.Sdk" "flathub-beta"

  fpkPkg+Adv flathub \
    com.rafaelmardojai.Blanket \
    io.github.flattool.Warehouse \
    edu.berkeley.BOINC \
    org.vinegarhq.Sober app.twintaillauncher.ttl com.heroicgameslauncher.hgl \
    rocks.shy.VacuumTube com.warlordsoftwares.youtube-downloader-4ktube io.github.ecotubehq.player \
    com.ranfdev.DistroShelf org.gnome.Boxes rs.ruffle.Ruffle \
    io.github.brunofin.Cohesion \
    io.frama.tractor.carburetor \
    io.github.qwersyk.Newelle \
    org.upscayl.Upscayl com.obsproject.Studio \
    org.telegram.desktop com.rtosta.zapzap dev.vencord.Vesktop \
    com.github.wwmm.easyeffects org.nickvision.cavalier

# No using "com.visualstudio.code com.visualstudio.code.tool.fish com.visualstudio.code.tool.podman" - Bazzite-DX already has VSCode

    fpkPkg+Adv cosmic \
      io.github.cosmic_utils.cosmic-ext-applet-clipboard-manager \
      io.github.cosmic_utils.cosmic-ext-applet-external-monitor-brightness \
      io.github.cosmic_utils.minimon-applet
