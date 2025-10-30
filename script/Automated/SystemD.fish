#!/usr/bin/env fish

# ⚜️ System-D: The core of Linux for its functioning and handling essential system functions, beside being just an init system

# ⌚ NTP
  nohup timedatectl set-ntp true --no-ask-password &

# 🔃 Reload configurations
  systemctl daemon-reload

# 🫥 Mask
  systemctl mask \
   systemd-rfkill systemd-rfkill.socket

# 🙂 Unmask
  systemctl unmask \
   shutdown.target reboot.target poweroff.target halt.target

# 🟢 Enable
  systemctl reenable \
   systemd-timesyncd \
   tlp \
   uupd.timer rpm-ostree-countme.timer \
   fstrim.timer btrfs-dedup@var-home.timer \
   systemd-bsod \
   sshd tailscaled tor \
   preload systemd-zram-setup@zram0

# 🟥 Disable
  # systemctl disable
