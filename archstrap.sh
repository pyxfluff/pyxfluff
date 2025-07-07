# pyxfluff 2025

# Initializes an Arch Linux LXC using a base image from the Proxmox repository

if ! grep -q '^ID=arch' /etc/os-release; then
    echo "you need arch linux, you are using $(cat /etc/os-release | grep 'PRETTY_NAME=')"
    exit 1
fi


# Initialize Pacman
pacman-key --init
pacman-key --populate archlinux
pacman -Syu --noconfirm

# User setup
read -p "Enter a username " username

useradd -m "$username"
passwd "$username"
pacman -S sudo nano git base-devel --noconfirm

echo "$username ALL=(ALL:ALL) ALL" > /etc/sudoers.d/$username
chmod 440 /etc/sudoers.d/$username

read -p "Enter any other tools you want to install (leave blank to skip): " tools

# initialization
su - "$username" <<EOF
    cd ~
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm

    if [[ -n "$tools" ]]; then
        yay -S $tools
    fi

    echo "All done! Your container is now ready. Public IP:"
    curl https://myip.wtf

    echo "Private IP:"
    ip route get 1.1.1.1 | awk '{print \$7}'
EOF

