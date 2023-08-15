# Tooling

## window manager
i3 with i3blocks / redshift
rofi, https://github.com/davatorium/rofi
i3blocks from https://github.com/vivien/i3blocks-contrib and https://github.com/Anachron/i3blocks

### setup i3exit (from this repo) for hotkey mod+ctrl+w
`sudo cp i3exit.sh /usr/local/sbin/i3exit`
`sudo chmod +x  /usr/local/sbin/i3exit`

#### automatically moving windows to fixed workspaces
use `xwininfo` to get the window class and assign in i3 config f.e. `assign [class="Signal"] $w9`. for spotify its a bit more complex as it does not set the window class properly. workaround: `for_window [class="Spotify"] move to workspace $w0`

## notifications
if you are not happy with the gnome notification system (test if it works fine for you regarding font size and multi display with `notify-send --icon=gtk-info Test "This is a test"`, dunst (https://dunst-project.org/) is a great alternative. docs tbd

## markdown
ghostwriter

## backups 
timeshift

## webcam settings
qv4l2 

## VPN
nordvpn with CyberSec and Killswitch
getting started, login with
`nordvpn settings`
then set the comfy full protecthion like this
`nordvpn set killswitch enabled`
`nordvpn set cybersec enabled`
`nordvpn set autoconnect enabled`
`nordvpn connect`

## audio player
spotify
### high dpi scaling
use `spotify --force-device-scale-factor=1.5` - already configured in the spotify shortcut in i3

## partition stuff
gparted gpart

## file manager
vifm

## audio editor
audacity for edigint
pavucontrol mixing in/outputs and applications

## video editor
OBS for recording, KDEnlive for editin, 
pitivi, shotcut, openshot, blender and flowblade
https://jliljebl.github.io/flowblade/download.html

## siple image editor 
pinta

## photo editor
gopro import: Shotwell
phto organizer: gthumb (newer digiKam)
drawing: krita
image manipulation: inkscape gimp darktable
color picking: gpicka

## screenshot & recording
deepin-screenshot # screen shot, simple and fast
kazam # screen recording
obs-studio # Open Broadcaster Software Studio

## browser
firefox w/ tridactyl

### more direct scrolling
`about:config`
`general.smoothScroll` -> false

browser.fullscreen.autohide -> false

### high DPI screens
`about:config`
`layout.css.devPixelsPerPx` -> 1.75 so the interface has a better size

### disable annoying tab detach with mouse
`about:config`
`browser.tabs.allowTabDetach` -> false

## media player 
vlc

## stystem info
hardinfo

## wallpaper for i3
feh (apt-get install feh) and configure it in i3 conf

## screen arrangement
xrandr / arandr 

## cloud storage and sync manager
megasync

## shell
zsh with oh-my-zsh

# terminal
alacritty

## Development
neovim

## password, identities and certificate manager
1Passowrd for Firefox and as native client (https://support.1password.com/command-line-getting-started/)

## email
thunderbird

## messaging
Signal, whatsapp (whatsdesk)

## HTTP Client
Insomnia

## display ordering
xrandr (cli) and arandr (gui)

## media player key bindings
playerctl (https://github.com/acrisci/playerctl/releases)

## volume/brightnes key bindings
pactl (installed in ubuntu but configure sink!)

## gdk and QT scaling for high DPI screens
add to `~/.profile`
```
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
```

add to `~/.Xresources`
```
Xft.dpi: 192
URxvt.font: xft:FiraMono-Regular:size=10
Xft.autohint: 0
Xft.lcdfilter:  lcddefault
Xft.hintstyle:  hintfull
Xft.hinting: 1
Xft.antialias: 1
Xft.rgba: rgb
```

# file manager
ranger-fm (vim based terminal driven file manager)

# Making things work with MacBook Pro 15 Retian 2012
## broadcom wifi drivers
tbd

## braodcom sd card config
we need to reduce the speed of the sd card so that it actually works. therefore:

```
sudo sh -c 'echo options sdhci debug_quirks=0x40 debug_quirks2=0x4 >> /etc/modprobe.d/sdhci-pci.conf' && sudo modprobe -r sdhci-pci sdhci && sudo modprobe sdhci-pci
```

The option 0x4 decreases speed from ultra high speed to high speed, but it is better that not operable card.


# specialties for macbook pro retina
```
sudo dmidecode -s system-product-name
MacBookPro10,1
```
in case the screen does not work or the right resolution is not detected in arandr, add the mode:
`gtf 2880 1800 30`
`xrandr --newmode "2880x1800_30.00"  210.05  2880 3048 3352 3824  1800 1801 1804 1831  -HSync +Vsync`
`xrandr --addmode eDP-1 "2880x1800_30.00"`

# text editing
texlive
geany

# power management
powertop

# gps / routing
viking, gpsbabel & gpsbabel-gui

use blueman-applet (from package blueman) to do bluetooth stuff
more under http://iafonov.github.io/blog/ubuntu-macbook-pro-2015-notes.html


## networking
nm-connection-editor
nm-applet

# mesure package loss
mtr mtr-tiny

# rest of the suite:
nextcloud
turtl notes app https://turtlapp.com/


# dotfiles management
chezmoi
https://www.chezmoi.io/docs/quick-start/

# logitech receivers
https://github.com/pwr-Solaar/Solaar

# gaming
playonlinux
steam

# terminal json processor
jq as in 
`curl .... | jq`

# CAD / 3d printing
freecad / librecad
Prusa Slicer
octoprint
