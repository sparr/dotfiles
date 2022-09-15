# Clarence "Sparr" Risher's common dotfiles

This repo contains my dotfiles which are common across all environments.

## Setup

```bash
cd ~
alias git.common="git --git-dir=\"$HOME/.git.common\""
git.common init
git.common branch -m main
git.common config --local core.bare false
git.common remote add origin git@github.com:sparr/dotfiles.git
git.common fetch --all
git.common branch --set-upstream-to=origin/main main
# the following step will forcibly overwrite files in your home
git.common reset --hard origin/master
```
The `git.common` alias will be created by [.aliases](.aliases) in future shells.

## Environment Dotfiles

Some configuration files and scripts in this repo will include additional optional files as follows:
* .personal - private, belongs only on personal computers, store in a secure private repository
* .work - private, belongs only on work computers, store in a secure work repository
* .local - specific to one machine, probably not stored in a repository

e.g. [.bashrc](.bashrc) uses [.funcs](.funcs) to source [.aliases](.aliases), `.aliases.personal`, etc, and [.config/git/config](.config/git/config) has an `[include]` section referring to `.config/git/config.work`, etc.

If you clone environmental dotfiles repos `~/.git.*` then [.aliases](.aliases) will create matching `git.*` aliases.