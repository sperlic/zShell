## --- /system/lib/31_misc.zsh
## Modified: Sat 08 Jan 2011 12:16:28 AM CET
## Place of all good homeless things 

## Smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## File rename magick
bindkey "^[m" copy-prev-shell-word

## Color grep results
export GREP_OPTIONS='--color=auto'  # enabling auto color
export GREP_COLOR='1;36'            # set color to green

## Enable all typing corrections
setopt correct_all

## Correction excludes 
alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias ebuild='nocorrect ebuild'

## vim:ft=zsh
