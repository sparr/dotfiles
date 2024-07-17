#!/bin/bash
# ~/.bashrc
# bash runs this script when a non-login shell is launched

# Need to set *some* prompt so we don't inherit incompatible prompts from other shells
PS1='[\u@\h \W]\$ '

# Source global definitions
# shellcheck source=/dev/null
[[ -r /etc/bashrc ]] && source /etc/bashrc

source "${HOME}/.shellrc"

# Environment-specific bash rc files
other_envs_source "${HOME}/.bashrc"
