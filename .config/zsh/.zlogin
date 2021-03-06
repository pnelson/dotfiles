# execute code that does not affect the current session in the background
{
  # compile the completion dump to increase startup speed
  zcompdump="$ZDOTDIR/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "$zcompdump.zwc" || "$zcompdump" -nt "$zcompdump.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!
