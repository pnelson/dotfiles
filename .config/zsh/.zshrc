autoload -U zutil
autoload -U compinit
autoload -U complist
autoload -U colors

compinit
colors

for file in $XDG_CONFIG_HOME/zsh/resources/*.zsh; do
  source $file
done

HISTFILE="/tmp/zhistory"
HISTSIZE=SAVEHIST=1000

setopt APPEND_HISTORY HISTIGNOREALLDUPS SHARE_HISTORY

eval "$(direnv hook zsh)"
