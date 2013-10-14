function current_repo() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(basename `git rev-parse --show-toplevel`)
}

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function dirty_file_count() {
  echo $(git status --porcelain 2> /dev/null | wc --lines)
}

function __right_prompt() {
  if [ -z `current_repo` ]; then
    echo "%F{blue}%~"
  else
    if [ `dirty_file_count` -eq "0" ]; then
      echo "%F{yellow}$(current_repo)%F{black}:%f$(current_branch)"
    else
      echo "%F{yellow}$(current_repo)%F{black}:%F{red}$(current_branch)"
    fi
  fi
}

setopt PROMPT_SUBST
setopt PROMPT_PERCENT

export PROMPT='%(!.%F{red}.%F{black})>>%f '
export RPROMPT='$(__right_prompt)'
