# general options
setopt nomatch notify pipefail shwordsplit

# vi mode
bindkey -v
KEYTIMEOUT=5

# fix some keys behavior for vi mode
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-history
bindkey '^N' down-history
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char
bindkey "^U" backward-kill-line

# enable theme
source "$ZDOTDIR"/.zshtheme

# beautiful ls
alias ls='ls -hF --color=auto'
