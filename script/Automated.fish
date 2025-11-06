#!/usr/bin/env fish

# RootCheck
if fish_is_root_user
    echo "Starting..."
else
    echo "Not running as root! An internal error has happened. You are not supposed to run this by itself"
    exit
end

# Retrieval of project files

cd /tmp/
rm -rf /tmp/Fynelium-LX
mkdir -p /tmp/Fynelium-LX
git clone https://github.com/MrGrappleMan/Fynelium-LX.git /tmp/Fynelium-LX/
/tmp/Fynelium-LX/

# Copy over to filesystem
cp -r /tmp/Fynelium-LX/FSRoot/etc/* /etc/
cp -r /tmp/Fynelium-LX/FSRoot/var/* /var/
cp -r /tmp/Fynelium-LX/FSRoot/opt/* /opt/
##cp -r /tmp/Fynelium-LX/FSRoot/root/* /root/

# Permissions
mkdir -p /etc/playit
mkdir -p /opt/playit
chmod a+x /opt/playit/playit
chmod a+x /opt/mc-server/mc-server

# Subexecution of sub-scripts that dont require user interaction. doubtful of ujust and flatpak
fish /tmp/Fynelium-LX/script/Automated/rpm-ostree.fish
fish /tmp/Fynelium-LX/script/Automated/flatpak.fish
fish /tmp/Fynelium-LX/script/Automated/systemd.fish
fish /tmp/Fynelium-LX/script/Automated/fwupdmgr.fish
fish /tmp/Fynelium-LX/script/Automated/ujust.fish
fish /tmp/Fynelium-LX/script/Automated/gsettings.fish
