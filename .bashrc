# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="/home/z/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

export GOROOT=/usr/local/go
export GOPATH=$HOME/projects
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GOROOT_BOOTSTRAP=/usr/local/go/
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

alias l='ls -lah'
mykil() {
  for var in "$@"
  do
    echo "now all '$var'  will be killed "
    sudo kill -9 $(ps aux | grep $var | awk '{print $2}')
  done
}
shdoc() {
  echo "now bash to '$1' ! "
  docker exec -t -i $1 bash
}
kmn(){
  mykil make node
}
cr(){
  clear && make serve
}
alias gst='git status'
alias gs='git status'
alias gss='git status -s'
alias ga='git add .'
alias gcam='git commit -am'
gac(){
  ga && gcam "'$1'"
}
gpoh(){
  git push origin HEAD
}
gsbr(){
  git branch --sort=-committerdate
}
# ps -ef | grep defunct
# [[ -s "/home/z/.gvm/scripts/gvm" ]] && source "/home/z/.gvm/scripts/gvm"
# export GOPATH=$HOME/go
# docker run -it --rm -p 8081:8081 --link mong_fetch_img:mongo mongo-express
# docker run -p 28002:27017 --name mongo -d mongo
# docker run -p 5435:5432 --name a545postgres -e POSTGRES_PASSWORD=pass -d postgres:9.6
# docker run -p 5435:5432 --name a455postgres -e POSTGRES_PASSWORD=pass -d postgres
#########################33 this link is rihg variant first create with any above then connect with it
# docker run -it --rm --link a455postgres:postgres postgres psql -h postgres -U postgres
#########################33 this link is rihg variant first create with any above then connect with it
# docker run -p 8081:8081 --link a455postgres:db -e DATABASE_URL=postgres://postgres:pass@db:5432/postgres sosedoff/pgweb
############GUI WEB pgweb #############################################
# docker exec -U postgres a455postgres pg_restore -C -d postgres < db.dump
# docker exec -i a455postgres pg_restore -C --clean --no-acl --no-owner -U postgres -d postgres < ./backup.backup
# pg_restore --verbose --clean --no-acl --no-owner -h localhost -U myuser -d mydb latest.dump
# docker run -it -p 5435:5432 --name 477a545postgres56 -e POSTGRES_PASSWORD=pass -e PGDATA=/var/lib/postgresql/data/pgdata -v /var/lib/postgresql/data/pgdata:/home/z/projects/a5000/a50000/backup.backup -d postgres:9.6
# docker run -it --rm --link a545postgres:postgres postgres psql -h postgres -U postgres -f "/home/z/projects/a5000/a50000/backup.backup"

# docker exec -i a545postgres pg_restore -C --clean --no-acl --no-owner -U postgres -d 0.0.0.0:5435 < /home/z/projects/a5000/a50000/backup.backup
############################################################################################################
# psql -e -U postgres -d postgres -f "/home/z/projects/a5000/a50000/backup.backup"
# docker run -it -p 5435:5432 --name 564a8715545postgre657 -e POSTGRES_PASSWORD=pass -v /home/z/projects/a5000/a50000/backup.backup:/projects/back.backup -d postgres:9.6
# docker run -p 8081:8081 --link 564a8715545postgre657:db -e DATABASE_URL=postgres://postgres:pass@db:5432/postgres sosedoff/pgweb
# docker run -it --rm --link 477a545postgres56:postgres postgres psql -h postgres -U postgres -f "/var/lib/postgresql/data/pgdata/backup.backup"
# docker run -it -p 5435:5432 --name 4a77a545postgres5645 -e POSTGRES_PASSWORD=pass -e POSTGRES_DB=backup -e PGDATA=/var/lib/postgresql/data/pgdata -v /var/lib/postgresql/data/pgdata:/home/z/projects/a5000/a50000/backup.backup -d postgres:9.6
# ack -lR 'Send App Instructions'
# ack -lRi 'customer|service'
# git stash
# git stash apply stash@{0}

# sudo teamviewer --daemon stop 
