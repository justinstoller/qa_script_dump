# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export PAGER="/usr/bin/less"

#LC_CTYPE=en_US.UTF-8
#export LC_CTYPE
#LANG=en_US.UTF-8
#export LANG

alias grep='grep --colour=auto'
alias less='less -rf'
alias ls='ls -G'
alias what='history|grep' 
alias vmrun="vmrun -T fusion"
alias tbd="ssh tb-driver"
alias stb="ssh slave-tb"
alias vmlist='secret=`ssh tb-driver "cat /etc/plharness/secret"`; echo -e "${secret}\n" | ssh tb-driver "/opt/libvirt/bin/virsh -c esx://root@soko/?no_verify=1 list" | sed "1,2d"'

source ~/.git-completion.bash
PRE='\[\033['
POST='m\]'
#COL_LASTEXIT="${PRE}01;41;37${POST}" # last command exit value
COL_PWD="${PRE}00;01;36${POST}" # current directory
COL_DEFAULT="${PRE}00${POST}" # back to default colors

# these give too much noise, imo
# PS1="$COL_LASTEXIT\${?#0}$COL_PWD \w$COL_DEFAULT\\n\\\$ "
# PS1="$COL_PWD \w$COL_DEFAULT\\n\\\$ "
export PS1=${PS1}'[\u@\h \W$(__git_ps1 " (%s)")]\$ '

