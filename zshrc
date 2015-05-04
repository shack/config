# The following lines were added by compinstall
zstyle :compinstall filename '/Users/hack/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export PYTHON_BASE=`python -m site --user-base`
export EDITOR=vim
export MACPORTS_PREFIX="/opt/local"
export PATH=${HOME}/.local/bin:${HOME}/bin:${PYTHON_BASE}/bin:${MACPORTS_PREFIX}/bin:${MACPORTS_PREFIX}/sbin:/opt/ilog/cplex/bin:${HOME}${PATH}
export TEXINPUTS=".:${HOME}/sb/misc:${HOME}/texmf:"

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `gdircolors ~/.dir_colors`
fi

alias ls='gls $LS_OPTIONS -hF'
alias ll='gls $LS_OPTIONS -lhF'
alias l='gls $LS_OPTIONS -lAhF'

source /Users/hack/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
