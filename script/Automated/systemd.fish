#!/usr/bin/env fish

# ⚜️ System-D: The core of Linux for its functioning and handling essential system functions, beside being just an init system

timedatectl set-ntp true --no-ask-password

# 🫥 Mask - never run, even manually
  systemctl mask \
   systemd-rfkill systemd-rfkill.socket

# 🙂 Unmask - allow to run
  systemctl unmask \
   shutdown.target reboot.target poweroff.target halt.target

# 🟢 Enable at startup - reenable ensures that precedence set by Systemd's developers is followed
  systemctl reenable \
   systemd-timesyncd \
   gdm \
   podman \
   tlp \
   uupd.timer rpm-ostree-countme.timer fyn-sysfresh.timer \
   fstrim.timer btrfs-dedup@var-home.timer \
   systemd-bsod \
   sshd tailscaled tor \
   preload

# 🟥 Disable at startup
  systemctl disable \
   uupd rpm-ostree-countme fyn-sysfresh
