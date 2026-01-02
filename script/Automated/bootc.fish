#!/bin/fish

# Ensure clean state
rpm-ostree reset -q

# Switch base
bootc switch ghcr.io/ublue-os/bazzite-dx-gnome:latest --soft-reboot auto --quiet

# Upgrade
bootc upgrade
