# powerline init
POWERLINE_HOME="${HOME}/Library/Python/2.7/lib/python/site-packages/powerline"
POWERLINE_ZSH_INIT_DEFAULT="${HOME}/.custom/powerline-prompt.zsh"
POWERLINE_ZSH_INIT_FALLBACK="${POWERLINE_HOME}/bindings/zsh/powerline.zsh"
POWERLINE_DAEMON='/usr/local/bin/powerline-daemon'

if [[ -e ${POWERLINE_ZSH_INIT_DEFAULT} ]]; then
  POWERLINE_ZSH_INIT=${POWERLINE_ZSH_INIT_DEFAULT}
else
  POWERLINE_ZSH_INIT=${POWERLINE_ZSH_INIT_FALLBACK}
fi

alias lpowerline="source ${POWERLINE_ZSH_INIT}"

# start powerline daemon
[[ -e ${POWERLINE_DAEMON} ]] && ${POWERLINE_DAEMON} --silent
# set powerline prompt
[[ -e ${POWERLINE_ZSH_INIT} ]] && lpowerline
# export powerline daemon to be used in .tmux.conf, etc
export POWERLINE_DAEMON
