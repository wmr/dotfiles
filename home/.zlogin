#
# (c) 2014 // wmr
#

# commands at login post-zshrc.

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.cache/.zcompdump"
  if [[ "$zcompdump" -nt "${zcompdump}.zwc" || ! -s "${zcompdump}.zwc" ]]; then
    zcompile "$zcompdump"
  fi

  # Set environment variables for launchd processes.
  if [[ "$OSTYPE" == darwin* ]]; then
    for env_var in PATH MANPATH; do
      launchctl setenv "$env_var" "${(P)env_var}"
    done
  fi
} &!

# print figlet and a random, offending cookie. 
# The not-offending ones are boring anyway
if (( $+commands[figlet] && $+commands[fortune] )) 
then 
    figlet -f ticks wmr101
    fortune -o && print
fi
