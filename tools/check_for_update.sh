#!/bin/sh

function _current_epoch() {
  echo $(($(date +%s) / 60 / 60 / 24))
}

function _update_zsh_update() {
  echo "LAST_EPOCH=$(_current_epoch)" > ~/.zsh-update
}

if [ -f ~/.zsh-update ]; then
  . ~/.zsh-update

  if [[ -z "$LAST_EPOCH" ]]; then
    _udate_zsh_update && return 0;
  fi

  epoch_diff=$((${_current_epoch} - $LAST_EPOCH))
  if [ $epoch_diff -gt 6 ]; then
    echo "[zShell] Would you like to check for updates?"
    echo "Type Y to update zShell: \c "
    read line
    if [ "$line" = Y ] || [ "$line" = y ]; then
      /bin/sh $ZSH_SYS/tools/upgrade.sh
    fi
  fi
fi

## Update the zsh file
_update_zsh_update


## vim:ft=sh
