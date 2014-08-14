#! /bin/sh

FILES="
dircolors
gitconfig
gitignore
latexmkrc
profile
vim
vimrc
wgetrc
"

self="$0"
case "$self" in
    /*) ;;
    *) self="$(pwd)/$self";;
esac
self="${self%/*}"
self="${self%/.}"
self="${self%/}"

for f in $FILES; 
do
    t="$HOME/.$f"
    s="$self/$f"
    if [ -e "$t" ] || [ -L "$t" ] ;
    then
        echo "$t already exists. skipping."
    else 
        echo "creating link $t to $s"
        ln -s "$s" "$t"
    fi
done
