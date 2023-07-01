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

# Environment-specific zsh rc files
envs_source "$HOME/.zshrc"

# deduplicate the path
typeset -U path