emulate sh -c 'source /etc/profile'

export VISUAL=nvim
export EDITOR=nvim
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland-egl
export SDL_VIDEODRIVER=wayland
export BEMENU_OPTS="-sicn --scrollbar 'autohide'
	-H20 -M400 -W0.3 -l16 --fn 'Terminus 10'
	--tb '#83a598' --tf '#282828'
	--fb '#b16286' --ff '#ebdbb2'
	--nb '#282828e0' --nf '#ebdbb2'
	--hb '#ebdbb2' --hf '#282828'
	--sb '#83a598' --sf '#282828'
	--scb '#282828e8' --scf '#b16286'"

# setting it in profile perfectly suits usecase (needed for theme)
export DEFAULT_USER="$(whoami)"

if [ -z "$XDG_RUNTIME_DIR" ]; then
	export XDG_RUNTIME_DIR="/tmp/$UID-runtime-dir"
	if ! [ -d "$XDG_RUNTIME_DIR" ]; then
		mkdir "$XDG_RUNTIME_DIR"
		chmod 0700 "$XDG_RUNTIME_DIR"
	fi
fi

if [ "$(tty)" = "/dev/tty1" ]; then
	if [ "$(command -v sway)" ]; then
		exec sway >/tmp/sway.log 2>&1
	fi	
	if [ "$(command -v startx)" ]; then
		exec startx
	fi
fi
