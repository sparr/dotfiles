# This script provides functions to run environment-specific variants of other scripts
source ~/.funcs

# Scripts that need to be run prior to anything else
envs_source ~/.setup

# Separate files for easier management and use in multiple shells
envs_source ~/.aliases
envs_source ~/.path

# deduplicate the path
typeset -U path

#???
export AUTO_TITLE_SCREENS="NO"

#???
export PROMPT="
%{$fg[white]%}(%D %*) <%?> [%~] $program %{$fg[default]%}
%{$fg[cyan]%}%m %#%{$fg[default]%} "

#???
export RPROMPT=

#???
set-title() {
    echo -e "\e]0;$*\007"
}

#???
ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

# zsh auto completion initialization
autoload -Uz compinit && compinit -i

# https://github.com/nvbn/thefuck#experimental-instant-mode
eval $(thefuck --alias --enable-experimental-instant-mode)
