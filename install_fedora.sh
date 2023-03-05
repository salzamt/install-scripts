# speed up DNF
sudo echo 'max_parallel_downloads=10' >> /etc/dnf/dnf.conf
sudo echo 'fastestmirror=True' >> /etc/dnf/dnf.conf


# upgrade all packages from the current release
sudo dnf check-update
sudo dnf up

# install basic stuff
sudo dnf install \
    curl \
    wget \
    telnet \
    tcpdump \ # traffic monitoring
    nmap \ # network exploration 
    pwgen \ # password generator 
    git \ 
    zip \ 
    unzip \ 
    htop \ 
    iftop \ # cli tool that displays bandwidth usage on an interface
    whois \ # improved whois client
    ranger \
    mtr \ # network diagnostic tool combining traceroute and ping
    mtr-gtk \ # GTK interforace for MTR
    ca-certificates \ # mozilla CA root cert bundle

    rsync \
    fzf \ # cli fuzzy finder
    hstr \ # shell history search
    sway \ # i3 like compositor and WM for wayland
    alacritty \ # GPU accelerated terminal
    feh \ # command line image viewer and desktop background setter
    zsh \ 
    tmux \ 
    vim \ # as editor for big files, basic settings kept
    neovim \ # configured as ide
    i-nex \ # hardinfo for fedora
    python3-pip \ # python is just needed..what else to sway.
    snapd \ 
    dnf-plugin-system-upgrade # upgrade-system-upgrade




# TODO
nm-tray: networkmanager tray
i3-swap-focus: i3 swap back-forth with tab
pulseaudio-pipewire stuff like pavcontrol and the equalizer.
screen recording
screenshots
redshift
rofi, especially focus window from search

