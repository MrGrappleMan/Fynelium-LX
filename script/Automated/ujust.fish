#!/usr/bin/env fish

# Gets executed once by root, then the user, as seeen in documentation. For fallback and some commands require non root user.

ujust setup-decky install # Even for desktop users of Big Picture mode, it is still conventient
ujust setup-decky prerelease
ujust get-framegen install-decky-plugin
ujust get-framegen install
ujust get-lsfg install # Best to only be used for non fast paced games, or where input lag is less of a concern.
ujust get-lsfg install-decky-plugin
ujust toggle-password-feedback off # Prevents shoulder surfing and when you are streaming
ujust configure-grub unhide
ujust enable-automount-all # Automounting of all media
#ujust setup-sunshine enable # Remote desktop access and gaming, best for Wayland
ujust get-media-app "YouTube" # Dedicated and optimized for YouTube with a cleaner interface.
ujust get-media-app "Spotify" # Web Client, only accessible through Big Picture mode
ujust get-media-app "YouTube Music" #
