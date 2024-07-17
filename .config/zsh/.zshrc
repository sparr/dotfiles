#!/usr/bin/zsh

source "${HOME}/.shellrc"

# Environment-specific zsh rc files
other_envs_source "${ZDOTDIR:-${HOME}}/.zshrc"

# deduplicate the path
typeset -U path
