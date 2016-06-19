# Path to your oh-my-zsh installation.
export ZSH=/Users/hack/.oh-my-zsh

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
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export PYTHON_BASE=`python -m site --user-base`
export EDITOR=vim
export PATH="${HOME}/.local/bin:${HOME}/bin:${PYTHON_BASE}/bin:/usr/local/bin:$PATH"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$HOME/.local/lib"
export TEXINPUTS=".:${HOME}/sb/misc:${HOME}/texmf:"

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `gdircolors ~/.dir_colors`
fi

alias ls='gls $LS_OPTIONS -hF'
alias ll='gls $LS_OPTIONS -lhF'
alias l='gls $LS_OPTIONS -lAhF'
alias cgdb='cgdb -d ggdb'

precmd () { print -Pn "\e]1;%2d\a" }

# don't share history among terminals
setopt no_share_history

# source /Users/hack/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
