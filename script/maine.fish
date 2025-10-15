#!/bin/fish

if fish_is_root_user
    echo "Running as root. Please run as intended in the documentation by directly copy-pasting the box"
    echo "without root permissions"
    exit
else
    echo "Running as a regular user. Proceeding..."
end

sudo curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/bulkexec.fish" | sudo fish
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/ujust.fish" | fish
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/gsettings.fish" | fish
systemctl reboot
