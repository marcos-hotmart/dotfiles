#!/usr/bin/env zsh

# uncomment to run zprof
# zmodload zsh/prof

# history
SAVE_HIST=100000

autoload -U promptinit;

# antigen
source ~/antigen/antigen.zsh

# too slow, bye 👋
# antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    git
    tmux
    command-not-found
    colored-man-pages
    heroku

    mafredri/zsh-async
    sindresorhus/pure
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-history-substring-search
    djui/alias-tips
    Seinh/git-prune
    wbinglee/zsh-wakatime
EOBUNDLES

antigen apply

# bind UP and DOWN arrow keys for history search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}

zle -N zle-line-init

# uncomment to finish profiling
# zprof

source ~/.bash_profile
