#
# .zshrc
#
# (c) 2017 wmr <wmr101@gmail.com>
#


#
# Bundles & custom settings
# This is much faster than zplug, albeit not very elegant
#

source <(antibody init)

# bundles before compinit
antibody bundle mafredri/zsh-async

for script in ${HOME}/.custom/*.zsh(.); do source $script; done

run_compinit # sourced from ~/.custom/completion.zsh

# bundles after compinit
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search

# theming
antibody bundle sindresorhus/pure
