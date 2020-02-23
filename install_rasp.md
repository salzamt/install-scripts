sudo apt update
# select fastest package mirror before we start installing all that stuff
sudo apt install netselect-apt && sudo netselect-apt && sudo apt update
sudo apt upgrade

#luks encryption
sudo apt install libblockdev-crypto2
sudo systemctl restart udisks2.service

# nextcloud setup
snap install nextcloud
sudo snap connect nextcloud:removable-media
sudo snap set nextcloud php.memory-limit=512M

curl -sSL https://raw.githubusercontent.com/nextcloud/nextcloudpi/master/install.sh | sudo bash
