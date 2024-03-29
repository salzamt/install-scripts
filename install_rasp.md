sudo apt update
# select fastest package mirror before we start installing all that stuff
sudo apt install netselect-apt && sudo netselect-apt && sudo apt update
sudo apt upgrade

#luks encryption
sudo apt install libblockdev-crypto2 
sudo systemctl restart udisks2.service


# nfs
sudo apt install nfs-kernel-server
sudo chown -R osmc:osmc /media/salzstore

# nextcloud setup
snap install nextcloud
sudo snap connect nextcloud:removable-media
sudo snap set nextcloud php.memory-limit=512M

curl -sSL https://raw.githubusercontent.com/nextcloud/nextcloudpi/master/install.sh | sudo bash


# spotify
https://github.com/dtcooper/raspotify
with config change user/pass to be availabe via www


# megasync cli for ARM
```
wget -qO - https://mega.nz/linux/MEGAsync/Raspbian_10.0/Release.key | sudo apt-key add -
sudo vim /etc/apt/sources.list.d/MEGA.nz.list
```
```
# Mega.nz repo for 32bit (compatable with 64-bit) Raspberry Pi
deb [arch=armhf] https://mega.nz/linux/MEGAsync/Raspbian_10.0/ ./
```

```
sudo apt update && sudo apt install megacmd
mega-cmd
```


# octoprint
mkdir OctoPrint
cd OctoPrint
python3 -m venv venv
source venv/bin/activate
pip install pip --upgrade
pip install --no-cache-dir  octoprint
pip install "https://github.com/SimplyPrint/OctoPrint-Creality2xTemperatureReportingFix/archive/master.zip"
pip install "https://github.com/jneilliii/OctoPrint-BedLevelingWizard/archive/master.zip"
systemctl start octoprint (unnit file from here https://community.octoprint.org/t/setting-up-octoprint-on-a-raspberry-pi-running-raspberry-pi-os-debian/2337)
