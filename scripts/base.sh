sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --refresh-keys
sudo pacman -Sy archlinux-keyring
sudo systemctl enable --now archlinux-keyring-wkd-sync.timer

yay -S --noconfirm alhp-keyring alhp-mirrorlist
#DANGER!!! Not all processors support optimized packages!
gen=$(/lib/ld-linux-x86-64.so.2 --help | grep -B 3 -E "x86-64-v2" | grep "(supported, searched)" | head -n 1 | grep -o "v[0-9]")
echo -e "[core-x86-64-$gen]\nInclude = /etc/pacman.d/alhp-mirrorlist" | sudo tee -a /etc/pacman.conf
echo -e "[extra-x86-64-$gen]\nInclude = /etc/pacman.d/alhp-mirrorlist" | sudo tee -a /etc/pacman.conf
echo -e "[multilib-x86-64-$gen]\nInclude = /etc/pacman.d/alhp-mirrorlist" | sudo tee -a /etc/pacman.conf
echo -e "[core]\nInclude = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf
echo -e "[extra]\nInclude = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf
echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf

sudo reflector --verbose --country 'Russia' -l 25 --sort rate --save /etc/pacman.d/mirrorlist
sudo sed -i 's/\[options\]/\[options\]\nDisableDownloadTimeout/g' /etc/pacman.conf
sudo pacman -Syyuu

