# this is my personal settings file for Mac.

# for this to take effect, put the following into the end of ~/.bashrc:
#   # Zhi's custom settings
#   if [ -f ~/Dropbox/Coding/bashrc/zhi-bashrc-mac.sh ]; then
#       . ~/Dropbox/Coding/bashrc/zhi-bashrc-mac.sh
#   fi
# on Terminal start, ~/.bash_profile will run first, then this file gets run

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
PS1="\n$color34\u $color35\H $color33\w $color36\$(parse_git_branch)$nocolor--> "

# custom aliases:
  alias dir='ls -GFSlhor'

# goto my preferred dir:
  cd ~/projects

# below are something I learned from Lynda course "Unix for Mac OS X Users"
export HISTSIZE=10000   # increase maximum history size
export HISTFILESIZE=1000000 # increase maximum history file size
export HISTTIMEFORMAT='%Y-%m-%d %a %H:%M '  # add date and time to history, this is called strftime format
export HISTIGNORE="history:history *:pwd:df:ls:ls -la:ll:." # these commands won't be logged
export HISTCONTROL=ignoreboth
  # this should be the same as HISTCONTROL=ignoredups:ignorespace
  # ignoredups means if you used a command multiple times in a row, only log once
  # ignorespace means if you add a space before you command, it won't be logged. Useful when inputing sensitive stuff like passwords
