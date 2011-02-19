## --- dist/10_environment.zsh
## Modified: Wed 12 Jan 2011 11:42:12 PM CET
## Environment file example.

## Setup HOSTNAME
export HOSTNAME=$(hostname)

## Chack for PAGER and BROWSER
if [ -f $(which vimpager) ]; then
    export PAGER="vimpager"
    export MANPAGER="vimpager"
else
    export PAGER="less"
    export MANPAGER="less"
fi

if [ -f /usr/bin/elinks ]; then
    export BROWSER="elinks"
else
    export BROWSER="less"
fi

export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR

if [[ ! -o interactive ]]; then
    return
fi

## Paludis options
export PALUDIS_OPTIONS="--show-use-descriptions none \
                        --show-reasons summary \
                        --dl-upgrade as-needed \
                        --dl-new-slots as-needed \
                        --log-level silent"

## Default startx session
export XSESSION="awesome"

## vim:ft=sh
