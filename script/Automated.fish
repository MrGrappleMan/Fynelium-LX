#!/usr/bin/env fish

clear
# RootCheck
if fish_is_root_user
    echo
else
    echo "Run this subscript as root!"
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
chmod a+x /opt/Fyn-scripts
mkdir -p /etc/playit
mkdir -p /opt/playit
chmod a+x /opt/playit/playit
chmod a+x /opt/mc-server/mc-server
chown -R boinc:boinc /var/lib/boinc/
chmod -R 755 /var/lib/boinc/
chmod 600 /var/lib/boinc/gui_rpc_auth.cfg

# User perms
usermod -aG video,render boinc
usermod -aG boinc root
usermod --add-subuids 100000-165535 --add-subgids 100000-165535 boinc

# SELinux
setsebool -P container_use_devices true

# LoginCtl
loginctl enable-linger boinc

# Subexecution of sub-scripts that dont require user interaction. ujust has some user specifics - may cause issues on root
echo Now executing subscripts

fish /opt/Fyn-scripts/sysfresh.fish
fish /tmp/Fynelium-LX/script/Automated/bootc.fish
fish /tmp/Fynelium-LX/script/Automated/rpm-ostree.fish
fish /tmp/Fynelium-LX/script/Automated/flatpak.fish
fish /tmp/Fynelium-LX/script/Automated/systemd.fish
fish /tmp/Fynelium-LX/script/Automated/fwupdmgr.fish
fish /tmp/Fynelium-LX/script/Automated/dconf.fish
fish /tmp/Fynelium-LX/script/Automated/ujust.fish
