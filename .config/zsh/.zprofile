# start X server when logging into a virtual terminal
if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec startx
fi
