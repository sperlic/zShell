## --- system/lib/12_directories.zsh
## Modified: Tue 04 Jan 2011 11:47:27 AM CET
## Changing/making/removing directory

setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

## Directory stack
alias 0='dirs -v'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

## Automatic CD
alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'

cd () {
  if   [[ "x$*" == "x..." ]]; then
    cd ../..
  elif [[ "x$*" == "x...." ]]; then
    cd ../../..
  elif [[ "x$*" == "x....." ]]; then
    cd ../../..
  elif [[ "x$*" == "x......" ]]; then
    cd ../../../..
  else
    builtin cd "$@"
  fi
}

## Remove directory 
alias rd=rmdir

## Create new directory
function md () {
  mkdir -p $1
  cd $1
}

## Quick CD command
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}

zle -N rationalise-dot
bindkey . rationalise-dot

## vim:ft=sh
