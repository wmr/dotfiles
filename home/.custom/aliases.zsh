# zsh aliases

alias plz=sudo
alias zshconf="${EDITOR} ~/.zshrc"
alias ltrah='ls -ltrah'

alias ack='nocorrect ack'
alias ag='nocorrect ag'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias ebuild='nocorrect ebuild'
alias gcc='nocorrect gcc'
alias gist='nocorrect gist'
alias grep='nocorrect grep'
alias heroku='nocorrect heroku'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias rm='nocorrect rm'

# Disable globbing.
alias bower='noglob bower'
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias rake='noglob rake'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'

# Define general aliases.
alias _='sudo'
alias b='${(z)BROWSER}'
alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias p='${(z)PAGER}'
alias po='popd'
alias pu='pushd'
alias type='type -a'

alias ls='ls -G'         # enable colored output in ls
alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias llk='ll -Sr'       # Lists sorted by size, largest last.
alias llt='ll -tr'       # Lists sorted by date, most recent last.
alias llc='llt -c'       # Lists sorted by date, most recent last, shows change time.
alias llu='llt -u'       # Lists sorted by date, most recent last, shows access time.

if (( $+commands[tmux] )); then
  alias tmux-ls="tmux list-sessions"

  # attach to given session or the last
  function _wmr_tmux_attach() {
    [[ ! -z $1 ]] && tmux attach -t $* || tmux attach
  }
  alias tma=_wmr_tmux_attach
fi

if (( $+commands[curl] )); then
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
fi

if (( $+commands[htop] )); then
  alias top=htop
fi

# Makes a directory and changes to it.
function mkdcd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# Changes to a directory and lists its contents.
function cdls {
  builtin cd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

# Pushes an entry onto the directory stack and lists its contents.
function pushdls {
  builtin pushd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

# Pops an entry off the directory stack and lists its contents.
function popdls {
  builtin popd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

# Prints columns 1 2 3 ... n.
function slit {
  awk "{ print ${(j:,:):-\$${^@}} }"
}

# Finds files and executes a command on them.
function find-exec {
  find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

# pretty print json
function ppjson {
  local JSON_TOOL="python2.7 -m json.tool"
  local PYGMENT_TOOL="pygmentize -l javascript"
  local FORMAT_CMD="${JSON_TOOL} | ${PYGMENT_TOOL}"

  if [[ $# -gt 0 ]]; then
    for arg in $@; do
      [[ ! -f $arg ]] && echo $* | eval ${FORMAT_CMD} && return
      cat $arg | eval $FORMAT_CMD
    done
  else
    eval "${JSON_TOOL} < /dev/stdin | ${PYGMENT_TOOL}"
  fi
}

# Serves a directory via HTTP.
alias http-serve='python -m SimpleHTTPServer'

# fasd shorthands
alias f='fasd -f'    # pick file
alias d='fasd -d'    # pick directory
alias z='fasd_cd -d' # cd to dir
alias v='f -e vim'   # quickly open files with vim
alias j=z            # mimic autojump

# accept extended regex by default
alias sed='sed -E'
alias grep='grep --color -E'

# pygments
alias pyg='pygmentize'

#
# global aliases
#
alias -g C='| wc -l'
alias -g G='| grep'
