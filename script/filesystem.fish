#!/usr/bin/env fish

cp -r /tmp/Fynelium-LX/FSRoot/etc/* /etc/
cp -r /tmp/Fynelium-LX/FSRoot/var/* /var/
cp -r /tmp/Fynelium-LX/FSRoot/opt/* /opt/
##cp -r /tmp/Fynelium-LX/FSRoot/root/* /root/
mkdir -p /etc/playit
mkdir -p /opt/playit
chmod a+x /opt/playit/playit
chmod a+x /opt/mc-server/mc-server
