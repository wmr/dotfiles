#
# .zshrc
#
# (c) wmr
#

# Check for zplug; install if missing
[[ ! -d ~/.zplug ]] && git clone https://github.com/b4b4r07/zplug ~/.zplug

source ~/.zplug/init.zsh

zplug "mafredri/zsh-async", from:github, defer:0
zplug "modules/history", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/homebrew", from:prezto
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-completions", from:github, defer:2
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2
zplug "zsh-users/zsh-history-substring-search", from:github, defer:3

# theme
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# locals
zplug "~/.custom", from:local

zplug load
