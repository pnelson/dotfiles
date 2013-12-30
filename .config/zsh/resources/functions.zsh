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

# create a new directory and change into it
function md() {
  mkdir -p $@ && cd $@
}

# reset permissions of all files and directories in the current directory
function reset_permissions() {
  find . -type d -exec chmod 755 {} +
  find . -type f -exec chmod 644 {} +
}

# show user owned processes
function psu {
  ps -U "${1:-$USER}" -o 'pid,%cpu,%mem,command' "${(@)argv[2,-1]}"
}
