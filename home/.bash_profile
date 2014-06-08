. ~/.profile
if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi

[ -n "$TMUX" ] && export TERM=screen-256color


export PS1="\[\e[0;35m\]\h:\[\e[0m\]\W \[\e[1;30m\]\u$\[\e[0m\] "
export HISTCONTROL=ignoredups

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
. /Users/wmr/.profabevjava
