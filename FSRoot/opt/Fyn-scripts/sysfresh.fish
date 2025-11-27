#!/usr/bin/env fish

### This file is for overall system maintenance with custom arguments
### It does what uupd can't. System updates and package layering are not inferior
### Except for convenience and ease of use

# Fyn-FScomponents

cd /tmp/
rm -rf /tmp/Fynelium-LX
mkdir -p /tmp/Fynelium-LX
git clone https://github.com/MrGrappleMan/Fynelium-LX.git /tmp/Fynelium-LX/
cd /tmp/Fynelium-LX/

cp -r /tmp/Fynelium-LX/FSRoot/etc/* /etc/
cp -r /tmp/Fynelium-LX/FSRoot/var/* /var/
cp -r /tmp/Fynelium-LX/FSRoot/opt/* /opt/
##cp -r /tmp/Fynelium-LX/FSRoot/root/* /root/

# Systemd

sysctl --system
systemctl daemon-reload
timedatectl set-ntp true --no-ask-password

# RPM-OSTree

rpm-ostree -q reload
rpm-ostree -q upgrade --trigger-automatic-update-policy --allow-downgrade --bypass-driver
rpm-ostree apply-live --allow-replacement
rpm-ostree apply-live
rpm-ostree -q initramfs --disable

# Flatpak

flatpak --system update -y --force-remove --appstream --noninteractive
