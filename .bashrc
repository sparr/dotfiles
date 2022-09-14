# .bashrc
# bash runs this script when a non-login shell is launched

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# This script provides functions to run environment-specific variants of other scripts
. ~/.funcs

# User specific aliases and functions
envs_source "~/.path"
envs_source "~/.aliases"