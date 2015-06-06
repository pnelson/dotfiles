# initialize zprezto
if [[ -s "$ZDOTDIR/.zprezto/init.zsh" ]]; then
  source "$ZDOTDIR/.zprezto/init.zsh"
fi

# prezto overrides
if zstyle -t ':prezto:environment:grep' color; then
  export GREP_COLOR="00;33"             # BSD
  export GREP_COLORS="mt=$GREP_COLOR"   # GNU
fi

if zstyle -t ':prezto:environment:termcap' color; then
  export LESS_TERMCAP_so=$'\E[01;30;33m'
fi

# base16
source "$XDG_DATA_HOME/base16-shell/base16-solarized.light.sh"

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# aliases
alias cal='cal -A 2'
alias calc='noglob wcalc --quiet'
alias cls='clear'
alias dots='git --git-dir="$DOTFILES"'
alias ls='LC_COLLATE="C" ls --color=auto --group-directories-first --human-readable'
alias lsblk='lsblk -o NAME,MOUNTPOINT,FSTYPE,TYPE,SIZE'
alias lsgroup='cut --delimiter=: --fields=1 /etc/group'
alias md='mkdcd'
alias now='date --utc +%Y%m%dT%H%M%SZ'
alias tolower='tr "[:upper:]" "[:lower:]"'
alias toupper='tr "[:lower:]" "[:upper:]"'
alias tree='tree --dirsfirst'
alias weechat='weechat --dir "$XDG_CONFIG_HOME/weechat"'

# convert fahrenheit to celsius
function todegc() {
  echo "scale=2; (5/9)*($1-32)" | bc | sed 's/\..*$//'
}

# convert celsius to fahrenheit
function todegf() {
  echo "scale=2; ((9/5)*$1)+32" | bc | sed 's/\..*$//'
}

# shortcut for find in current directory
function ff() {
  find . -name $1
}

# estimate file space usage for each dir in current directory
function lsdir() {
  for dir in *; do
    if [ -d $dir ]; then
      du --human-readable --summarize --dereference $dir 2> /dev/null
    fi
  done
}

# reset permissions of all files and directories in the current directory
function reset_permissions() {
  find . -type d -exec chmod 755 {} +
  find . -type f -exec chmod 644 {} +
}

# play youtube video by vid
function youtube() {
  mpv "https://www.youtube.com/watch?v=$1"
}

# shell hooks
eval "$(direnv hook zsh)"
