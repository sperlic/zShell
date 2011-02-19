## --- dist/00_path.zsh
## Modified: Tue 04 Jan 2011 11:52:40 AM CET
## Path file example.

## Your imported PATH

## PATH
path+=( /opt/bin /usr/local/bin )

if [[ -e ~/bin ]]; then
    path+=( ~/bin )
fi

## Python paths 
PYTHONPATH+=(~/Projects/lib)

## vim:ft=sh
