
cd /media/salzstore_1/timeshift/$BACKUP/localhost/

rsync -av home/riccardo/.thunderbird/ ~/.thunderbird
rsync -av home/riccardo/.config/Pinta/ ~/.config/Pinta
rsync -av home/riccardo/.config/darktable/ ~/.config/darktable
rsync -av home/riccardo/.config/Insomnia/ ~/.config/Insomnia


# gnome terminal 
## backup
dconf dump /org/gnome/terminal/ > gnome_terminal_settings_backup.txt

## restore 
dconf reset -f /org/gnome/terminal/
dconf load /org/gnome/terminal/ < gnome_terminal_settings_backup.txt
