## --- system/lib/40_appearance.zsh
## Modified: Sat 08 Jan 2011 01:34:06 PM CET
## Look and Feel

## ls colors
autoload colors; colors;

## export BSD LS_COLORS => http://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacad"

## Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]; then
    # Find the option for using colors in ls, depending on the version: Linux or BSD
    ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

setopt no_beep
setopt auto_cd
setopt multios
setopt cdablevars

if [[ x$WINDOW != x ]]; then
    SCREEN_NO="%B$WINDOW%b "
else
    SCREEN_NO=""
fi

## Setup the prompt with pretty colors
#setopt prompt_subst

## Load theme
if [ -f $ZSH_DIR/prompts/prompt_$(echo $ZSH_THEME)_setup ]; then
    fpath+=($ZSH_DIR/prompts)
else
    fpath+=($ZSH_SYS/prompts)
fi

## Setup promptinit
autoload -Uz promptinit; promptinit
prompt $ZSH_THEME

## vim:ft=zsh

