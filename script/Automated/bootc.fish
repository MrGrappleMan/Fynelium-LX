#!/bin/fish

# ⛑️ Ensure clean state - remove compatibility
rpm-ostree reset -l -o -i -q
ostree admin pin --unpin 0
ostree admin pin --unpin 1
ostree admin pin --unpin 2
ostree admin pin --unpin 3
ostree admin pin --unpin 4

# 🎛️ Switch base - will change up later with custom image
bootc switch ghcr.io/ublue-os/bazzite-dx-gnome:latest --soft-reboot auto --quiet

# 📈 Upgrade
bootc upgrade --quiet
