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
