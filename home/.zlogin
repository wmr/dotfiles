#
# .zlogin
#
# (c) 2017 wmr <wmr101@gmail.com>
#


# commands at login post-zshrc.

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ "$zcompdump" -nt "${zcompdump}.zwc" || ! -s "${zcompdump}.zwc" ]]; then
    zcompile "$zcompdump"
  fi

  if (( $+commands[launchctl] )); then
    for env_var in PATH MANPATH; do
        launchctl setenv "$env_var" "${(P)env_var}"
    done
  fi
} &!

# print figlet and a random, offending cookie.
# The non-offending ones are boring anyway
if (( $+commands[figlet] && $+commands[fortune] ))
then
    figlet -f ticks ${$(hostname):r:r}
    fortune -o && print
fi
