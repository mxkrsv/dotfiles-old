# general options
setopt nomatch notify pipefail shwordsplit

# vi mode
bindkey -v
KEYTIMEOUT=5

# fix some keys behavior for vi mode
bindkey  "^[[H" beginning-of-line
bindkey  "^[[F" end-of-line
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

# enable colors
autoload -Uz colors && colors

# default black comments are invisible on black bg
ZSH_HIGHLIGHT_STYLES[comment]=fg=cyan,bold

# default command requires findutils
FZF_ALT_C_COMMAND="find -L . -mindepth 1 -type d -print 2>/dev/null | cut -b3-"

# fzf-tab setup
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -hAF --color=always "$realpath"'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# default ZLS_COLORS needed for fzf-tab
zstyle ':completion:*' list-colors 'no=00' 'fi=00' 'di=01;34' 'ln=01;36' \
	'pi=40;33' 'so=01;35' 'bd=40;33;01' 'cd=40;33;01' 'ex=01;32' 'lc=\e[' \
	'rm=m' 'tc=00' 'sp=00' 'ma=07' 'hi=00' 'du=00'
