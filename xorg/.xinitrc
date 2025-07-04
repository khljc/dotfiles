#!/bin/sh


export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# keyb layout
#setxkbmap -layout us &

# fcitx5
#fcitx5 &

# monitors
#xrandr --output LVDS-1 --auto --right-of DP-1

# compositor
#picom --config /home/k/.config/picom.conf &

# wallpaper
#./.ranwall &

# bluelight filter
#redshift -l 3.140853:101.693207 -t 5000k:3500k &
#redshift -O 4500k &

# dunst
#dunst &

# dwmblocks
#dwmblocks &

# exec dwm
exec i3
