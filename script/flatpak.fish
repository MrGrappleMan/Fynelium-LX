#!/usr/bin/env fish

# Alias
alias fpk "flatpak --system"
alias fpkrepadd "flatpak --system remote-add --if-not-exists"
alias fpkrepdel "flatpak --system remote-delete --force"
alias fpkpkgadd "flatpak --system install -y --noninteractive --or-update"
alias fpkpkgdel "flatpak --system uninstall -y --noninteractive --force-remove"
