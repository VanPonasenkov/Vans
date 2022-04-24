if [ $(whoami) != "root" ]; then
    echo "Run the script from root!"
    exit 0
fi

pfld=$(pwd)

# Packages Download Section
libs=""
while IFS= read data; do
    libs+="$data " 
done < libs.txt
pacman -S $libs

# User Creation Section
echo "Would you like to create a new user?: "
read usrchoice
if [[ "$usrchoice" = "y" || "$usrchoice" = "yes" ]]; then
    echo "Enter the username: "
    read username
    useradd -mg wheel $username
fi

# Doas Configuration Section
echo -e "permit persist :wheel\n" > /etc/doas.conf
doas -C /etc/doas.conf

mkdir "/home/$username/sources"
mv "$pfld/dwm" "/home/$username/sources"
mv "$pfld/dmenu" "/home/$username/sources"
mv "$pfld/st" "/home/$username/sources"
mv "$pfld/.config" "/home/$username"
