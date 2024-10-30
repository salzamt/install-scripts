# only debian:
# add 32 bit support, for some packages
sudo dpkg --add-architecture i386

# add own user to sudoers file
/sbin/usermod -aG sudo <username>

# add sbin to path maybe??

# basic stuff
sudo apt-get install software-properties-common

# for nm-applet and bc its so beautiful
sudo apt install network-manager-gnome
sudo apt install qt5ct qt5-style-plugins
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> ~/.bash_profile


# a good fallback-terminal
sudo apt install xfce4-terminal

# edit /etc/network/interfaces to ensure the interfaces listed in `ip a` are configured
/sbin/ifup --all

# add the necessary bullseye sources to /etc/apt/sources.list
apt update && apt install vim i3 xinit

# add i3 to xorg init
exec i3 >> ~/.xinitrc

# check modifier config
Xmodmap
# assign modifier keys, test which is which
xev

# as user!
echo "exec i3" | tee ~/.xinitrc

# cycle last windows https://github.com/olivierlemoal/i3-swap-focus
pip install --upgrade i3-swap-focus

# cli connection manager
sudo apt install connman rfkill
sudo gpasswd -a <username> netdev

# graphical network manager applet
sudo apt install nm-tray

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
  hstr # for zsh history searcj
  ncdu # interactive disk utilization utility
  pcmanfm lxappearance
  figlet # FIGlet - display large characters made up of ordinary screen characters
  age # age encryption for chezmoi (or on ubuntu https://lindevs.com/install-age-command-for-encrypting-files-on-ubuntu )
  imagemagick # for mogrify and stuff
  silversearcher-ag # for vim fzf
  dialog # bash dialog for pomodoro
  neofetch # for showing terminal os info on startup
  wavemon # wifi singal monitoring 
  powertop # power measuring

# set default editor to vim
sudo update-alternatives --set editor /usr/bin/vim.basic


# pet snippet manager
cd ~/Downloads
wget https://github.com/knqyf263/pet/releases/download/v0.3.0/pet_0.3.0_linux_amd64.deb
sudo dpkg -i pet_0.3.0_linux_amd64.deb

pip install --upgrade setuptools
pip3 install --upgrade setuptools

pip install pip-tools
pip3 install pip-tools

# free cad
flatpak install flathub org.freecadweb.FreeCAD
flatpak install flathub org.openscad.OpenSCAD
flatpak install flathub com.sweethome3d.Sweethome3d

pip install tools
pip3 install tools

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# repo for ghostwriter
# not working, 404
# sudo add-apt-repository ppa:wereturtle/ppa

# fancy tools
# geany: text editor
# testdisk: for photorec (deleted / lost file recovery)
sudo apt install \
  wireshark deepin-screenshot  gnome-screenshot scrot redshift-gtk \
  gtk-recordmydesktop blueman gthumb openvpn xautolock \
  gpick exfat-fuse exfat-utils hfsprogs steam geary thunderbird testdisk blender \
  qlandkartegt texlive ranger-fm projectm-pulseaudio krita nfs-kernel-server \
  nodejs npm samba cifs-utils v4l-utils qv4l2 ghostwriter mpd polybar libreoffice gpsbabel-gui
  lsp-plugins pulseeffects # equalizer
  solaar # logitech receiver config playonlinux freecad


# install i3blocks-contrib scripts
cd ~/Downloads
wget https://github.com/Anachron/i3blocks/archive/refs/heads/master.zip
unzip i3blocks-master.zip
sudo mv i3blocks-master/blocks /usr/share/i3blocks

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
sudo snap install android-studio --classic
sudo snap install openboardview # for reading brd files of circuit boards

# enable earlyOOM killer (https://github.com/rfjakob/earlyoom)
sudo systemctl enable earlyoom
sudo systemctl start earlyoom

pip3 install fabric

# python terminal color module (used for i3blocks custom blocks)
pip install termcolor

asdf plugin-add elixir # https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add erlang
asdf install erlang latest
asdf install elixir latest

cd Downloads
wget "https://github.com/exercism/cli/releases/download/v3.1.0/exercism-3.1.0-linux-x86_64.tar.gz" # check for new version
tar -xf exercism-linux-64bit.tgz
tar -xf exercism-3.1.0-linux-x86_64.tar.gz
ls
mkdir -p ~/bin
mv exercism ~/bin
~/bin/exercism
exercism

##############################################################################
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

flatpak install flathub org.viking.Viking

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
# https://mega.nz/cmd

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
######################### github cli #############################################
###############################################################################
# git config
git config merge.tool vimdiff
git config merge.conflictstyle diff3
touch ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-apt
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

###############################################################################
######################### pycharm #############################################
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
# https://github.com/jesjimher/imgdupes
# old way
# sudo apt install  libturbojpeg0-dev; sudo pip3 install jpegdupes
# new way, maybe with venv if needed?
sudo apt-get install python3-dev libjpeg-dev gir1.2-gexiv2-0.10 jpeginfo python3-cffi libturbojpeg0-dev python3-gi
sudo pip install jpegdupes

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


