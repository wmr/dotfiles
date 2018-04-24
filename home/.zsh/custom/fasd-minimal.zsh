#
# Sets shell behavior options
#
# (c) 2017 wmr <wmr101@gmail.com>
#


# Initialization
eval "$(fasd --init posix-alias zsh-hook)"

# fasd shorthands
alias f='fasd -f'    # pick file
alias d='fasd -d'    # pick directory
alias z='fasd_cd -d' # cd to dir
alias v='f -e vim'   # quickly open files with vim
alias j=z            # mimic autojump
