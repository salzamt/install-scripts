sudo apt-get update && sudo apt-get upgrade && apt-get install curl

# graphics, wirelesse, bluetooth, etc....a little helper from ubuntu
sudo ubuntu-drivers autoinstall

# timeshift backup repo
sudo apt-add-repository -y ppa:teejee2008/ppa

# shotcut video editor
sudo add-apt-repository ppa:haraldhv/shotcut

# pinta image editing
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable

# python terminal color module (used for i3blocks custom blocks)
sudo pip install termcolor


# ubuntu make
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make

# 0ad (game)
sudo add-apt-repository ppa:wfg/0ad

# signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb keyring.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
sudo dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list

# bring back gnome handyness in i3 
sudo apt install -y gnome-flashback gnome-sushi gnome-tweak-tool
cd ~/workspace
git clone https://github.com/glsorre/i3-gnome
cd i3-gnome
sudo make install

# insomnia
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" |  sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -


# installations of some fancy things.
sudo apt update
sudo apt install i3 i3blocks redshift-gtk gtk-recordmydesktop blueman gthumb openvpn htop insomnia pavucontrol gpick curl feh zsh tmux vim vifm snapd timeshift shotcut pinta darktable gnome-screenshot ubuntu-make signal-desktop git arandr glmark2 hardinfo

# little more hd format utils for exfat and hfs+
sudo apt-get install exfat-fuse exfat-utils hfsprogs

# optional games
sudo apt install steam 0ad 

# whatsdesk=whatsapp linux client similar to signal client
sudo snap install spotify vlc audacity whatsdesk mailspring viking-gps

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# playerctl for adding hotkeys and i3wm interaction of i3blocks with media players
cd ~/Downloads
wget https://github.com/acrisci/playerctl/releases/download/v2.0.1/playerctl-2.0.1_amd64.deb
sudo dpkg -i playerctl-2.0.1_amd64.deb
# nordvpn
wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo dpkg -i nordvpn-release_1.0.0_all.deb

# i3 configured wallpaper
wget https://wallpapercave.com/wp/y3MGd53.jpg ~/Pictures/wallpaper.jpg

# install megasync CURRENTLY MANUALLY
# https://mega.nz/sync

# 1password CURRENTLY MANUALLY
# https://support.1password.com/command-line-getting-started/

# docker (c&p from docs...)
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce nordvpn

# pycharm
umake ide pycharm-professional

sudo apt-get install qlandkartegt 
sudo apt install inkscape
sudo apt install deepin-screenshot
sudo apt install gimp
sudo apt install kolourpaint
sudo apt install texlive

pip install ranger-fm

# install dunst
apt install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev
sudo apt install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libnotify-dev
cd workspace
git clone https://github.com/dunst-project/dunst.git && cd dunst && nmake && nsudo make install
#check out dunst espeak to have your notifications read out
sudo apt-get install espeak


#partition stuff
sudo apt install gparted gpart

# systemd for i3lock and nordvpn
/etc/systemd/system/i3lock.service /etc/systemd/system/nordvpn_disc.service
/etc/systemd/system/nordvpn_conn.service
/etc/systemd/system/i3lock.service
systemctl enable nordvpn_disc.service
systemctl enable nordvpn_conn.service
systemctl enable i3lock.service

# python-vim ide
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev git ctags vim-gtk
git clone https://github.com/rapphil/vim-python-ide.git && cd vim-python-ide && ./install.sh

# install sensors (CLI: sensors, pensor for GUI)
sudo apt install lm-sensors hddtemp powertop psensor && sudo sensors-detect && sensors

# python pip 2 a 3
sudo apt install python-pip python3-dev libjpeg-dev gir1.2-gexiv2-0.10 jpeginfo python3-pip

# image duplicate finder
#https://github.com/jesjimher/imgdupes
sudo pip3 install paramiko
sudo pip3 install jpegdupes

# andbox for running android apps
sudo snap install --devmode --beta anbox
snap refresh anbox --edge --devmode
sudo add-apt-repository ppa:morphis/anbox-support
sudo apt install linux-headers-generic anbox-modules-dkms
sudo modprobe ashmem_linux
sudo modprobe binder_linux

#uncomplicated firewall
ufw enable
uwf allow in ssh

# link tmux config
ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf

# install alacritty (gpu accelerated terminal)
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty

# disable power button shutdown action - set to ignore.
echo "HandlePowerKey=suspend" | sudo tee -a /etc/systemd/logind.conf
sudo service systemd-logind suspend

# polybar
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
cd workspace
git clone --recursive https://github.com/jaagr/polybar
cd polybar
./build.sh
cp /usr/local/share/doc/polybar/config ~/.config/polybar; polybar -c ~/.config/polybar example

# install multibootusb for live usb creation scripts
http://multibootusb.org/page_download/

#install kitty (terminal)
git clone --depth 1 git@github.com:dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
cd ~/.config/kitty
ln -s ./kitty-themes/themes/Earthsong.conf ~/.config/kitty/theme.conf
# add this to kitty conf: include ./theme.conf


# nordlynx wireguard
sudo add-apt-repository ppa:wireguard/wireguard
sudo apt-get install wireguard
nordvpn set technology nordlynx


# equalizer
sudo apt install pulseaudio-equalizer

# lbry.tv client
# download and install client from https://beta.lbry.tv/


# blender
apt install blender

# testdisk for photorec (deleted / lost file recovery)
sudo apt-get install testdisk
