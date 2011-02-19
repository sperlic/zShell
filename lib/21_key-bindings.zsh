## --- system/lib/21_key-bindings.zsh
## Modiied: Mon 27 Dec 2010 03:48:29 AM CET 
## Global key mappings

autoload -U compinit
compinit -i

typeset -g -A key

bindkey '^A' beginning-of-line  # Ctrl+A
bindkey '^E' end-of-line        # Ctrl+E
bindkey '^O' undefined-key      # Ctrl+O
bindkey '^O' undefined-key      # Ctrl+O
bindkey -s '^D' 'dirs -v\n'     # Ctrl+D
bindkey -s '^Z' 'update-zsh\n'  # Ctrl+Z

## Fine-tuned word manipulation - Copyright 2008, Angel Olivera
longword-command() {
    typeset -U WORDCHARS=${WORDCHARS}:@,+
    zle ${WIDGET#longword-}
}
shortword-command() {
    typeset WORDCHARS=${WORDCHARS//[\/.:;@# -]}
    zle ${WIDGET#shortword-}
}

## kill-word
zle -N longword-kill-word longword-command
zle -N shortword-kill-word shortword-command
bindkey '\ed' shortword-kill-word   # Alt+d
bindkey '\eD' longword-kill-word    # Alt+D

## backward-kill-word
zle -N longword-backward-kill-word longword-command
zle -N shortword-backward-kill-word shortword-command
bindkey '\ew' shortword-backward-kill-word  # Alt+w
bindkey '\eW' longword-backward-kill-word   # Alt+W

## forward-word
zle -N longword-forward-word longword-command
zle -N shortword-forward-word shortword-command
bindkey '\ef' shortword-forward-word    # Alt+f
bindkey '\eF' longword-forward-word     # Alt+F

## backward-word
zle -N longword-backward-word   longword-command
zle -N shortword-backward-word  shortword-command
bindkey '\eb' shortword-backward-word   # Alt+b
bindkey '\eB' longword-backward-word    # Alt+B

## vim:ft=zsh
