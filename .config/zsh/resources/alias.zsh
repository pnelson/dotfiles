alias dots='git -C "$HOME" --git-dir="$HOME/Development/dotfiles" --work-tree="$HOME"'

alias cl='clear'
alias ls='LC_COLLATE="C" ls --color=auto --group-directories-first --human-readable'
alias md='mkdcd'

alias lsgroup='cut --delimiter=: --fields=1 /etc/group'
alias now='date --utc +%Y%m%dT%H%M%SZ'

alias cal='cal -A 2'
alias tree='tree --dirsfirst'
alias wcalc='wcalc --quiet'
alias weechat='weechat --dir "$XDG_CONFIG_HOME/weechat"'
