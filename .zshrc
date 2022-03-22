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
source "$HOME"/.zshtheme

# beautiful ls
alias ls='ls -hF --color=auto'

# enable some plugins if found
local plugins="/usr/share/fzf/key-bindings.zsh"
for plugin in zsh-syntax-highlighting zsh-autosuggestions; do
	plugins="$plugins /usr/share/zsh/plugins/$plugin/$plugin.zsh"
done
for plugin in $plugins; do
	if [ -e $plugin ]; then
		source $plugin
	fi
done
