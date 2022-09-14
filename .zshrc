# This script provides functions to run environment-specific variants of other scripts
source ~/.funcs

# Scripts that need to be run prior to anything else
envs_source ~/.setup

# Separate files for easier management and use in multiple shells
envs_source ~/.aliases
envs_source ~/.path
