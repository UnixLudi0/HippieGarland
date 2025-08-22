sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --refresh-keys
sudo pacman -Sy archlinux-keyring
sudo systemctl enable --now archlinux-keyring-wkd-sync.timer
echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" \
    | sudo tee -a /etc/pacman.conf
sudo pacman -Suy
sudo sed -i 's/#ParallelDownloads = 4/ParallelDownloads = 4/g' /etc/pacman.conf
sudo sed -i 's/\[options\]/\[options\]\nDisableDownloadTimeout/g' /etc/pacman.conf
sudo pacman -S base-devel git nano lrzip unrar unzip unace p7zip squashfs-tools qbittorrent firefox vlc thunar gvfs gvfs-mtp steam ttf-liberation sudo pacman -S nvidia-open-dkms nvidia-utils lib32-nvidia-utils nvidia-settings lib32-opencl-nvidia opencl-nvidia libxnvctrl lib32-vulkan-icd-loader libva-nvidia-driver {lib32-,}mesa {lib32-,}vulkan-intel {lib32-,}opencl-mesa intel-ucode linux-firmware-whence, linux-firmware-bnx2x, linux-firmware-liquidio, linux-firmware-marvell, linux-firmware-mellanox, linux-firmware-nfp, linux-firmware-qcom, linux-firmware-qlogic nvidia-prime
sudo mkinitcpio -P
echo "options nvidia NVreg_UsePageAttributeTable=1" >> /etc/modprobe.d/nvidia-pat.conf
sudo systemctl enable nvidia-powerd
echo "MODULES+=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)" >> /etc/mkinitcpio.conf.d/10-modules.conf
echo "ACTION=="add|bind", SUBSYSTEM=="pci", DRIVERS=="nvidia", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", TEST=="power/control", ATTR{power/control}="auto"" >> /etc/udev/rules.d/71-nvidia.rules
echo "ACTION=="remove|unbind", SUBSYSTEM=="pci", DRIVERS=="nvidia", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", TEST=="power/control", ATTR{power/control}="on"" >> /etc/udev/rules.d/71-nvidia.rules
