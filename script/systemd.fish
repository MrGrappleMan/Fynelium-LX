# NTP
  nohup timedatectl set-ntp true --no-ask-password &

# reload
  systemctl daemon-reload

# Mask
  systemctl mask \
   systemd-rfkill systemd-rfkill.socket

# Unmask
  systemctl unmask \
   shutdown.target reboot.target poweroff.target halt.target

# Enable
  systemctl reenable \
   systemd-timesyncd \
   tlp \
   uupd uupd.timer rpm-ostree-countme rpm-ostree-countme.timer \
   fstrim.timer \
   systemd-bsod \
   sshd tailscaled \
   preload systemd-zram-setup@zram0 \
   tor
