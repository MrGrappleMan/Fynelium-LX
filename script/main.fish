#!/usr/bin/env fish

# RootCheck
if fish_is_root_user
    echo "Launched correctly! Starting..."
else
    echo "Not running as root. Please run as intended in the documentation by directly copy-pasting the box"
end

# Retrieval

cd /tmp/
rm -rf /tmp/Fynelium-LX
mkdir -p /tmp/Fynelium-LX
git clone https://github.com/MrGrappleMan/Fynelium-LX.git /tmp/Fynelium-LX/
/tmp/Fynelium-LX/

# Cloning
cp -r /tmp/Fynelium-LX/FSRoot/etc/* /etc/
cp -r /tmp/Fynelium-LX/FSRoot/var/* /var/
cp -r /tmp/Fynelium-LX/FSRoot/opt/* /opt/
##cp -r /tmp/Fynelium-LX/FSRoot/root/* /root/

# Permissions
mkdir -p /etc/playit
mkdir -p /opt/playit
chmod a+x /opt/playit/playit
chmod a+x /opt/mc-server/mc-server

# Sub-Execution
fish /tmp/Fynelium-LX/script/rpm-ostree.fish
fish /tmp/Fynelium-LX/script/flatpak.fish
fish /tmp/Fynelium-LX/script/systemd.fish
fish /tmp/Fynelium-LX/script/fwupdmgr.fish
