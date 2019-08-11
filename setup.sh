#! /bin/sh

FILES="
emacs
dircolors
gitconfig
gitignore
latexmkrc
wgetrc
zshrc
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

mkdir -p $HOME/.config
ln -s "$self/nvim" "$HOME/.config/nvim"
