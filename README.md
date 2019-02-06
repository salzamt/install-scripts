# Tooling
## window manager
i3 with i3blocks and i3-flashback / i3-gnome + gnome-tweak-tool for optimizations on theme and 4k saling with subpixels

### setup i3exit (from this repo) for hotkey mod+ctrl+w
`sudo cp i3exit.sh /usr/local/sbin/i3exit`
`sudo chmod +x  /usr/local/sbin/i3exit`

#### automatically moving windows to fixed workspaces
use `xwininfo` to get the window class and assign in i3 config f.e. `assign [class="Signal"] $w9`

## backups 
timeshift

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

## audio editor
audacity

## video editor
shotcut

## siple image editor 
pinta

## photo editor
Darktable and Shotwell, gpicka for color picking

## screenshot helper
gnome-screenshot

## browser
firefox w/ tridactyl

### more direct scrolling
`abount:config`
`general.smoothScroll` -> false

### high DPI screens
`abount:config`
`layout.css.devPixelsPerPx` -> 1.75 so the interface has a better size

## search engine 
ecosia & duckduckgo

## media player 
vlc

## stystem info
hardinfo

## wallpaper for i3
feh (apt-get install feh) and configure it in i3 conf

## screen arrangement
xrandr (cli) & arandr (gui)

## cloud storage and sync manager
megasync

## shell
zsh with oh-my-zsh

## terminal
gnome-terminal with tmux and tmuxinator

## Development
pycharm-professional, vim, docker-ce, docker-compose

## password, identities and certificate manager
1Passowrd for Firefox and as native client (https://support.1password.com/command-line-getting-started/)

## email
thunderbird

## messaging
Signal Native, Chatgrape, whatsapp (whatsdesk)

## HTTP Client
Insomnia

## display ordering
xrandr (cli) and arandr (gui)

## benchmark for finding a working nvidia driver...
glmark2

## hardware info summary
hardinfo

## games
steam and 0AD (strategy game)
### 0ad config for high dpi screens
orig values:
https://trac.wildfiregames.com/browser/ps/trunk/binaries/data/config/default.cfg
overwrite 
`gui.scale = 2.0` in `~.config/0ad/config/user.cfg`



## volume format support
hfs, exfat

### mounting hfs volumes
`sudo mount -t hfsplus -o force,rw /dev/sdXY /media/mntpoint`
or
`sudo mount -t hfsplus -o remount,force,rw /mount/point`
### repair corrupted hfs partitions
`sudo fsck.hfsplus -f /dev/sdXY`


# Config hints

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
