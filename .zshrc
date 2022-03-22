# history settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# general options
setopt nomatch notify pipefail beep

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

# completion
zstyle :compinstall filename '${HOME}/.zshrc'
autoload -Uz compinit
compinit

# enable theme
source "$HOME"/.zshtheme

# beautiful ls
alias ls='ls -hF --color=auto'

# enable fzf if found
if [ -e /usr/share/fzf/key-bindings.zsh ]; then
	source /usr/share/fzf/key-bindings.zsh
fi
