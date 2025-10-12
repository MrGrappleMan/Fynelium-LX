#!/bin/fish

sudo curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/main.fish" | sudo fish
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/ujust.fish" | fish
curl "https://raw.githubusercontent.com/MrGrappleMan/Fynelium-LX/refs/heads/main/script/gsettings.fish" | fish
systemctl reboot
