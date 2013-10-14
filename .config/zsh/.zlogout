# invalidate existing sudo credentials
if [ -x /usr/bin/sudo ]; then
  /usr/bin/sudo -k
fi

# clear screen for increased privacy
if [ "$SHLVL" -eq 1 ]; then
  if [ -x /usr/bin/clear_console ]; then
    /usr/bin/clear_console -q
  fi
fi
