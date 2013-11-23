# common environment settings
export EDITOR=vi
export PAGER=less

# color manpages
export LESS_TERMCAP_mb=$'\E[01;31m'    # start blinking
export LESS_TERMCAP_md=$'\E[01;31m'    # start bold mode
export LESS_TERMCAP_me=$'\E[0m'        # end mode (mb, md, so, us)
export LESS_TERMCAP_se=$'\E[0m'        # end standout mode
export LESS_TERMCAP_so=$'\E[01;30;33m' # start standout mode
export LESS_TERMCAP_ue=$'\E[0m'        # end underlining
export LESS_TERMCAP_us=$'\E[01;32m'    # start underlining

# explicitly define xdg directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"

# xorg authority dotfile
export XAUTHORITY="/tmp/Xauthority"

# less history dotfile
export LESSHISTFILE="/tmp/lesshist"

# irb dotfiles
export IRBRC="$XDG_CONFIG_HOME/irbrc"

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
