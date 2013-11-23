#!/bin/sh

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtkrc-2.0"

export BSPWM_SOCKET="/tmp/bspwm-socket"
export PANEL_FIFO="/tmp/panel-fifo"
export RXVT_SOCKET="/tmp/urxvt-socket"

xrdb $XDG_CONFIG_HOME/xorg/resources

xset b off          # disable bell
xset r rate 200 30  # set keyboard autorepeat delay and rate

xset +fp $XDG_DATA_HOME/fonts
xset +fp $XDG_DATA_HOME/fonts/artwiz
xset fp rehash

xsetroot -solid '#1a1a1a'
xsetroot -cursor_name left_ptr

hsetroot -fill $XDG_CONFIG_HOME/wallpaper &
compton -b
unclutter -grab -noevents -root -idle 3 &
redshift &
urxvtd --quiet --opendisplay --fork
sxhkd &

exec dbus-launch bspwm
