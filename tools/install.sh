#!/bin/sh
## zShell is based on Robby Russel's 'Oh My Zsh' community-driven framework 
## for managing ZSH configuration files. https://github.com/robbyrussell/oh-my-zsh
## Modified: Sat 08 Jan 2011 01:48:31 PM CET

export ZSH_DIR=~/.zsh
export ZSH_SYS=~/.zsh/system

## Is ZSH installed?
if [ -f $(which zsh) ] 
then
    continue
else
    echo "ZSH Shell is not installed. Please install zsh-4.3.9 or greater from http://zsh.sourceforge.net/ and then try again."
    exit
fi

## Already installed zShell framework?
if [ -d $ZSH_SYS ]
then
  echo "You already have zShell installed. You'll need to remove $ZSH_SYS if you want to install"
  exit
fi

## Cloning zShell
echo "Versioning zShell..."
/usr/bin/svn co http://code.sperlic.rs/zshell $ZSH_SYS

## Find out zShell SVN revision number
export ZREV=$(svn info $ZSH_SYSTEM | sed -n s/Revision:\ //p)

## Making tools executable
echo "Making zShell tools executable..."
chmod 777 $ZSH_SYS/tools/*

## Setup user local folders
mkdir -p $ZSH_DIR/{lib,plugins,prompts,cache}
cp $ZSH_SYS/dist/lib/* $ZSH_DIR/lib

## Zshrc check
echo "Looking for an existing zsh config..."
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
then
  echo "Found ~/.zshrc. Backing up to ~/zshrc.pre-zsh";
  cp ~/.zshrc ~/.zshrc.pre-zsh;
  rm ~/.zshrc;
fi
echo "Using the zShell template file and adding it to ~/.zshrc"
cp $ZSH_SYS/templates/zshrc.zsh-template ~/.zshrc

## Write installed revision
sed -i "2i ## File revision $ZREV" ~/.zshrc

## Zlogin check
echo "Looking for an existing login config..."
if [ -f ~/.zlogin ] || [ -h ~/.zlogin ]
then
  echo "Found ~/.zlogin. Backing up to ~/zlogin.pre-zsh";
  cp ~/.zlogin ~/.zlogin.pre-zsh;
  rm ~/.zlogin;
fi
echo "Using the zShell template file and adding it to ~/.zlogin"
cp $ZSH_SYS/templates/zlogin.zsh-template ~/.zlogin

## Zlogout check
echo "Looking for an existing zsh logout config..."
if [ -f ~/.zlogout ] || [ -h ~/.zlogout ]
then
  echo "Found ~/.zlogout. Backing up to ~/zlogout.pre-zsh";
  cp ~/.zlogout ~/.zlogout.pre-zsh;
  rm ~/.zlogout;
fi
echo "Using the zShell template file and adding it to ~/.zlogout"
cp $ZSH_SYS/templates/zlogout.zsh-template ~/.zlogout

## Import current path
echo "Copying your current PATH and adding it to the $ZSH_DIR/lib/00_path.zsh."
OLD_PATH=$(echo "export PATH=$PATH") 
sed -i "6i $OLD_PATH" $ZSH_DIR/lib/00_path.zsh

## Change shell
echo "Time to change your default shell to zsh!"
chsh -s "/bin/zsh"

## Use zShell 
echo "zShell is now installed at revision $ZREV."
/usr/bin/env zsh
source ~/.zshrc

## vim:ft=sh
