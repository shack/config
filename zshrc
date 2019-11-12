[ ! -e "$HOME/.zshrc.local" ] || source "$HOME/.zshrc.local"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx)

# source in os-specific config file
source "$HOME/.zshrc.os"

# if we have oh my zsh, use it, else get some decent prompt
ZSH=${ZSH:="$HOME/.oh-my-zsh"}
if [ -e "$ZSH" ];
then
    source "$ZSH/oh-my-zsh.sh"
else
    PROMPT='%F{magenta}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f $ '
fi

export MANPATH="/usr/local/man:$MANPATH"
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export PATH="/usr/local/opt/ruby/bin:${HOME}/bin:/usr/local/bin:/usr/local/sbin:$PATH"

LS_OPTIONS=""

# alias ls="ls $LS_OPTIONS -hF"
# alias ll="ls $LS_OPTIONS -lhF"
# alias l="ls $LS_OPTIONS -lAhF"

# don't share history among terminals
setopt no_share_history

fpath=(/usr/local/share/zsh-completions $fpath)

export PASSWORD_STORE_GENERATED_LENGTH=24
export PASSWORD_STORE_CHARACTER_SET="a-zA-Z0-9"

export ACK_PAGER_COLOR="less -r"

# source /Users/hack/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# OPAM configuration
. /Users/hack/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
