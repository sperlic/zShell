## --- system/lib/23_vcs.zsh
## Modified: Sat 08 Jan 2011 04:06:39 PM CET

function vcs_prompt() {
    ## Check if any vcs backends is enabled.
    if [[ -n $vcs_backends ]]; then
        ## ZSH VCS >Tip: http://jnrowe.github.com/2009/10/28/TaD-Zsh_and_the_vcs.html
        autoload -Uz vcs_info

        local VCS_BRANCH="%F{6}%s%F{7}:%F{6}(%F{1}%b%F{6})%f"
        local VCS_ACTION="%a"

        ## VCS theming default: Variables for theming the vcs info prompt
        local VCS_PROMPT_PREFIX=""
        local VCS_PROMPT_SUFFIX=" "
        local VCS_PROMPT_STAGED="!"
        local VCS_PROMPT_UNSTAGED="*"

        ## See the documentation for the format string definition
        ## This generates a fancy coloured string with $vcs:($branch)
        zstyle ':vcs_info:*:zshell:*' check-for-changes true
        zstyle ':vcs_info:*:zshell:*' unstagedstr	        "${VCS_PROMPT_UNSTAGED}"
        zstyle ':vcs_info:*:zshell:*' stagedstr                 "${VCS_PROMPT_STAGED}"
        zstyle ':vcs_info:*:zshell:*' actionformats	        "${VCS_BRANCH}:${VCS_ACTION}"  ""
        zstyle ':vcs_info:*:zshell:*' formats	                "${VCS_BRANCH}"                ""
        zstyle ':vcs_info:*:zshell:*' nvcsformats	        ""                             ""
        zstyle ':vcs_info:*:zshell:*' enable $vcs_backends

        vcs_info zshell
        # Check for VCS messages if any.
        if [[ -n $vcs_info_msg_0_ ]]; then
            echo "$VCS_PROMPT_PREFIX${vcs_info_msg_0_}$VCS_PROMPT_SUFFIX"
        fi
    fi
}

## vim:ft=zsh

