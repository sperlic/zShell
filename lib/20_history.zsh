## --- system/lib/20_history.zsh
## Modified: Thu 06 Jan 2011 12:59:36 AM CET
## Command history configuration

HISTFILE=$HOME/.zsh_history         # Full path to .zsh_history file.
HISTSIZE=100000                     # The maximum size of the history list; CAUTION: Can have impact on memory.
SAVEHIST=100000                     # How many lines to store in history file.

setopt hist_ignore_dups             # Ignore duplication command history list.
setopt share_history                # Share command history data.

setopt hist_verify                  # Whenever the user enters a line with history substitution, don't execute the line directly;
                                    # instead, perform history substitution and reload the line into the editing buffer.

setopt inc_append_history           # This options works like APPEND_HISTORY except that new history lines are added
                                    # to the $HISTFILE incrementally (as soon as they are entered), rather than waiting
                                    # until the shell is killed. The file is periodically trimmed to the number of lines
                                    # specified by $SAVEHIST, but can exceed this value between trimmings.

setopt extended_history             # Save each command's beginning timestamp (in seconds since the epoch) and the duration
                                    # (in seconds) to the history file. The format of this prefixed data is:
                                    # ':<beginning time>:<elapsed seconds>:<command>'.

setopt hist_expire_dups_first       # If the internal history needs to be trimmed to add the current command line, setting this option
                                    # will cause the oldest history event that has a duplicate to be lost before losing a unique event
                                    # from the list. You should be sure to set the value of HISTSIZE to a larger number than SAVEHIST
                                    # in order to give you some room for the duplicated events, otherwise this option will behave just
                                    # like HIST_IGNORE_ALL_DUPS once the history fills up with unique events.

setopt hist_ignore_space            # Remove command lines from the history list when the first character on the line is a space,
                                    # or when one of the expanded aliases contains a leading space. Note that the command lingers in
                                    # the internal history until the next command is entered before it vanishes, allowing you to briefly
                                    # reuse or edit the line. If you want to make it vanish right away without entering another command,
                                    # type a space and press return.

setopt SHARE_HISTORY                # This option both imports new commands from the history file, and also causes your typed commands
                                    # to be appended to the history file (the latter is like specifying INC_APPEND_HISTORY).
                                    # The history lines are also output with timestamps ala EXTENDED_HISTORY (which makes it easier to
                                    # find the spot where we left off reading the file after it gets re-written).
                                    # ---
                                    # By default, history movement commands visit the imported lines as well as the local lines,
                                    # but you can toggle this on and off with the set-local-history zle binding. It is also possible to
                                    # create a zle widget that will make some commands ignore imported commands, and some include them.
                                    # ---
                                    # If you find that you want more control over when commands get imported, you may wish to turn
                                    # SHARE_HISTORY off, INC_APPEND_HISTORY on, and then manually import commands whenever you need
                                    # them using `fc -RI'.

setopt APPEND_HISTORY               # If this is set, zsh sessions will append their history list to the history file, rather than
                                    # overwrite it. Thus, multiple parallel zsh sessions will all have their history lists added to the
                                    # history file, in the order they are killed.


## Widget function to set cursor position to end of line
function history-search-end {
    integer ocursor=$CURSOR

    if [[ $LASTWIDGET = history-beginning-search-*-end ]]; then
      # Last widget called set $hbs_pos.
      CURSOR=$hbs_pos
    else
      hbs_pos=$CURSOR
    fi

    if zle .${WIDGET%-end}; then
      # success, go to end of line
      zle .end-of-line
    else
      # failure, restore position
      CURSOR=$ocursor
      return 1
    fi
}

## Create new zle widget
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

### Map keys to execute widget
bindkey "\e[A" history-beginning-search-backward-end # cursor up
bindkey "\e[B" history-beginning-search-forward-end  # cursor down

## vim:ft=zsh
