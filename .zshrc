#!/usr/bin/zsh

# This script provides functions to run environment-specific variants of other scripts
source "$HOME/.funcs"

# Scripts that need to be run prior to anything else
envs_source "$HOME/.setup"

# Environment variables
envs_source "$HOME/.env"

# Separate files for easier management and use in multiple shells
envs_source "$HOME/.aliases"
envs_source "$HOME/.path"

# deduplicate the path
typeset -U path

# set the prompt
export PROMPT="
%{%F{white}%}(%D{%Y-%m-%d} %*) <%?> [%3~] $program %{%F{default}%}
%{%F{cyan}%}%m %#%{%F{default}%} "

# no right-aligned prompt
export RPROMPT=

# set the gui terminal title
# https://tldp.org/HOWTO/Xterm-Title-3.html
set-xterm-title() {
    echo -e "\e]0;$*\007"
}

# "alias" to change window title when ssh'ing to another host
ssh() {
    set-xterm-title $*;
    /usr/bin/ssh -2 $*;
    set-xterm-title $HOST;
}

# zsh auto completion initialization
autoload -Uz compinit && compinit -i

# https://github.com/nvbn/thefuck#experimental-instant-mode
if command -v thefuck &> /dev/null
then
    eval $(thefuck --alias --enable-experimental-instant-mode)
fi

# makes color constants available
autoload -U colors
colors

# command history
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line