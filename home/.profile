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

# rustup / cargo
[[ -f ${HOME}/.cargo/env ]] && source ${HOME}/.cargo/env
. "$HOME/.cargo/env"

export PATH="/opt/homebrew/bin:${PATH}"
export PATH="/opt/homebrew/sbin:${PATH}"

source "${HOME}/.sdkman/bin/sdkman-init.sh"
export HOMEBREW_NO_ENV_HINTS=true
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
