$ /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb keyring.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
# dpkg -i ./keyring.deb
# echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
# apt update
# apt install i3
cp config ~/.config/i3/config




Add a file /etc/systemd/system/i3lock.service with the following contents:

# source: https://bbs.archlinux.org/viewtopic.php?pid=1170536#p1170536 by 65kid
#
[Unit]
Description=i3lock
Before=sleep.target

[Service]
User=the_login_of_the_user_that_suspends
Type=forking
Environment=DISPLAY=:0
ExecStart=/usr/bin/i3lock

[Install]
WantedBy=sleep.target

# now enable it with
sudo systemctl enable i3lock.service
