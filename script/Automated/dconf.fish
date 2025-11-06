#!/usr/bin/env fish

# 👣 Configures GSettings / Dconf - The settings that affect the experience of GNOME

# Gets executed once by root, then the user, as seeen in documentation.

# Generic settings
dconf load / < /tmp/Fynelium-LX/export/gnome.dconf

# For specialized extensions
dconf load /org/gnome/shell/extensions/ < /tmp/Fynelium-LX/export/gnome-extensions.dconf
