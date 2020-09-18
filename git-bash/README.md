After Windows10 install, right click `./create_symlink (run as admin!).bat` and choose "run as admin". This will symlink 3 files into ~, then my settings of git-bash will return.

For (decades of) historic reasons, the boot sequence of Linux is a tangled mess. Here's the simplified version:

If a non-interactive shell:

- Doesn't auto load any scripts.

Interactive shells:

- A non-login bash will load `~/.bashrc`.
- A login non-bash shell (e.g. sh) will auto load `~/.profile`.
- A login bash will auto load `~/.bash_profile` instead of `~/.profile`.

Therefore, a simple solution that covers every scenario is:

1. create `.bashrc`, put stuff that's relevant to all _interactive_ bash shell. This file typically contains most of your stuff (PS1, alias, etc)
1. create `.profile`, put stuff that's not included in 1, but relevant to all _login_ shells including non-bash.
1. create `.bash_profile`, put in stuff that's not included in 1 and 2, and only applicable to _login_ bash shells, then source `.profile` then `.bashrc`. This is your entry point.

Note that this is a simplified setup, there are exceptions on Debian, and also exceptions when the shell is not started in a terminal app, or GUI app, etc. Read both https://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc and https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile for more.

However, since I'm just using git-bash, this setup is definitely good enough. In theory I don't even need `.profile`, but I included it anyway, but it's empty.
