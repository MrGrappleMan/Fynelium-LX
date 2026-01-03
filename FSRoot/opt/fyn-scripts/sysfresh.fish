#!/usr/bin/env fish

### This file is for overall system maintenance with custom arguments
### It does what uupd can't.
### RPM-OSTree updates and package layering are superior for cases like performance, low overhead and integration
### Except for convenience, some less breakability and ease of use, go ahead with Flatpak

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
