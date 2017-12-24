#!/usr/bin/env bash

# load all the dotfiles
for file in ./.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file";
done;
unset file;