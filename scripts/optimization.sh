#iniramfs
sudo sed -i 's/#COMPRESSION="lz4"/COMPRESSION="lz4"/g' /etc/mkinitcpio.conf
sudo sed -i 's/#COMPRESSION_OPTIONS=()/COMPRESSION_OPTIONS=(-9)/g' /etc/mkinitcpio.conf

#zram
sudo pacman -S zram-generator
