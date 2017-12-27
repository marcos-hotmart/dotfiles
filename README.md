# dotfiles

```
src/
├── .vim        > vim config w/ plugins
├── bin         > system automation scripts
├── brew        > homebrew configuration
├── git         > global git config, aliases, and functions
├── init        > scripts for running this dotfile dir
├── macos       > macos prefs
├── node        > global npm packages
├── shell       > aliases, functions, exports
├── tmux        > terminal multiplexer config
├── vim         > vim setup scripts
└── zsh         > zsh settings and prompts
```

# usage

`setup.sh` will kick everything off for you, but i wouldn't recommend using it unless you know absolutely everything that's going on in there.

Once `setup.sh` is run and a restart has occurred, if you want `zsh` you have to change to it and source the config file

```bash
chsh -s $(which zsh)
source ~/dotfiles/zsh/.zshrc
```
