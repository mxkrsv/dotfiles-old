emulate sh -c 'source /etc/profile'

export VISUAL=nvim
export EDITOR=nvim
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland-egl
export SDL_VIDEODRIVER=wayland
export BEMENU_OPTS="-l6 -n --fn 'Terminus 10' --tb '#b8bb26' --tf '#282828' --fb
	'#cc241d' --ff '#ebdbb2' --nb '#282828e0' --nf '#ebdbb2' --hb '#fb4934' --hf
	'#282828' --sb '#83a598' --sf '#282828'"

if [ -z "$XDG_RUNTIME_DIR" ]; then
	export XDG_RUNTIME_DIR="/tmp/$UID-runtime-dir"
	if ! [ -d "$XDG_RUNTIME_DIR" ]; then
		mkdir "$XDG_RUNTIME_DIR"
		chmod 0700 "$XDG_RUNTIME_DIR"
	fi
fi
	
if [ "$(tty)" = "/dev/tty1" ]; then
	if [ "$(command -v sway)" ]; then
		exec sway
	fi	
	if [ "$(command -v startx)" ]; then
		exec startx
	fi
fi
