#
# .profile (shared)
#
# (c) wmr
#


# lang setup
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# add user scripts to path
export PATH=${HOME}/bin:${PATH}

[[ -f ${HOME}/.cargo/env ]] && source ${HOME}/.cargo/env
