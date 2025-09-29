#!/bin/fish

ujust setup-decky install
ujust setup-decky prerelease # Still of utility on desktops
ujust get-decky-bazzite-buddy # Bazzite changelog view
ujust get-framegen install-decky-plugin
ujust get-framegen install
ujust get-lsfg install
ujust get-lsfg install-decky-plugin
ujust toggle-password-feedback off # Safer
ujust configure-grub unhide
#ujust enable-automounting
#ujust enable-steamos-automount
#ujust setup-sunshine enable # Remote desktop access
ujust get-media-app "YouTube" # Dedicated and optimized for YouTube with a cleaner interface.
ujust get-media-app "Spotify" # Native Client
ujust get-media-app "YouTube Music"
dconf load / < /tmp/Fynelium-LX/script/gnome.dconf
dconf load /org/gnome/shell/extensions/ < /tmp/Fynelium-LX/script/gnome-extensions.dconf
