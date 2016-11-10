#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# System default
OS=$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om)

#
# Options
#

shopt -s histappend
shopt -s checkwinsize
xset r rate 250 60

[ -x /usr/bin/lesspipe     ] && eval "$(SHELL=/bin/sh lesspipe)"
[ -f /etc/bash_completion  ] && . /etc/bash_completion


#
# Environment variables
#

export HISTCONTROL=ignoreboth
export HISTSIZE=
export HISTFILESIZE=
export ANDROID_HOME='/home/jlobos/Android/Sdk/'
export LANG='es_CL.UTF-8'
export VISUAL='nvim'
export EDITOR='nvim'

#
# This loads nvm
#

export NVM_DIR="/home/jlobos/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

#
# Source
#

source ~/.dotfiles/git-prompt.sh
source ~/.dotfiles/base16-shell/scripts/base16-oceanicnext.sh

#
# Aliases
#

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias android='sh ~/Android/Sdk/tools/android'
alias babel='./node_modules/.bin/babel-node'
alias babelwatch='./node_modules/.bin/babel --watch'
alias br='source ~/.bashrc'
alias c='clear'
alias copy='xclip -selection clipboard'
alias date='date "+%a %d %b %Y %H:%M"'
alias d='pwd'
alias e='nvim'
alias f='feh --scale-down'
alias g='git'
alias gl='git lg'
alias hc='history -c'
alias h='heroku'
alias i='npm i'
alias la='ls -A'
alias ll='ls -alF'
alias lol='lolcat -a'
alias ls='ls -X --color=auto'
alias l='tree -L 1 -Calsh'
alias n='node'
alias npmupdate='sudo npm-check -u -g'
alias nyan='telnet nyancat.dakko.us'
alias onion='systemctl start tor && firefox --private-window'
alias onion-stop='systemctl stop tor'
alias o='rhc'
alias p='sudo pacman'
alias q='exit'
alias r='npm r'
alias run='npm run -loglevel silent'
alias s='git status'
alias t='tmux -2'
alias vim='nvim'
alias vi='nvim'
alias vol='amixer get Master | grep -E -o "[0-9]{1,3}?%" | head -1 | rev | cut -c 2- | rev '
alias wifi='sudo create_ap wlp1s0 enp0s20u1 jlobitu meportobienmamita'
alias ya='yarn add'
alias yd='yarn add --dev'
alias yr='yarn remove'
alias yu='yarn upgrade'
alias y='yarn'

#
# Package Manager
#

if [ "$OS" == 'Ubuntu 14.04.5 LTS' ]; then
  alias os-update='sudo apt-get update && sudo apt-get upgrade'
  alias os-install='sudo apt-get install'
  alias os-remove='sudo apt-get remove'
elif [ "$OS" == 'NAME="Arch Linux"' ]; then
  alias os-update='yaourt --noconfirm -Syua'
  alias os-install='yaourt -S'
  alias os-remove='yaourt -R'
fi

open() { xdg-open $1 &> /dev/null & }
ga() { git add $1; }
gc() { git commit -m "$*"; }

#
# Encrypt & Decrypt
#

encrypt() {
  tar czvpf - $1 | \
  gpg --symmetric --cipher-algo aes256 -o ${1%/}.encrypt && rm $1 -rf
}

decrypt() {
  gpg -d $1 | tar xzvf -
}

#
# Others
#

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH" # RubyGems

#
# Prompt
#

PS1=' \[\e[1;35m\]$(__git_ps1 "(%s)") \[\e[35m\]◯ \[\e[0m\]'
