# this is zhi's personal settings file for WSL Ubunto Bash.
# for this file to take effect, put it into "~/zhi bashrc"
# on bash start, it will first run ~/.profile, which only has the following lines:
#   if [ "$BASH" ]; then
#     if [ -f ~/.bashrc ]; then
#       . ~/.bashrc
#     fi
#   fi
# then .bashrc will run, which contains some Ubunto's pre-set settings when WSL Ubunto was installed.
# put the following into the end of ~/.bashrc:
#   # Zhi's custom settings
#   if [ -f ~/zhi\ bashrc/.bashrc ]; then
#       . ~/zhi\ bashrc/.bashrc
#   fi
# then this file will run

# Originally I named this file ".bashrc_zhi", but Sublime Text couldn't recognize the file extension as bash scripting language

# below are something I learned from Lynda course "Unix for Mac OS X Users"

export HISTSIZE=10000		# increase maximum history size
export HISTFILESIZE=1000000	# increase maximum history file size
export HISTTIMEFORMAT='%Y-%m-%d %a %H:%M '	# add date and time to history, this is called strftime format
export HISTCONTROL=ignoreboth
	# this should be the same as HISTCONTROL=ignoredups:ignorespace
	# ignoredups means if you used a command multiple times in a row, only log once
	# ignorespace means if you add a space before you command, it won't be logged. Useful when inputing sensitive stuff like passwords

export HISTIGNORE="history:history *:pwd:df:ls:ls -la:ll:."	# these commands won't be logged

# custom aliases:
	alias .='ls --color --group-directories-first --file-type -hlX'

# goto my preferred dir:
  cd /mnt/d/Dropbox/Coding/Repos
