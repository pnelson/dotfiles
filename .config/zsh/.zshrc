# initialize zprezto
if [[ -s "$ZDOTDIR/.zprezto/init.zsh" ]]; then
  source "$ZDOTDIR/.zprezto/init.zsh"
fi

# prezto overrides
if zstyle -t ':prezto:environment:grep' color; then
  export GREP_COLOR='00;31'
fi

if zstyle -t ':prezto:environment:termcap' color; then
  export LESS_TERMCAP_so=$'\E[01;30;33m'
fi

# base16
BASE16_SHELL="$HOME/.local/share/base16-shell/base16-solarized.light.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# custom resources
source "$ZDOTDIR/resources/alias.zsh"
source "$ZDOTDIR/resources/functions.zsh"

# shell hooks
eval "$(direnv hook zsh)"
