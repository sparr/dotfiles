#!/bin/bash
# ~/.bash_profile
# bash runs this script when a login shell is launched

# This script provides functions to run environment-specific variants of other scripts
. "${HOME}"/.funcs

# run the non-login shell startup script(s)
envs_source "${HOME}/.bashrc"
