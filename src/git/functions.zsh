#!/usr/bin/env zsh

# source utils
cd "$(dirname "$0")" \
    && . "../utils/helpers.sh"

# clone a repo, cd into it, install
gcl() {
    git clone --depth=1 $1
    cd $(basename ${1%.*})
    yarn install
}

# list git branches all pretty
branches() {
  for branch in $(git branch | sed s/^..//); do
    time_ago=$(git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $branch --);
    # Add emoji to mark upstream tracking
    tracks_upstream=$(if ["$(git rev-parse $branch@{upstream} 2>/dev/null)"]; then printf "✨"; fi);
    printf "%-53s - %s %s\n" $time_ago $branch $tracks_upstream;
  done | sort;
}

# use git's colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
  diff() {
    git diff --no-index --color-words "$@";
  }
fi;

# undo push
undopush() {
  BRANCHNAME=$1

  git push -f origin HEAD^:$1
}

# git commit browser
# requires fzf
log() {
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
    --bind "ctrl-m:execute:
      echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
      xargs -I % sh -c 'git show --color=always % | less -R'"
}

# find commits by commit message
git-cm = "!f() { \
    git log --pretty=custom --decorate --date=short --grep=\"$1\"; \
}; f"

# List remote branches.
lrb = "!f() { \
    remote="${1:-origin}"; \
    git ls-remote --heads "$remote"; \
}; f"

# use gitignore.io cmd line tool
gi() {
    curl -L -s https://www.gitignore.io/api/$@ ;
}