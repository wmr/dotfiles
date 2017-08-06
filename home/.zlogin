#
# .zlogin
#
# (c) 2017 wmr <wmr101@gmail.com>
#


# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ "$zcompdump" -nt "${zcompdump}.zwc" || ! -s "${zcompdump}.zwc" ]]; then
    zcompile "$zcompdump"
  fi

  # Set up launchctl environment (macOS)
  if (( $+commands[launchctl] )); then
    for env_var in PATH MANPATH; do
        launchctl setenv "$env_var" "${(P)env_var}"
    done
  fi
} &!


# Print figlet and a random, offending cookie.
# The non-offending ones are boring anyway
() {
  if (( $+commands[figlet] ))
  then
    local figlet_font="smisome1"
    (( $+commands[lolcat] )) && local pipe_lolcat="| lolcat"
    eval "figlet -f ${figlet_font} ${$(hostname):r:r} ${pipe_lolcat} && print"
  fi

  if (( $+commands[fortune] ))
  then
    local quote="$(fortune -o)"
    local length="${#${quote}}"
    if [[ ${length} -le 200 ]] && (( $+commands[cowsay] ))
    then
      cowsay ${quote} && print
    else
      echo ${quote} && print
    fi
  fi
}
