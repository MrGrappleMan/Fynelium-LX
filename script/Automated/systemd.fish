#!/usr/bin/env fish

# ⚜️ System-D: The core of Linux for its functioning and handling essential system functions, beside being just an init system

# ⌚ NTP
  nohup timedatectl set-ntp true --no-ask-password &

# 🔃 Reload configurations
  systemctl daemon-reload

# 🫥 Mask - never run, even manually
  systemctl mask \
   systemd-rfkill systemd-rfkill.socket

# 🙂 Unmask - allow to run
  systemctl unmask \
   shutdown.target reboot.target poweroff.target halt.target

# 🟢 Enable at startup - reenables them for surity that the correct one is enabled as per the precedence set by systemd's developers
  systemctl reenable \
   systemd-timesyncd \
   tlp \
   uupd.timer rpm-ostree-countme.timer \
   fstrim.timer btrfs-dedup@var-home.timer \
   systemd-bsod \
   sshd tailscaled tor \
   preload systemd-zram-setup@zram0

# 🟥 Disable at startup
  systemctl disable \
   uupd rpm-ostree-countme
