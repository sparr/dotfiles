#!/bin/bash

# .bashrc
# bash runs this script when a non-login shell is launched

# Need to set *some* prompt so we don't inherit incompatible prompts from other shells
PS1='[\u@\h \W]\$ '

# Source global definitions
if [ -f /etc/bashrc ]; then
	# shellcheck source=/dev/null
	. /etc/bashrc
fi

source "$HOME/.shellrc"

# Environment-specific bash rc files
other_envs_source "$HOME/.bashrc"

# Set up installed completion scripts
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

