#
# Alias setup
#
# (c) 2014 wmr <wmr101@gmail.com>
#


# Generic
alias _=sudo
alias plz=sudo
alias zshconf="${EDITOR} ~/.zshrc"
alias ltrah='ls -ltrah'

# Disable correction
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

# enable colored output in ls
if [[ ${OSTYPE} == darwin* ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color'
fi

alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias llk='ll -Sr'       # Lists sorted by size, largest last.
alias llt='ll -tr'       # Lists sorted by date, most recent last.
alias llc='llt -c'       # Lists sorted by date, most recent last, shows change time.
alias llu='llt -u'       # Lists sorted by date, most recent last, shows access time.

alias py='python'
alias py3='python3'

alias g=git

# cd to current directory open in Finder
if [[ ${OSTYPE} == darwin* ]]; then
cdf () {
  finderPath=`osascript -e '
  tell application "Finder"
    try
      set currentFolder to (folder of the front window as alias)
    on error
      set currentFolder to (path to desktop folder as alias)
    end try
    POSIX path of currentFolder
  end tell'`;
  cd "$finderPath"
}
fi

if (( $+commands[brew] )); then

  # Homebrew
  alias brewc='brew cleanup'
  alias brewC='brew cleanup --force'
  alias brewi='brew install'
  alias brewl='brew list'
  alias brews='brew search'
  alias brewu='brew update && brew upgrade'
  alias brewx='brew remove'

  # Homebrew Cask
  alias cask='brew cask'
  alias caskc='brew cask cleanup --outdated'
  alias caskC='brew cask cleanup'
  alias caski='brew cask install'
  alias caskl='brew cask list'
  alias casks='brew cask search'
  alias caskx='brew cask uninstall'
fi

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

# Serves a directory via HTTP.
alias http-serve='python -m SimpleHTTPServer'


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
