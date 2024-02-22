# speed up DNF
sudo echo 'max_parallel_downloads=10' >> /etc/dnf/dnf.conf
sudo echo 'fastestmirror=True' >> /etc/dnf/dnf.conf

sudo dnf copr enable -y kallepm/tuxedo-keyboard
sudo dnf copr enable -y kallepm/tuxedo-control-center

# upgrade all packages from the current release
sudo dnf check-update
sudo dnf up

# install basic stuff
sudo dnf -y install vips alacritty blueman ca-certificates dnf-plugins-core curl gnupg2 dnf-plugin-system-upgrade feh figlet flatpak fzf git hstr htop i-nex megatools playerctl iftop mtr mtr-gtk ncdu neovim nmap openvpn pwgen python3-pip ranger polkit-gnome rsync dunst radeontop snapd sway tcpdump timeshift telnet tmux unzip docker-compose tldr vim wget whois zip gpsbabel solaar lm_sensors hddtemp powertop zsh tuxedo-keyboard tuxedo-control-center the_silver_searcher i3status i3blocks rofi i3 deepin-screenshot ImageMagick scrot redshift gpick sysstat acpi

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install com.github.eneshecan.WhatsAppForLinux com.valvesoftware.Steam com.prusa3d.PrusaSlicer com.spotify.Client com.valvesoftware.Steam org.gnome.Shotwell org.gnome.gThumb nz.mega.MEGAsync org.audacityteam.Audacity org.blender.Blender org.darktable.Darktable org.gimp.GIMP org.kde.kdenlive org.mozilla.Thunderbird org.signal.Signal org.videolan.VLC org.viking.Viking org.wireshark.Wireshark com.slack.Slack com.obsproject.Studio io.github.seadve.Kooha

flatpak install flathub org.freecadweb.FreeCAD
flatpak install flathub org.openscad.OpenSCAD


# set theme
flatpak install org.gtk.Gtk3theme.Adwaita-dark
sudo flatpak override --filesystem=/usr/share/themes/
sudo flatpak override --env GTK_THEME=Adwaita-dark

# ability to install classic snaps
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install chezmoi --classic

# select proper rofi theme
launch: rofi
launch: rofi-theme-selector # select gruvbox-dark

# install i3blocks-contrib scripts
git clone git@github.com:vivien/i3blocks-contrib.git ~/workspace/

# proper shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# setup vim
cd ~/workspace/install-scripts
bash install_vim.sh

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
# roll out known keys for gh
rsync -avz riccardo@192.168.1.199:/home/riccardo/.ssh/ ~/.ssh
scp riccardo@192.168.1.199:/home/riccardo/age_key.txt ~/
eval `ssh-agent -s`
ssh-add ~/.ssh/id_ed25519
ssh-add ~/.ssh/google_compute_engine
ssh-add ~/.ssh/id_rsa

# get template for chezmoi
cd ~
mkdir -p workspace
git clone git@github.com:salzamt/install-scripts.git
cp install-scripts/chezmoi.toml ~/.config/chezmoi/chezmoi.toml
chezmoi init --apply git@github.com:salzamt/chezmoi.git

# link tmux config # TODO: tmux finally migrated to .config! fix it
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
checkin redshift config to 
texlive? any latex editor? maybe vim...?
chezmoi!
jpegdupes
one password cli 
idisable power button shutdown action - set to ignore.
k9s
linuxbrew
google cloud via linuxbrew maybe? 



# TODO convert to fedora
# for vim (telescope plugin
sudo apt install fd-find cargo
cargo install ripgrep


# ranger
cd workspace
g clone git@github.com:mwh/dragon.git
cd dragon
sudo apt-get install libgtk-3-dev
make
make install


# digikam
flatpak install flathub org.kde.digikam
