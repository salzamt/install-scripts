sudo apt-get update && sudo apt-get upgrade && apt-get install curl

# graphics, wirelesse, bluetooth, etc....a little helper from ubuntu
sudo ubuntu-drivers autoinstall

# timeshift backup repo
sudo apt-add-repository -y ppa:teejee2008/ppa

# shotcut video editor
sudo add-apt-repository ppa:haraldhv/shotcut

# pinta image editing
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable

# ubuntu make
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make

# 0ad (game)
sudo add-apt-repository ppa:wfg/0ad

# signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# i3 stuff ( next three lines, switch to root)
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb keyring.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list

# insomnia
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" |  sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -


# installations of some fancy things.
sudo apt update
sudo apt install thunderbird i3 i3blocks openvpn htop insomnia gpick curl feh zsh tmux vim snapd timeshift shotcut pinta darktable gnome-screenshot ubuntu-make signal-desktop git arandr glmark2

# optional games
sudo apt install steam 0ad 

# whatsdesk=whatsapp linux client similar to signal client
sudo snap install spotify vlc audacity whatsdesk

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# playerctl for adding hotkeys and i3wm interaction of i3blocks with media players
cd ~/Downloads
wget https://github.com/acrisci/playerctl/releases/download/v2.0.1/playerctl-2.0.1_amd64.deb
sudo dpkg -i playerctl-2.0.1_amd64.deb

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
sudo apt install docker-ce

# pycharm
umake ide pycharm-professional
