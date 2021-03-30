# only debian:
# add 32 bit support, for some packages
sudo dpkg --add-architecture i386

# if we checkout some repos
mkdir ~/workspace

sudo apt update
# select fastest package mirror before we start installing all that stuff
sudo apt install netselect-apt && sudo netselect-apt && sudo apt update
sudo apt upgrade


# install draw.io desktop
https://github.com/jgraph/drawio-desktop/releases/latest

# basic tools
sudo apt install curl wget snapd vim python-pip python3-pip hardinfo \
  ttf-dejavu git x11-utils arandr feh zsh tmux vifm pwgen nmap tcpdump \
  tmux rsync zip unzip htop iftop iotop whois dnsutils telnet bridge-utils mtr mtr-tiny\
  apt-transport-https ca-certificates yamllint htop pavucontrol gparted gpart stress kazam obs-studio flatpack \
  fzf # cli fuzzy finder
  # hstr # for zsh history search - thats crap...
  
# set default editor to vim
sudo update-alternatives --set editor /usr/bin/vim.basic

# vim IDE options
sudo apt install vim-youcompletemem
vam install youcompleteme
vam status
 
# pet snippet manager
cd ~/Downloads
wget https://github.com/knqyf263/pet/releases/download/v0.3.0/pet_0.3.0_linux_amd64.deb
sudo dpkg -i pet_0.3.0_linux_amd64.deb

pip install --upgrade setuptools
pip3 install --upgrade setuptools

pip install pip-tools
pip3 install pip-tools


pip install tools
pip3 install tools

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# repo for ghostwriter
# not working, 404
# sudo add-apt-repository ppa:wereturtle/ppa

# fancy tools
# geany: text editor
# testdisk: for photorec (deleted / lost file recovery)
sudo apt install \
  wireshark deepin-screenshot  geany gnome-screenshot scrot redshift-gtk \
  gtk-recordmydesktop blueman gthumb openvpn xautolock \
  gpick exfat-fuse exfat-utils hfsprogs steam thunderbird testdisk blender \
  pulseaudio-equalizer qlandkartegt texlive ranger-fm projectm-pulseaudio krita viking install nfs-kernel-server \
  nodejs npm samba v4l-utils qv4l2 ghostwriter mpd polybar libreoffice


# install proper CLI network manager
sudo apt purge network-manager && sudo apt install connman

# fix ralink issues
sudo su
echo "options rt2800usb nohwcrypt=1" > /etc/modprobe.d/rt2800usb.conf
exit

# if very little memory:
sudo apt install earlyoom

# latex stuff (texlive and texmaker)
sudo apt-get install texlive-full texmaker

sudo snap install spotify vlc audacity whatsdesk

# enable earlyOOM killer (https://github.com/rfjakob/earlyoom)
sudo systemctl enable earlyoom
sudo systemctl start earlyoom

pip3 install fabric

# python terminal color module (used for i3blocks custom blocks)
pip install termcolor

###############################################################################
######################### alacritty GPU terminal ##############################
###############################################################################
# ubuntu:
sudo snap install alacritty --classic

# debian:
sudo add-apt-repository ppa:mmstick76/alacritty
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv 8AC9B4BBBAB4900B
gpg --export --armor 8AC9B4BBBAB4900B | sudo apt-key add -
sudo apt update
sudo apt install alacritty

###############################################################################
######################### distro specifics ####################################
###############################################################################

######################### # only if ubuntu ####################################
# graphics, wirelesse, bluetooth, etc....a little helper from ubuntu
sudo ubuntu-drivers autoinstall
######################### only if debian  #####################################
/usr/sbin/usermod -aG sudo riccardo

# install driver for broadcom wifi if you have a broadcom wifi card
echo "deb http://deb.debian.org/debian buster-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms
modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
modprobe wl

# to install ubuntu ppas if we need some
sudo apt install build-essential devscripts

# if newest firefox is not installed or instead of ESR you want a newer one
# method 1 (quick but somehow memory hungry/bad video performance) via flatpak:
flatpak install flathub org.mozilla.firefox
# vim  /etc/profile -> add flatpack to path  PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt:/var/lib/flatpak/exports/bin"

# method 2 via tar file (rcommended but more steps)
mkdir -p ~/apps/firefox
cd ~/apps/firefox
wget https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US
tar -xcv <firefox...>
ln -s ~/apps/firefox/firefox ~/.local/bin/firefox

# create desktop entry (also for rofi to find ff with an icon, replace /home/riccardo with your home dir)
cat > ~/.local/share/applications/firefox.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Name=Mozilla Firefox
GenericName=Web Browser
Comment=Browse the Web
Exec=firefox
Icon=/home/riccardo/apps/firefox/browser/chrome/icons/default/default32.png
Terminal=false
Type=Application
Categories=Application;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;
StartupNotify=True
EOF

