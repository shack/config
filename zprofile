
# login shell, before zshrc
include () {
    [[ -f "$1" ]] && source "$1"
}

# source in os-specific config file
include "$HOME/.zprofile.os"
include "$HOME/.zprofile.local"

# Browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Editors
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $HOME/bin
  $path
)

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-G -F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
    export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

[ ! -z "${LS_OPTIONS}" ] && alias ls="ls $LS_OPTIONS"

fpath=(/usr/local/share/zsh-completions $fpath)

if [ ! 'config/github_api' ];
then
    source config/github_api
fi

export PASSWORD_STORE_GENERATED_LENGTH=32
export PASSWORD_STORE_CHARACTER_SET="a-zA-Z0-9"

export ACK_PAGER_COLOR="less -r"

# todo.sh alias
# alias t="todo.py"
# alias n="todo.py -c ~/.notes.ini"
# alias td="todo.py -c ~/tmp/todo/test.ini"
alias t="vi ~/Desktop/todo/todo.txt"
alias pwd_ssh="ssh -o PubkeyAuthentication=no"

# Rust
export PATH="${HOME}/.cargo/bin:${HOME}/bin:$PATH"

# opam configuration
[[ ! -r /Users/hack/.opam/opam-init/init.zsh ]] || source /Users/hack/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Python configuration through pyenv
eval "$(pyenv init --path)"
