#
# Dircolors setup
#
# (c) 2017 wmr <wmr101@gmail.com>
#


if (( $+commands[gdircolors] )); then
  DIRCOLORS_CMD=gdircolors
elif (( $+commands[dircolors])); then
  DIRCOLORS_CMD=dircolors
fi

eval $(${DIRCOLORS_CMD} -b ${HOME}/.dircolors)

unset DIRCOLORS_CMD