###############################################################################
######################### ppas for fancy apps #################################
###############################################################################

# timeshift backup repo
sudo apt-add-repository -y ppa:teejee2008/ppa && sudo apt install timeshift

# shotcut video editor
sudo add-apt-repository ppa:haraldhv/shotcut && sudo apt install shotcut

# pinta image editing (super laggy, replaced with gimp...)
# sudo add-apt-repository ppa:pinta-maintainers/pinta-stable && sudo apt install pinta

# ubuntu make
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make && sudo apt install ubuntu-make

# 0ad (game)
sudo add-apt-repository ppa:wfg/0ad && apt install 0ad

###############################################################################
######################### media apps ##########################################
###############################################################################
sudo apt install pitivi inkscape gimp darktable gnome-sushi

###############################################################################
######################### signal messenger ####################################
###############################################################################

# signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

###############################################################################
######################### insomnia rest client ################################
###############################################################################
# insomnia REST client
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" |  sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
sudo apt update && sudo apt install insomnia


# install tldr man page excerpt
sudo npm install -g tldr

###############################################################################
######################### nordvpn #####@#######################################
###############################################################################
# nordvpn if you have an account
cd ~/Downloads
wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo dpkg -i nordvpn-release_1.0.0_all.deb
sudo apt update
sudo apt install nordvpn
nordvpn login
nordvpn set technology nordlynx
nordvpn c

# nordlynx wireguard
# sudo add-apt-repository ppa:wireguard/wireguard
# sudo apt-get install wireguard
# nordvpn set technology nordlynx

# systemd for nordvpn todo
/etc/systemd/system/i3lock.service /etc/systemd/system/nordvpn_disc.service
/etc/systemd/system/nordvpn_conn.service
systemctl enable nordvpn_disc.service
systemctl enable nordvpn_conn.service

# local network fix
nordvpn whitelist add subnet 192.168.1.0/24


###############################################################################
######################### megasync ############################################
###############################################################################
#  megasync CURRENTLY MANUALLY
# https://mega.nz/sync

###############################################################################
######################### 1 password ## #######################################
###############################################################################
# 1password CURRENTLY MANUALLY
# https://support.1password.com/command-line-getting-started/

# cli client from https://app-updates.agilebits.com/product_history/CLI
cd ~/Downloads 
wget "https://cache.agilebits.com/dist/1P/op/pkg/v0.10.0/op_linux_amd64_v0.10.0.zip"
unzip op_linux_amd64_v0.10.0.zip
sudo mv op /usr/local/bin
op signin https://my.1password.com salzamt@live.com

###############################################################################
######################### docker ######@#######################################
###############################################################################
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

# isntall docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo groupadd docker
sudo usermod -aG docker $(whoami)

###############################################################################
######################### pycharm #####@#######################################
###############################################################################
# either via umake, snap or manually
umake ide pycharm-professional

# manually: https://www.jetbrains.com/pycharm/download/#section=linux

# symlink for pycharm in rofi
sudo ln -s /opt/jetbrains/pycharm-2020.2/bin/pycharm.sh /usr/local/bin/Pycharm

###############################################################################
######################### python-vim ide ######################################
###############################################################################
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev \
  libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev \
  python-dev python3-dev python3-docutils gcc git ctags vim-gtk
cd ~/workspace
git clone https://github.com/rapphil/vim-python-ide.git && cd vim-python-ide && ./install.sh

###############################################################################
################# sensors (CLI: sensors, pensor for GUI) ######################
###############################################################################
sudo apt install lm-sensors hddtemp powertop psensor && sudo sensors-detect && sensors


###############################################################################
####################### Image Manipulation ####################################
###############################################################################
# python pip 2 a 3
sudo apt install python-pip python3-dev libjpeg-dev gir1.2-gexiv2-0.10 \
  jpeginfo python3-pip

# image duplicate finder
#https://github.com/jesjimher/imgdupes
sudo pip3 install paramiko
sudo apt install  libturbojpeg0-dev; sudo pip3 install jpegdupes

###############################################################################
######################### android #############################################
###############################################################################
# android basics
sudo apt install android-tools-adb android-tools-fastboot
# andbox for running android apps on linux
sudo snap install --devmode --beta anbox
sudo snap refresh anbox --edge --devmode
sudo add-apt-repository ppa:morphis/anbox-support
sudo apt install linux-headers-generic anbox-modules-dkms
sudo modprobe ashmem_linux
sudo modprobe binder_linux

###############################################################################
######################### uncomplicated firewall ##############################
###############################################################################
ufw enable
uwf allow in ssh

# link tmux config
ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf

# disable power button shutdown action - set to ignore.
echo "HandlePowerKey=suspend" | sudo tee -a /etc/systemd/logind.conf
sudo service systemd-logind suspend

