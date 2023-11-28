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

#### Hard-coded predefined environments

Some configuration files cannot enumerate arbitrary environment files to incliude. These main config files have hard-coded lists of other environment configs that must be edited if a non-predefined environment is created.

Known such configs:
* [`.config/git/config`](.config/git/config)
* [`.ssh/config`](.ssh/config)

#### Enumerated environments

Configuration based on shell scripts, such as [`.bashrc`](.bashrc) and [`.zshrc`](.zshrc), do not rely on hard-coded predefined environment lists. They use functions from [`.funcs`](.funcs) to enumerate environments dynamically. This pattern should be followed where possible.

The enumeration functionality for custom environments (other than `common`, `work`, `local`) depend on the existence of `~/.git.foo`, which will cause configuration scripts like `~/.setup.foo` and `~/.aliases.foo` to be run at the appropriate time. While this could be an empty file, it is recommended to instead follow the [instructions below](step-by-step) to create a git repository similar to `~/.git.common`, and to version control those environment scripts in that repository.

#### Step by step

Follow these steps to set up a work environment, or similar steps for other environments:

```sh
alias git.work='git --git-dir="$HOME/.git.work"'
git.work init
git.work branch -m main
git.work config --local core.bare false

# create a remote repo to store the new environment if necessary, then:
git.work remote add origin https://foo/bar.git

cp ~/.git.common/info/exclude ~/.git.work/info/exclude
# edit ~/.git.work/info/exclude, keep and edit the template at the top, delete the rest
git.work add -f ~/.git.work/info/exclude
git.work commit -m "Initial commit. Create work environment. Template Exclude file"

# create/edit ~/.config/git/config.work with work email, name, etc
# edit ~/.git.work/info/exclude, add ! entries for ~/.config ~/.config/git ~/.config/git/config.work
git.work add ~/.config/git/config.work
git.work commit -m "Set git email and name"

# if remote repo exists
git.work push
```
