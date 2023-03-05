# speed up DNF
sudo echo 'max_parallel_downloads=10' >> /etc/dnf/dnf.conf
sudo echo 'fastestmirror=True' >> /etc/dnf/dnf.conf

# upgrade all packages from the current release
sudo dnf check-update
sudo dnf up

# install basic stuff
sudo dnf -y install \
    vips \ # more modern imagemagick
    alacritty \ # GPU accelerated terminal
    blueman \ # GTK+ Bluetooth Manager
    ca-certificates \ # mozilla CA root cert bundle
    dnf-plugins-core \ # for installing docker then
    curl \
    gnupg2 \ # utility for secure communication and data storage
    dnf-plugin-system-upgrade \ # upgrade-system-upgrade
    feh \ # command line image viewer and desktop background setter
    figlet \ # making large letters out of ordinary text
    flatpak \ 
    fzf \ # cli fuzzy finder
    git \ 
    hstr \ # shell history search
    htop \ 
    i-nex \ # hardinfo for fedora
    megatools \ # cli client for MEGA sync
    playerctl \ # cli controller for MPRIS compatible media players
    iftop \ # cli tool that displays bandwidth usage on an interface
    mtr \ # network diagnostic tool combining traceroute and ping
    mtr-gtk \ # GTK interforace for MTR
    ncdo \ # disc utilization manager
    neovim \ # configured as ide
    nmap \ # network exploration 
    openvpn \ 
    pwgen \ # password generator 
    python3-pip \ # python is just needed..what else to sway.
    ranger \
    polkit-gnome \ # PolicyKit integration for the GNOME desktop for sudo pw prompts
    rsync \
    dunst \ # notifications
    radeontop \ # radeon video card monitoring
    snapd \ 
    sway \ # i3 like compositor and WM for wayland
    tcpdump \ # traffic monitoring
    timeshift \ # backup tool compatible with btrfs and ext4 snapshotting
    telnet \
    tmux \ 
    unzip \ 
    docker-comose \ 
    tldr \ # man page excerpt
    vim \ # as editor for big files, basic settings kept
    wget \
    whois \ # improved whois client
    zip \ 
    qlandkartegt \ # GPS device mapping tool
    gpsbabel \ # convert between various formats used by GPS devices
    solaar \ # device manager for a wide range of Logitech devices
    lm_sensors \ # hardware monitoring for temp
    hddtemp \ # hardware monitoring for temp
    powertop \ # power consumption monitor
    zsh \ 
    \ # check if if xserver!
    deepin-screenshot \ # screenshot tool 
    ImageMagick \ # image manipulation (WARNING: X server)
    scrot \ # cli screen recorder
    gtk-recordmydesktop \ # GUI screen recorder
    redshift \ # red filter after sunset 
    gpick \ # color picker



flatpak install \
    com.github.eneshecan.WhatsAppForLinux \ 
    com.valvesoftware.Steam \
    flathub com.prusa3d.PrusaSlicer \
    flathub com.spotify.Client \
    flathub com.valvesoftware.Steam \
    flathub org.gnome.Shotwell \ # photo organizer 
    flathub org.gnome.gThumb \ # image viewer, editor, organizer
    nz.mega.MEGAsync \ 
    org.audacityteam.Audacity \ 
    org.blender.Blender \
    org.darktable.Darktable \
    org.freecadweb.FreeCAD \
    org.gimp.GIMP \
    org.kde.kdenlive \
    org.mozilla.Thunderbird \
    org.signal.Signal \
    org.videolan.VLC \
    org.viking.Viking \ 
    org.wireshark.Wireshark \
    flathub com.slack.Slack

# sentoup temp sensors
sudo sensors-detect && sensors

# docker 
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $(whoami)

# chezmoi
asdf plugin add chezmoi && asdf install chezmoi 2.31.1
chezmoi init --apply https://github.com/salzamt/chezmoi

# link tmux config
ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf

# google cloud stuff
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

sudo dnf install google-cloud-cli
gcloud components install kubectl 
gcloud init

# TODO
nm-tray: networkmanager tray
i3-swap-focus: i3 swap back-forth with tab
pulseaudio-pipewire stuff like pavcontrol and the equalizer.
screen recording
screenshots
redshift
rofi, especially focus window from search
pet: snippet manager
checkin redshift config to chezmoi
texlive? any latex editor? maybe vim...?
chezmoi!
jpegdupes
one password cli 
idisable power button shutdown action - set to ignore.
k9s
linuxbrew
google cloud via linuxbrew maybe? 
