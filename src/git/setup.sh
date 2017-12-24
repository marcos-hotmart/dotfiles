#!/usr/bin/env sh

# sets up a new local repo
# creates a new remote repo
# then pushes an initial commit

repo="$1"
description="$2"

if [[ -z "$repo" ]]; then
    echo "Syntax: git setup user/project"
    exit
fi

mkdir -p "$dev/$repo" && \
    cd "$dev/$repo" && \
    git init && \
    git create -d "$description" "$repo" \
    touch 'README.md' 'CHANGELOG.md' && \
    cp "$HOME/.gitignore" '.gitignore' && \
    git add "*" && git add '.gitignore' && \
    git commit -m "initial commit" && \
    git remote add origin 'git@github.com:$repo' && \
    git push -u origin master
