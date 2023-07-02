# Clarence "Sparr" Risher's common dotfiles

This repo contains my dotfiles which are common across all environments.

## Setup

### Dotfiles Setup
```sh
cd ~
alias git.common='git --git-dir="$HOME/.git.common"'
git.common init
git.common branch -m main
git.common config --local core.bare false
git.common remote add origin git@github.com:sparr/dotfiles.git
git.common fetch --all
# WARNING! The following step will forcibly overwrite files in your $HOME
git.common reset --hard origin/main
git.common branch --set-upstream-to=origin/main main
```
The `git.common` alias will be created by [.aliases](.aliases) in future shells.

### Shell Setup
```sh
chsh -s /usr/bin/zsh
zsh
```

## Environment Dotfiles

The core and most novel feature of this repo is splitting configuration into multiple files based on what usage "environment" you might be working in.

The following environments are predefined and will be checked for in every config and script that is aware of this dotfiles system.
* .personal - private, belongs only on personal computers, store in a secure private repository
* .work - private, belongs only on work computers, store in a secure work repository
* .local - specific to one machine, store in a local repository

For configs with static include lists, such as `~/.config/git/config` and `~/.ssh/config`, additional entries must be added manually for new environments.

For configs implemented as scripts, such as all of the bash and zsh configs, additional enviroments will be enumerated if `~/.git.ENVNAME` exists, similar to the `~/.git.common` created during setup. This is handled by functions in [.funcs](.funcs).

## Usage

### Add a new file to a dotfiles repo
1. Edit `~/.git.ENV/info/exclude` to un-exclude the new file and any directories above it.
2. `git.ENV add` the new file and `~/.git.ENV/info/exclude`
3. `git.ENV commit`
4. `git.ENV push`

### Pushing changes to files
1. `git.ENV add` for the new/modified file(s)
2. `git.ENV commit`
3. `git.ENV push`

### Operate on all environments
The `git.all` alias will run a git command in every environment. `git.all status` is safe and useful. Non-read-only operations like `git.all commit -a` or `git.all push` should be used carefully.

### Create a new environment

#### Predefined

Adding `~/.config/git/config.foo` or `~/.ssh/config.foo` or similar, where the main configuration only knows about the predefined environments, requires editing the main config to include the new file. No script or hook yet exists to automate adding these.

#### Enumerated

Enumerated environments depend on the existence of `~/.git.foo`, which will cause configuration scripts like `~/.setup.foo` and `~/.aliases.foo` to be run at the appropriate time. While this could be an empty file, it is recommended to instead make it a git repository created similarly to `~/.git.common` earlier in the setup step, and to version control those `foo`-environment scripts in that repository.