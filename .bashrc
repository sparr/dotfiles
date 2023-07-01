#!/bin/bash

# .bashrc
# bash runs this script when a non-login shell is launched

# Source global definitions
if [ -f /etc/bashrc ]; then
	# shellcheck source=/dev/null
	. /etc/bashrc
fi

# This script provides functions to run environment-specific variants of other scripts
source "$HOME/.funcs"

# Separate files for easier management and use in multiple shells
envs_source "$HOME/.path"
envs_source "$HOME/.aliases"

# Need to set *some* prompt so we don't inherit incompatible prompts from other shells
PROMPT_COMMAND='PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'

# Set up installed completion scripts
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

