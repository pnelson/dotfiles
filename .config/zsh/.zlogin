eval $(keychain --quiet --noask --eval --dir "$XDG_DATA_HOME/keychain")

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec startx
fi
