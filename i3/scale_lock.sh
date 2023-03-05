#!/bin/sh -e
# to .local/bin/scale_lock.sh
# exec perm chmod +x ~/.local/bin/scale_lock.sh

resolution=$(xrandr | grep "*" | awk '{ print $1 }')
target_file=~/Pictures/lockscreen_$resolution.png 
source_file=~/Pictures/lockscreen.png 

if [ ! -f $target_file ]
then
    convert $source_file -scale $resolution^ $target_file
fi

# Lock screen displaying this image.
i3lock -i $target_file
