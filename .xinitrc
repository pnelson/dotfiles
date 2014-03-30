#!/bin/sh

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtkrc-2.0"

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

export BSPWM_SOCKET="${TMPDIR%/}/bspwm-socket"
export PANEL_FIFO="${TMPDIR%/}/panel-fifo"
export RXVT_SOCKET="${TMPDIR%/}/urxvt-socket"

xrdb $XDG_CONFIG_HOME/xorg/resources

xset b off          # disable bell
xset r rate 200 30  # set keyboard autorepeat delay and rate
xset m 1/1 9999     # set mouse acceleration and threshold

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
fcitx -d
sxhkd &

exec dbus-launch bspwm
