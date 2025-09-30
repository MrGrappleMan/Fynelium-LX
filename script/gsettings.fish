#!/usr/bin/env fish

# Gets executed once by root, then the user, as seeen in documentation.

dconf load / < /tmp/Fynelium-LX/export/gnome.dconf
dconf load /org/gnome/shell/extensions/ < /tmp/Fynelium-LX/export/gnome-extensions.dconf
