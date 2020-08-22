# this is my personal settings file for WSL Ubuntu Bash.

# for this to take effect, create a symlink inside ~ pointing to the Coding folder in Dropbox:
#   ln -s /mnt/c/Dropbox/Coding ~/projects
#   note: the symlink can't be created using Windows API, or Windows GUI, it has to be done in Linux.

# on bash start, it will first run ~/.profile, which only has the following lines:
#   if [ "$BASH" ]; then
#     if [ -f ~/.bashrc ]; then
#       . ~/.bashrc
#     fi
#   fi
# then .bashrc will run, which contains some Ubuntu's pre-set settings when WSL Ubuntu was installed.
# What you need to do:
#   nano ~/.bashrc⏎, then put the following into the end of ~/.bashrc:
#     # Zhi's custom settings
#     if [ -f ~/projects/bashrc/zhi-bashrc-wsl.sh ]; then
#         . ~/projects/bashrc/zhi-bashrc-wsl.sh
#     fi
# then this file will run
# Note: Do NOT edit ~.bashrc or any other Linux files (files that are not in /mnt) with windows apps (code editors). Use Vim or NANO to edit!

# custom command prompt:
parse_git_branch() { # get git branch name
 git branch 2> /dev/null | sed -e '/^[^*]/d ' -e 's/* \(.*\)/(\1) /'
}

color31="\[\033[31m\]"
color32="\[\033[32m\]"
color33="\[\033[33m\]"
color34="\[\033[34m\]"
color35="\[\033[35m\]"
color36="\[\033[36m\]"
color37="\[\033[37m\]"
nocolor="\[\033[0m\]"
PS1="\n${debian_chroot:+($debian_chroot)}$color34\u $color35\H $color33\w $color36\$(parse_git_branch)\n$color36$ $nocolor"


# custom aliases:
  alias his='history'
  alias dir='ls --color --group-directories-first --file-type -hlX'
  alias gsta='git status'
  alias gadd='git add -A'
  alias gcom='git commit -m'
  alias gche='git checkout'
  alias glog='git log --oneline --decorate'
  alias graph='git log --all --decorate --oneline --graph'
  alias gdiff='git diff'
  alias gconf='git diff --name-only --diff-filter=U'
  alias game='git commit --amend --no-edit'

  alias s="/mnt/c/sudo/Sublime\ Text\ 3/subl.exe"
  # triage music in Google Music:
  alias googlemusic="find '/mnt/d/OneDrive/Music Triage/可在Google Music挑/' -name *.mp3 | shuf -n 30 | xargs -d '\n' -i mv {} '/mnt/d/OneDrive/Music Triage/In Google Music Now/'"
    # explain:
    # -name: what to find; shuf: shuffle; -d '\n': only \n is treated as delimiter, so each line is passed into xargs; {}: not sure
  # youtube-dl aliases:
  . ~/projects/youtube-dl-configs/settings.sh

# goto my preferred dir:
  cd ~/projects

# below are something I learned from Lynda course "Unix for Mac OS X Users"
export HISTSIZE=10000   # increase maximum history size
export HISTFILESIZE=1000000 # increase maximum history file size
# export HISTTIMEFORMAT='%Y-%m-%d %a %H:%M '  # add date and time to history, this is called strftime format
export HISTIGNORE="his:history:pwd:df:ls:ls -la:ll:dir:gsta:glog:graph:gadd:game:usong *:u *:cd *:exit:" # these commands won't be logged, delimeted by colon
export HISTCONTROL=ignoreboth
  # this should be the same as HISTCONTROL=ignoredups:ignorespace
  # ignoredups means if you used a command multiple times in a row, only log once
  # ignorespace means if you add a space before you command, it won't be logged. Useful when inputing sensitive stuff like passwords
