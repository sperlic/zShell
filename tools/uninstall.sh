#!/bin/sh
## --- system/tools/uninstall.sh
## Modified: Thu 06 Jan 2011 08:37:52 PM CET
## Uninstall zShell framework

if [[ -d $ZSH_DIR ]]; then
    echo "Removing $ZSH_DIR"
    rm -rf $ZSH_DIR
else
    echo "You dont have zShell installed or the variable \$ZSH_DIR is not set."
fi

if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  echo "Found zShell configs. Removing....";
  rm ~/{.zshrc,.zlogin,.zlogout};
else
  echo "Switching back to bash"
  chsh -s /bin/bash
  source /etc/profile
fi

echo "Thanks for trying out zShell. It's been uninstalled."

## vim:ft=sh
