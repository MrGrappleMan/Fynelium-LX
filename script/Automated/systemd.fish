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

# 🟢 Enable - Run at startup - reenable ensures that precedence set by Systemd's developers is followed in the [Install] section, but can cause issues if the top file as by precedence does not contain an [Install] section
systemctl enable \
   boinc-client \
   systemd-timesyncd \
   gdm \
   podman podman.socket podman-auto-update.timer \
   auto-cpufreq \
   uupd.timer fyn-bootc-upd.timer rpm-ostree-countme.timer fyn-sysfresh.timer podman-auto-update.timer \
   fstrim.timer beesd@var-home \
   systemd-bsod \
   sshd tailscaled tor \
   hblock.timer \
   preload

# 🟥 Disable - Do not run at startup
  systemctl disable \
   uupd fyn-bootc-upd rpm-ostree-countme fyn-sysfresh podman-auto-update \
   tlp \
   rpm-ostreed-automatic rpm-ostreed-automatic.timer \
   docker docker.socket \
   hblock
