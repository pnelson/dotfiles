# ensure paths don't contain duplicates
typeset -gU cdpath fpath mailpath path

# core
export LANG="en_US.UTF-8"
export TMPDIR="$HOME/tmp"

# editors
export EDITOR=vi
export VISUAL=vi

# less input preprocessor
export LESS="-F -g -i -M -R -S -w -X -z-4"
export LESSOPEN="| lesspipe %s 2>&-"
export PAGER=less

# prepend user bin paths
export PATH="$HOME/usr/bin:$HOME/bin:$PATH"

# explicitly define xdg directories
export XDG_CACHE_HOME="$TMPDIR"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"

# identity
export GPGKEY="71ED0A1F"

# location
export LATITUDE="49.3"
export LONGITUDE="-123.1"

# source code
export CODE="$HOME/src/pnelson.ca"
export GITHUB="$HOME/src/github.com/pnelson"
export BITBUCKET="$HOME/src/bitbucket.org/pnelson"
export DOTFILES="$GITHUB/dotfiles"

# golang root directory
export GOPATH="$HOME"

# relocate config
export ACKRC="$XDG_CONFIG_HOME/ackrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/settings"
export IRBRC="$XDG_CONFIG_HOME/irbrc"
export npm_config_userconfig="$XDG_CONFIG_HOME/npmrc"

# relocate temporary data (cache)
export LESSHISTFILE="$XDG_CACHE_HOME/lesshist"
export XAUTHORITY="$XDG_CACHE_HOME/Xauthority"

# relocate sockets
export BSPWM_SOCKET="$XDG_RUNTIME_DIR/bspwm"
export PANEL_FIFO="$XDG_RUNTIME_DIR/panel"
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvt"

# add custom autoload function path
fpath+=("$XDG_CONFIG_HOME/zsh")