# playerctl for adding hotkeys and i3wm interaction of i3blocks with media players
cd ~/Downloads
wget https://github.com/acrisci/playerctl/releases/download/v2.0.1/playerctl-2.0.1_amd64.deb
sudo dpkg -i playerctl-2.0.1_amd64.deb

# install dunst notifications (ubuntu)
sudo apt install dunst

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
#
# for chatgrape
sudo apt-get install libxml2-dev libxmlsec1-dev libxmlsec1-openssl

# radeontop
sudo apt install radeontop

# brightness control:
sudo apt install light
sudo usermod -a -G video riccardo
sudo chmod +s /usr/bin/light

# set dark theme
ls -d /usr/share/themes/* |xargs -L
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
# zoom for pdf reader
gsettings set org.gnome.Evince page-cache-size 2000

# ruby stuff
sudo gem install rubocop

# neo vim via app image
# bin from https://github.com/neovim/neovim/releases/tag/v0.5.1
chmod u+x nvim.appimage && ./nvim.appimage

# 3d stuff
sudo apt install slic3r freecad librecad

# vim for ruby / rails
sudo apt install vim-youcompletem
vam install youcompleteme
vam status

# or after PlugInstall maybe just
/home/riccardo/.vim/plugged/YouCompleteMe && python3 install.py --clangd-completer

# gcloud installation
gcloud beta compute ssh "mt-staging-develop-app" --tunnel-through-iap --project "meisterlabs-staging"
sudo apt-get install apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-cli
sudo apt-get update && sudo apt-get install google-cloud-cli
gcloud init


# brotab for changing firefox tab in rofi
pip install brotab
bt install
# install https://addons.mozilla.org/en-US/firefox/addon/brotab/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search
# restart firefox
parse it as so:

bt list | awk -F'\t' '{
    print $2
}' > urls-backup.txt

Then open all URLs in urls-backup.txt with normal Firefox:

while read url; do
    firefox "$url"
done < urls-backup.txt


# polkit dialog for sudo prompt in graphical applications
sudo apt install policykit-1-gnome
sudo budgie-polkit-dialog

# i3blocks disk io
sudo apt install dstat

# cli timer app
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cd ~/workspace
git clone git@github.com:prikhi/timerr.git
cd timerr
rustup default stable
cargo build
cargo install --path .
# export PATH="${HOME}/.cargo/bin/:${PATH}"
# timerr 2 "tee"

# install mac apps
# deb package from https://github.com/darlinghq/darling/releases


## k9s and other kubernetes stuff
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /home/riccardo/.zshrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/riccardo/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
brew install gcc
brew install derailed/k9s/k9s
brew install helm
brew install google-cloud-sdk


# helm w/o brew
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm


gcloud components install kubectl # OR brew install kubectl

# ruby environment
## rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# already in chezmoi? echo 'eval "$(~/.rbenv/bin/rbenv init - zsh)"' >> ~/.zshrc

## ruby-build
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# roll out config files
chezmoi init --apply https://github.com/salzamt/chezmoi

git config --global core.excludesfile ~/Documents/gitignore

# install font
sudo add-apt-repository ppa:fontforge/fontforge
sudo apt install fonts-fantasque-sans

# op for opswd in zsh 1pass
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update && sudo apt install 1password-cli


# TODO convert to fedora
# for vim (telescope plugin
RIPGREP_VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name": "\K[0-9.]+')
curl -Lo ripgrep.deb "https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep_${RIPGREP_VERSION}_amd64.deb"
sudo apt install -y ./ripgrep.deb
rg --version
rm -rf ripgrep.deb

# ranger
sudo apt remove ranger; sudo -H pip3 install ranger-fm ueberzug
cd workspace
g clone git@github.com:mwh/dragon.git
cd dragon
sudo apt-get install libgtk-3-dev
make
make install

# install age on ubuntu
# 10026  AGE_VERSION=$(curl -s "https://api.github.com/repos/FiloSottile/age/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
cd Downloads
curl -Lo age.tar.gz "https://github.com/FiloSottile/age/releases/latest/download/age-v${AGE_VERSION}-linux-amd64.tar.gz"

# google auth login
gcloud auth application-default login

# sops client for authenticatoin
cd Downloads
wget https://github.com/getsops/sops/releases/download/v3.7.3/sops_3.7.3_amd64.deb
sudo dpkg -i sops_3.7.3_amd64.deb

#k9s
cd Downloads
wget "https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz"
tar xzf k9s_Linux_amd64.tar.gz
mv k9s /home/riccardo/.local/bin/


# digikam
flatpak install flathub org.kde.digikam

# speedtest
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash && sudo apt-get install speedtest
