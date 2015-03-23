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
