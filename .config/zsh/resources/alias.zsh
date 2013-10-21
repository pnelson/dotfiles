alias dots="git --git-dir=$HOME/Development/dotfiles --work-tree=$HOME"

alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive'

alias cl='clear'
alias ls='LC_COLLATE="C" ls --color=auto --group-directories-first --human-readable'

alias pbcopy='xclip -i -selection clipboard'
alias pbpaste='xclip -o -selection clipboard'

alias wcalc='wcalc --quiet'
alias weechat='weechat --dir "$XDG_CONFIG_HOME/weechat"'
