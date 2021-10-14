export LANG="en_US.utf-8"
export PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig:$PKG_CONFIG_PATH
export MACPORTS_PREFIX=/opt/local
export PATH=${HOME}/.local/bin:/usr/texbin:${HOME}/bin:${MACPORTS_PREFIX}/bin:${MACPORTS_PREFIX}/sbin:/opt/ilog/cplex/bin:${PATH}
export MANPATH=${MACPORTS_PREFIX}/share/man:${MANPATH}
export EDITOR=vim
export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagacad
export RSYNC_RSH=ssh
export TEXINPUTS=".:${HOME}/sb/misc:${HOME}/texmf:"
export PYTHONPATH="${HOME}/.local/lib/python2.7/site-packages/:${PYTHONPATH}"
export ILOG_LICENSE_FILE=/opt/ilog/ilm/access.ilm
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `gdircolors ~/.dir_colors`
fi
alias ls='gls $LS_OPTIONS -hF'
alias ll='gls $LS_OPTIONS -lhF'
alias l='gls $LS_OPTIONS -lAhF'
alias lmake="latexmk -quiet -pdf"
alias gitx="open -a sourcetree ."
alias TODO="mvim ~/Desktop/TODO"
alias less='less -r'
bind 'C-w: backward-kill-word'
# Set the prompt also in the xterm window title
PS1='\u@\h:\w $ '
case "$TERM" in
xterm-*color)
	if [ ${USER} != "hack" ];
	then
		P=${USER}
	fi
#   uncomment on other hosts
#	SHORT_HOST=$(echo ${HOSTNAME} | cut -f 1 -d .)
#		if [ ! -e $P ];
#		then
#			P="$P@"
#		fi 
#		P="$P${SHORT_HOST}:"
#	fi
    # PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
    PROMPT_COMMAND='echo -ne "\033]0;${P} ${PWD/$HOME/~}\007"'
    ;;
esac
set -o vi
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi
source "$HOME/.cargo/env"

source /Users/hack/.config/broot/launcher/bash/br
