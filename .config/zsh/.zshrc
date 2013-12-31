# initialize zprezto
if [[ -s "$ZDOTDIR/.zprezto/init.zsh" ]]; then
  source "$ZDOTDIR/.zprezto/init.zsh"
fi

# prezto overrides
if zstyle -t ':prezto:environment:termcap' color; then
  export LESS_TERMCAP_so=$'\E[01;30;33m'
fi

# custom resources
source "$ZDOTDIR/resources/alias.zsh"
source "$ZDOTDIR/resources/functions.zsh"

# shell hooks
eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
