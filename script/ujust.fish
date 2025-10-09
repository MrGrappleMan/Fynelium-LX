#!/usr/bin/env fish

# Gets executed once by root, then the user, as seeen in documentation.

ujust setup-decky install # Even for desktop users of Big Picture mode, it is still conventient
ujust setup-decky prerelease
ujust get-framegen install-decky-plugin
ujust get-framegen install
ujust get-lsfg install # Best to only be used for non fast paced games
ujust get-lsfg install-decky-plugin
ujust toggle-password-feedback off # Safer, prevents password glimpsing
ujust configure-grub unhide
#ujust enable-automounting
#ujust enable-steamos-automount
#ujust setup-sunshine enable # Remote desktop access
ujust get-media-app "YouTube" # Dedicated and optimized for YouTube with a cleaner interface.
ujust get-media-app "Spotify" # Native Client
ujust get-media-app "YouTube Music"
