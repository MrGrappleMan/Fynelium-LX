#!/bin/fish

clear
if fish_is_root_user
    echo "Running as root! Please re-run as a regular user, as intended."
    exit
end

echo Insert the password for your user,
sudo curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/Automated.fish" | sudo fish
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/Automated/ujust.fish" | fish
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/Automated/gsettings.fish" | fish
systemctl reboot
