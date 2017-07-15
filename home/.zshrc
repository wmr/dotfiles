# plugins
[[ ! -d ~/.zplug ]] && git clone https://github.com/b4b4r07/zplug ~/.zplug

source ~/.zplug/init.zsh

zplug "mafredri/zsh-async", from:github, defer:0
zplug "lib/completion", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "modules/homebrew", from:prezto
zplug "zsh-users/zsh-completions", from:github, defer:2
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2
zplug "zsh-users/zsh-history-substring-search", from:github, defer:3
zplug "sharat87/zsh-vim-mode"

# theme
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# locals
zplug "~/.custom", from:local

zplug load
