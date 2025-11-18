
### We do not have the repos installed yet, so a base config with just the AUR will be used, else pacman errors for the missing mirrorlists and keys ##

## Adding repo keys
sudo rm -rf /var/lib/pacman/db.lck /etc/pacman.d/gnupg /var/lib/pacman/sync/* ~/pacman-git
sudo pacman -Sc --noconfirm
sudo pacman-key --init
sudo pacman-key --populate archlinux

# Chaotic AUR
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Replace basic conf with optimal conf w/multiple repos here #
rm -f /etc/pacman.conf
cp /etc/pacman.conf.fyn-mod /etc/pacman.conf
