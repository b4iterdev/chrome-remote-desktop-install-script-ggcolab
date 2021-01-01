#! /bin/bash
printf "Installing CRD-server... \nThis might take a while... " >&2
{
sudo useradd -m b4iterdev
sudo adduser b4iterdev sudo
echo 'b4iterdev:b4iter' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser b4iterdev chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete \nCreated new user b4iterdev with password:b4iter \nYou can change both b4iterdev's password with passwd(with no sudo) \nOr you can change root's password with sudo passwd" >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless and copy command of Debian Linux \n'
read -p "Paste Here: " CRP
su - b4iterdev -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi
