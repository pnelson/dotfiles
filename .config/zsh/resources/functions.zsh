# shortcut for find in current directory
function ff() {
  find . -name $1
}

# change into project specific go dir
function cdgodir() {
  cd $(find "$1/src/" -type d -name "$1")
}

# estimate file space usage for each dir in current directory
function lsdir() {
  for dir in *; do
    if [ -d $dir ]; then
      du --human-readable --summarize --dereference $dir 2> /dev/null
    fi
  done
}

# make a project specific go dir
function mkgodir() {
  mkdir -p "$1/src/github.com/$USER/$1"
  echo "export GOPATH=\"\$PWD\"\nexport PATH=\"\$GOPATH/bin:\$PATH\"" > "$1/.envrc"
  cd "$1/src/github.com/$USER/$1"
}

# reset permissions of all files and directories in the current directory
function reset_permissions() {
  find . -type d -exec chmod 755 {} +
  find . -type f -exec chmod 644 {} +
}
