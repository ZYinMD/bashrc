# this is my personal settings file for WSL Ubunto Bash.

# for this to take effect, create a symlink inside ~ pointing to the Coding folder in Dropbox:
#   ln -s /mnt/d/Dropbox/Coding Projects
# note: the symlink can't be created using Windows API, or Windows GUI, it has to be done in Linux.

# on bash start, it will first run ~/.profile, which only has the following lines:
#   if [ "$BASH" ]; then
#     if [ -f ~/.bashrc ]; then
#       . ~/.bashrc
#     fi
#   fi
# then .bashrc will run, which contains some Ubunto's pre-set settings when WSL Ubunto was installed.
# put the following into the end of ~/.bashrc:
#   # Zhi's custom settings
#   if [ -f ~/Projects/bashrc/zhi\ bashrc.sh ]; then
#       . ~/Projects/bashrc/zhi\ bashrc.sh
#   fi
# then this file will run

# originally I named this file ".bashrc_zhi", but Sublime Text couldn't recognize the file extension as bash scripting language.
# from my test, Sublime knows .sh and .bashrc

# custom command prompt:
parse_git_branch() { # get the branch name
 git branch 2> /dev/null | sed -e '/^[^*]/d ' -e 's/* \(.*\)/(\1) /'
}

  color31="\033[31m"
  color32="\033[32m"
  color33="\033[33m"
  color34="\033[34m"
  color35="\033[35m"
  color36="\033[36m"
  nocolor="\033[0m"
  PS1="${debian_chroot:+($debian_chroot)}$color32\u $color35\H $color33\w$color36 \$(parse_git_branch)$nocolor--> "


# custom aliases:
  alias .='ls --color --group-directories-first --file-type -hlX'
  alias s="/mnt/d/Dropbox/Portables/Sublime\ Text\ 3/subl.exe"

# goto my preferred dir:
  # cd /mnt/d/Dropbox/Coding/Repos # this works too, but looks too long
  cd ~/Projects

# below are something I learned from Lynda course "Unix for Mac OS X Users"
export HISTSIZE=10000   # increase maximum history size
export HISTFILESIZE=1000000 # increase maximum history file size
export HISTTIMEFORMAT='%Y-%m-%d %a %H:%M '  # add date and time to history, this is called strftime format
export HISTIGNORE="history:history *:pwd:df:ls:ls -la:ll:." # these commands won't be logged
export HISTCONTROL=ignoreboth
  # this should be the same as HISTCONTROL=ignoredups:ignorespace
  # ignoredups means if you used a command multiple times in a row, only log once
  # ignorespace means if you add a space before you command, it won't be logged. Useful when inputing sensitive stuff like passwords


