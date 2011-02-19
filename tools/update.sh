#!/bin/sh
## --- system/tools/update.sh
## Modified: Tue 04 Jan 2011 11:43:21 AM CET

echo "Updating zShell"
(cd $ZSH_SYS && svn up)

echo "zShell has been updated at current vcs version."
echo "Any new updates will be reflected at new terminal session."

## vim:ft=sh
