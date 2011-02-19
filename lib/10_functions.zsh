## --- lib/functions.zsh
## Modified: Wed 12 Jan 2011 11:32:38 PM CET
## Global shell functions

## Title
function title () {
    # escape '%' chars in $1, make nonprintables visible
    local a=${(V)1//\%/\%\%}

    # Truncate command, and join lines.
    a=$(print -Pn "%40>...>$a" | tr -d "\n")

    case $TERM in
        screen*)
            print -Pn "\e]2;$a @ $2\a"  ## plain xterm title
            print -Pn "\ek$a\e\\"       ## screen title (in ^A")
            print -Pn "\e_$2   \e\\"    ## screen location
            ;;
        xterm*)
            print -Pn "\e]2;$a @ $2\a"  ## plain xterm title
            ;;
    esac
}

## precmd is called just before the prompt is printed
function precmd () {
    title "zsh" "%m:%55<...<%~"
}

## preexec is called just before any command line is executed
function preexec () {
    title "$1" "%m:%35<...<%~"
}

## zShell tools
function uninstall-zsh () {
  /bin/sh $ZSH_SYS/tools/uninstall.sh
}

function update-zsh () {
  /bin/sh $ZSH_SYS/tools/update.sh
}

## Extract various archives easily
function extract () {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2) tar xvjf $1;;
      *.tar.gz) tar xvzf $1;;
      *.bz2) bunzip $1;;
      *.rar) unrar x $1;;
      *.gz) gunzip $1;;
      *.tar) tar xvf $1;;
      *.tbz2) tar xvjf $1;;
      *.tgz) tar xvzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *.7z) 7z x $1;;
      *) echo "'$1' cannot be extracted via >extract<";;
    esac
  else
    echo "'$1' is not a valid archive file"
  fi
}

## Quick process search
function psl() {
    ps auxww | grep -i $1 | grep -v grep
}

## Clean .svn folders
function svclean() {
    if [[ -d .svn ]]; then
        find . -iname ".svn" -print0 | xargs -0 rm -r
    else
        echo "no versioning information found" >&2
        return 1
    fi
}

## Show current Zshell revision
function zrev () {
    if [[ -d $ZSH_SYS/.svn || -d $ZSH_SYS/.git ]]; then
        ZREV=$(cd $ZSH_SYS && vcs_prompt)
        echo $ZREV
    fi
}

## If zsh is on laptop show battery status
function battery_status () {
    if [[ -d /proc/acpi/battery ]]; then
        if cat /proc/acpi/battery/BAT1/info | grep -o yes >/dev/null; then
            echo "%F{2}BAT:${${${=$(acpi)}[4]}%,}% ~${${${=$(acpi)}[5]}%,}%f"
        else
            echo "AC ONLINE"
        fi
    fi
}

## CPU FreQ Info
if [[ -f $(which cpufreq-info) ]]; then
    function cpu-info () {
        cpufreq-info | grep -m1 "current CPU frequency is"  | \
        sed -e 's/\ (asserted by call to hardware)//g' | \
        sed -e 's/\ curre`nt CPU frequency is//g'
    }
fi

## vim:ft=sh
