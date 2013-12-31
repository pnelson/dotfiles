# execute code that does not affect the current session in the background
{
  # compile the completion dump to increase startup speed
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

eval $(keychain --quiet --noask --eval --dir "$XDG_DATA_HOME/keychain")

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec startx
fi
