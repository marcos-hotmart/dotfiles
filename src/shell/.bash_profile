#!/usr/bin/env bash

# load all the dotfiles
for file in ./.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file";
done;
unset file;

# setup z
zpath="$(brew --prefix)/etc/profile.d/z.sh"
[ -s $zpath ] && source $zpath;

# enable thefuck
eval $(thefuck --alias fuck)
