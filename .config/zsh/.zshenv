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

# explicitly define xdg directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"

# xorg authority dotfile
export XAUTHORITY="${TMPDIR%/}/Xauthority"

# less history dotfile
export LESSHISTFILE="${TMPDIR%/}/lesshist"

# irb dotfiles
export IRBRC="$XDG_CONFIG_HOME/irbrc"

# ensure paths don't contain duplicates
typeset -gU cdpath fpath mailpath path

# add custom autoload function path
fpath+=("$XDG_CONFIG_HOME/zsh")

# append every bin path for Applications
for bin in $HOME/Applications/*/bin(N); do
  export PATH="$PATH:$bin"
done

# append every bin path for Scripts
export PATH=$PATH:$HOME/Scripts
for bin in $HOME/Scripts/*/bin(N); do
  export PATH="$PATH:$bin"
done

# prepend local bin path
export PATH="$HOME/.local/bin:$PATH"

# golang root directory
export GOROOT="${$(which go)%/*/*}"

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npmrc"

# rbenv
export RBENV_ROOT="${$(which rbenv)%/*/*}"
export RBENV_VERSION="2.0.0-p247"
