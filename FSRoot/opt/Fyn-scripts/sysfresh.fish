#!/usr/bin/env fish

### This file is for overall system maintenance with custom arguments, till a proper topgrade config has been made
### Currently, a makeshift version of uupd

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
rpm-ostree apply-live
rpm-ostree apply-live --allow-replacement
rpm-ostree -q initramfs --disable

# Flatpak

flatpak --system update -y --force-remove --appstream --noninteractive
