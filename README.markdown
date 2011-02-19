--- README.markdown  
Updated: Wed 05 Jan 2011 04:02:59 PM CET

# zShell ZSH Framework with 0% fat!

 The original idea come from Robb Russel's Oh-My-ZSH community driven framework.
 This derivate/fork have same philosophy like OMZ framework but with simplicity in mind.
 Big part of original code is replaced with new one, and lot of new was added.

## Features

* User files are separated from framework files;
* Added priority when loading `lib/*` files;
* Added `.zlogin` and `.zlogout` template files;
* Added better way for history completion with UP/DOWN arrows from cursor position;
* VCS prompt use internal `vcs_info` module; 
* Implemented promptinit to handle themes; OMZ themes does not work;
* Plugins are compatible with Oh My Zsh framework;

TODO:

* Automagicaly setup user files with informations from Bash environment using bash2zsh internal script;
* Merge `tools/*.zsh` scripts into one `zshell-admin.sh` script; 
* Add support for OMZ way to handle themes;
* Convert rubbrussel.zsh-theme to prompt theme

## Installation

First you need to download install script and set file executable:

`% wget http://code.sperlic.rs/zshell/tools/install.sh`  
`% chmod +x install.sh`

Run installation with simple dot slash command from current $PWD:

`% ./install.sh`

After installation is finished, your zShell environment is ready and you can add and edit files in folder $HOME/.zsh;

## Upgrade

For purpose of stay up to date there is a function for updating environment.

`% update-zsh`

vim:ft=markdown
