#!/usr/bin/env fish

# ⚜️ System-D: The core of Linux for its functioning and handling essential system functions, beside being just an init system

timedatectl set-ntp true --no-ask-password

# 🫥 Mask - never run
  systemctl mask \
   systemd-rfkill systemd-rfkill.socket power-profiles-daemon \
   tlp

# 🙂 Unmask - allow to run
  systemctl unmask \
   shutdown.target reboot.target poweroff.target halt.target

# 🟢 Enable - Run at startup - reenable ensures that precedence set by Systemd's developers is followed in the [Install] section
  systemctl reenable \
   boinc-client \
   systemd-timesyncd \
   gdm \
   podman podman.socket podman-auto-update.timer \
   auto-cpufreq \
   uupd uupd.timer rpm-ostree-countme rpm-ostree-countme.timer fyn-sysfresh.timer \
   fstrim.timer btrfs-dedup@var-home.timer \
   systemd-bsod \
   sshd tailscaled tor hblock hblock.timer \
   preload

# 🟥 Disable - Do not run at startup
  systemctl disable \
   fyn-sysfresh \
   tlp \
   rpm-ostreed-automatic rpm-ostreed-automatic.timer \
   docker docker.socket \
   podman-auto-update
