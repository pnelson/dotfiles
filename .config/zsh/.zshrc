# initialize zprezto
if [[ -s "$ZDOTDIR/.zprezto/init.zsh" ]]; then
  source "$ZDOTDIR/.zprezto/init.zsh"
fi

# custom resources
source "$ZDOTDIR/resources/alias.zsh"
source "$ZDOTDIR/resources/functions.zsh"

# shell hooks
eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
