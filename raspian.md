switch to 3.5mm
`amixer cset numid=3 1`

switch to hdmi audio
`amixer cset numid=3 2`

install drm (netflix spotify)
https://thepi.io/how-to-watch-netflix-on-the-raspberry-pi/

```
sudo su
cd /usr/lib/chromium-browser
wget http://blog.vpetkov.net/wp-content/uploads/2019/09/libwidevinecdm.so_.zip
unzip libwidevinecdm.so_.zip && chmod 755 libwidevinecdm.so
```


mopidy maybe?
most important stuff
```
sudo  apt-get install curl i3 i3blocks redshift-gtk gtk-recordmydesktop blueman openvpn feh zsh tmux vim vifm timeshift pinta git hardinfo
```



# CUPS with samsung ml25-25
```
sudo apt-get install cups
sudo systemctl start cups
sudo systemctl enable cups
sudo vim /etc/cups/cupsd.conf
sudo systemctl restart cups
sudo usermod -a -G lpadmin osmc
sudo apt install foomatic-db printer-driver-splix
sudo systemctl restart cups
```
