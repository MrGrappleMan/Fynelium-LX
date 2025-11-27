#!/usr/bin/env fish

### This file is for overall system maintenance with custom arguments, till a proper topgrade config has been made
### Currently, a makeshift version of uupd

# Systemd

sysctl --system
systemctl daemon-reload

# RPM-OSTree

rpm-ostree -q reload
rpm-ostree -q upgrade --trigger-automatic-update-policy --allow-downgrade --bypass-driver
rpm-ostree apply-live
rpm-ostree apply-live --allow-replacement

# Flatpak

flatpak --system update -y --force-remove --appstream --noninteractive
