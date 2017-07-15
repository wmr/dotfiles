#
# Key bindings
#
# (c) 2017 wmr <wmr101@gmail.com>
#

# vi mode
bindkey -v

# Enable emacs shortcuts in vi mode
bindkey "^A" beginning-of-line      # vi-backward-kill-word
bindkey "^E" end-of-line            # vi-backward-kill-word
bindkey "^W" backward-kill-word     # vi-backward-kill-word
bindkey "^H" backward-delete-char   # vi-backward-delete-char
bindkey "^U" kill-word              # vi-kill-word
bindkey "^K" kill-line              # vi-kill-line
bindkey "^?" backward-delete-char   # vi-backward-delete-char

# History substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
