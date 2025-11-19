#!/bin/fish

clear
if fish_is_root_user
    echo "Running as root! Please run as intended in the documentation by directly copy-pasting the box"
    echo "that is, without root permissions. Some scripts need to run as regular user."
    exit
else
    echo "Regular user, proceeding..."
end

echo Insert the password for your user
sudo curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/Automated.fish" | sudo fish
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/Automated/ujust.fish" | fish
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/Automated/gsettings.fish" | fish
systemctl reboot