# install multibootusb for live usb creation scripts ?
# http://multibootusb.org/page_download/

# lbry.tv client ?
# download and install client from https://beta.lbry.tv/
tee -a /etc/apt/sources.list
###############################################################################
######################### gnome / gtk stuff ###################################
###############################################################################
# change gtk theme to dark
echo "[Settings]
gtk-application-prefer-dark-theme=1
gtk-theme-name=Adwaita-dark
gtk-icon-theme-name=Adwaita"| tee -a ~/.config/gtk-3.0/settings.ini

###############################################################################
############################## i3wm ###########################################
###############################################################################
sudo apt install i3 i3blocks rofi
# ONLY for i3wm beginners who want gnome helpers inside of i3wm.
# dont do it if you want to get the plain i3wm experience!!
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb keyring.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
sudo dpkg -i ./keyring.deb
sudo apt install -y gnome-flashback gnome-tweak-tool
cd ~/workspace
git clone https://github.com/glsorre/i3-gnome
cd i3-gnome
sudo make install

# droidcam for mounting an android cam into the system (android apk name: droidcam)
cd /tmp/
wget https://www.dev47apps.com/files/linux/droidcam_latest.zip
echo "7775e36b5325dc1f32d485eb3cc72fd1 droidcam_latest.zip" | md5sum -c --
unzip droidcam_latest.zip -d droidcam && cd droidcam
sudo ./install
lsmod | grep v4l2loopback_dc
droidcam
# droidcam-cli
# droidcam


# i3 alternating spiral layout
# alternating layout for i3
cd ~/workspace
git clone https://github.com/olemartinorg/i3-alternating-layout
pip install i3-py
# OR/AND (for Python 2.x)
# pip2 install i3-py
# in i3 conf: exec --no-startup-id python3 /path/to/alternating_layouts.py

# playerctl for adding hotkeys and i3wm interaction of i3blocks with media players
cd ~/Downloads
wget https://github.com/acrisci/playerctl/releases/download/v2.0.1/playerctl-2.0.1_amd64.deb
sudo dpkg -i playerctl-2.0.1_amd64.deb

# i3 configured wallpaper
wget https://wallpapercave.com/wp/y3MGd53.jpg ~/Pictures/wallpaper.jpg

# install dunst notifications (ubuntu)
sudo apt install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libnotify-dev
cd workspace
git clone https://github.com/dunst-project/dunst.git && cd dunst && nmake && nsudo make install
#check out dunst espeak to have your notifications read out
sudo apt-get install espeak

# dunst on debian:
sudo apt install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libnotify-dev libcairo2-dev libfontconfig1-dev libfreetype6-dev libxft-dev libfreetype6=2.9.1-3+deb10u1
cd workspace
git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install

# i3blocks systemd todo
/etc/systemd/system/i3lock.service
systemctl enable i3lock.service

# polybar
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
sudo apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev

cd workspace
git clone --recursive https://github.com/jaagr/polybar
cd polybar && ./build.sh
cp /usr/local/share/doc/polybar/config ~/.config/polybar; polybar -c ~/.config/polybar example


# install speedtest
sudo apt-get install gnupg1 apt-transport-https dirmngr
export INSTALL_KEY=379CE192D401AB61
# Ubuntu versions supported: xenial, bionic
# Debian versions supported: jessie, stretch, buster
export DEB_DISTRO=$(lsb_release -sc)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY
echo "deb https://ookla.bintray.com/debian ${DEB_DISTRO} main" | sudo tee  /etc/apt/sources.list.d/speedtest.list
sudo apt-get update
# Other non-official binaries will conflict with Speedtest CLI
# Example how to remove using apt-get
# sudo apt-get remove speedtest-cli
sudo apt-get install speedtest


# rename network interface if name is too long
In /etc/udev/rules.d/70-persistent-net.rules
add:
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTRS{product}=="802.11 n WLAN", ATTR{dev_id}=="0x0", ATTR{type}=="1", KERNEL=="wlan*", NAME="wlan1"


# add ssh key for ssh agent forwarding
ssh-add -k

# instll virtualilzation (libvirt, virt-manager and vagrant)
sudo apt install virt-manager vagrant libvirt-dev
sudo adduser $(whoami) libvirt
CONFIGURE_ARGS="with-libvirt-include=/usr/include/libvirt" vagrant plugin install vagrant-libvirt

# manually: install newest python on debian
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libssl-dev libreadline-dev libffi-dev curl libbz2-dev
cd Downloads
mkdir python38
cd python38
curl -O https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tar.xz
tar -xf Python-3.8.2.tar.xz
cd Python-3.8.2
./configure --enable-optimizations
make -j 14
sudo make altinstall
python3.8 --version




# configure your keyboard to your needs:
`sudo dpkg-reconfigure keyboard-configuration`
# left logo key for temporary layout switch, right one for permanent

