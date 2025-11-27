#!/usr/bin/env fish

clear
# RootCheck
if fish_is_root_user
    echo "Is root user, proceeding..."
else
    echo "Not running as root! You are supposed to run this as root"
    exit
end

# Retrieval of project files
echo Getting project files from GitHub
cd /tmp/
rm -rf /tmp/Fynelium-LX
mkdir -p /tmp/Fynelium-LX
git clone https://github.com/MrGrappleMan/Fynelium-LX.git /tmp/Fynelium-LX/
cd /tmp/Fynelium-LX/

# FS Copy over
echo Copying over additions to filesystem
cp -r /tmp/Fynelium-LX/FSRoot/etc/* /etc/
cp -r /tmp/Fynelium-LX/FSRoot/var/* /var/
cp -r /tmp/Fynelium-LX/FSRoot/opt/* /opt/
##cp -r /tmp/Fynelium-LX/FSRoot/root/* /root/

# FS Perms
echo Setup filesystem permissions
mkdir -p /etc/playit
mkdir -p /opt/playit
chmod a+x /opt/playit/playit
chmod a+x /opt/mc-server/mc-server

# Subexecution of sub-scripts that dont require user interaction. doubtful of ujust and flatpak
echo Now executing subscripts
fish /tmp/Fynelium-LX/script/Automated/rpm-ostree.fish
fish /tmp/Fynelium-LX/script/Automated/flatpak.fish
fish /tmp/Fynelium-LX/script/Automated/systemd.fish
fish /tmp/Fynelium-LX/script/Automated/fwupdmgr.fish
fish /tmp/Fynelium-LX/script/Automated/dconf.fish
fish /tmp/Fynelium-LX/script/Automated/ujust.fish
