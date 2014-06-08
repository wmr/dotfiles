# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="af-magic"
#ZSH_THEME="pure"
#ZSH_THEME="agnoster"
#ZSH_THEME="norm"
#ZSH_THEME="wedisagree"
ZSH_THEME="nicoulaj"

# aliases
alias zshconf="mvim ~/.zshrc"
alias plz=please

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx macports rsync colorize themes brew autojump autopep8 virtualenv jsontools sudo terminalapp vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/Users/wmr/Library/Python/2.7/bin:/Users/wmr/Library/UserScripts
export PATH=/Users/wmr/Library/UserScripts:/opt/local/bin:/opt/bin:/usr/local/bin:$PATH

# Preferred editor for local and remote sessions
if [[ -n ${SSH_CONNECTION} ]];
then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# ls color fix
unset LSCOLORS
export CLICOLOR=1

# vi term mode
set -o vi

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

fpath=($HOME/.homesick/repos/homeshick/completions $fpath)