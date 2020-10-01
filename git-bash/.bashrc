# If not in interactive mode, do nothing and return. This is only applicable to distros (e.g. Debian) where ~/.bashrc is loaded even in non-interactive mode. Most distros don't.
[[ $- == *i* ]] || return 0

# This file should contain personal settings for interactive shells: alias, PS1, etc.

# history:
export HISTSIZE=10000                                                                                             # increase maximum history (in bytes)
export HISTIGNORE="his:history:history *:pwd:df:ls:ls -la:ll:dir:gsta:glog:graph:gadd:game:usong *:u *:cd *:exit" # these commands won't be logged to history (delimet by colon).
export HISTCONTROL=ignoreboth
# this should be the same as HISTCONTROL=ignoredups:ignorespace
# ignoredups means if you used a command multiple times in a row, only log once
# ignorespace means if you add a space before you command, it won't be logged. Useful when inputing sensitive stuff like passwords

# alias:
alias his='history'
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l'
alias dir='ls --color=auto -Fhpl --group-directories-first --show-control-chars'
alias gsta='git status'
alias gadd='git add -A'
alias gcom='git commit -m'
alias gche='git checkout'
alias glog='git log --oneline --decorate'
alias graph='git log --all --decorate --oneline --graph'
alias gdiff='git diff'
alias gconf='git diff --name-only --diff-filter=U'
alias game='git commit --amend --no-edit'
alias node10='nvm use 10.22.1'
alias node14='nvm use 14.13.0'

# PS1:
PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
PS1="$PS1"'\n'                         # new line
PS1="$PS1"'\[\033[34m\]'               # change to green
PS1="$PS1"'\u '                        # user
PS1="$PS1"'\[\033[35m\]'               # change to purple
PS1="$PS1"'\H '                        # show host
PS1="$PS1"'\[\033[33m\]'               # change to green
PS1="$PS1"'\w'                         # current working directory
if test -z "$WINELOADERNOEXEC"; then
  GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
  COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
  COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
  COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
  if test -f "$COMPLETION_PATH/git-prompt.sh"; then
    . "$COMPLETION_PATH/git-completion.bash"
    . "$COMPLETION_PATH/git-prompt.sh"
    PS1="$PS1"'\[\033[36m\]' # change color to cyan
    PS1="$PS1"'`__git_ps1`'  # bash function
  fi
fi
PS1="$PS1"'\n'             # new line
PS1="$PS1"'\[\033[1;32m\]' # change to light blue
PS1="$PS1"'❖ '             # prompt: always >
PS1="$PS1"'\[\033[0m\]'    # no color

# youtube-dl

source ~/Dropbox/Coding/youtube-dl-configs/settings.sh
cd ~/Dropbox/Coding || exit
