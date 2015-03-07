# ensure paths don't contain duplicates
typeset -gU cdpath fpath mailpath path

# explicitly define xdg directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"

# add custom autoload function path
fpath+=("$XDG_CONFIG_HOME/zsh")

# language
if [[ -z "$LANG" ]]; then
  export LANG="en_US.UTF-8"
fi

# temporary files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi
TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

# editors
export EDITOR=vi
export VISUAL=vi

# less input preprocessor
export LESS="-F -g -i -M -R -S -w -X -z-4"
export PAGER=less
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN="| /usr/bin/env lesspipe.sh %s 2>&-"
fi

# prepend user bin paths
export PATH="$HOME/Scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# golang root directory
export GOPATH="$HOME/.local"

# relocate dotfiles
export XAUTHORITY="${TMPDIR%/}/Xauthority"
export LESSHISTFILE="${TMPDIR%/}/lesshist"
export IRBRC="$XDG_CONFIG_HOME/irbrc"
export npm_config_userconfig="$XDG_CONFIG_HOME/npmrc"
