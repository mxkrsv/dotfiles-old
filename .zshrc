HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify pipefail beep
bindkey -v
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit

source "$HOME"/.zshtheme

alias ls='ls -hF --color=auto'

if [ -e /usr/share/fzf/key-bindings.zsh ]; then
	source /usr/share/fzf/key-bindings.zsh
fi
