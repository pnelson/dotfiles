#!/bin/sh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

xrdb "$XDG_CONFIG_HOME/x11/Xresources"

xset dpms 180 360 480

xset s noblank      # disable video blank
xset s off          # disable screen saver

xset b off          # disable bell
xset r rate 180 45  # set keyboard autorepeat delay and rate
xset m 1/1 9999     # set mouse acceleration and threshold

xset +fp $XDG_DATA_HOME/fonts
xset +fp $XDG_DATA_HOME/fonts/artwiz
xset +fp $XDG_DATA_HOME/fonts/tamzen
xset fp rehash

xsetroot -solid '#1a1a1a'
xsetroot -cursor_name left_ptr

hsetroot -fill $XDG_CONFIG_HOME/wallpaper &
unclutter -noevents -root -idle 3 &
redshift -l $LATITUDE:$LONGITUDE &
urxvtd --quiet --opendisplay --fork
fcitx -d
sxhkd &

exec dbus-launch bspwm
