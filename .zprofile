emulate sh -c 'source /etc/profile'

export VISUAL=nvim
export EDITOR=nvim
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland-egl
export SDL_VIDEODRIVER=wayland

if test -z "${XDG_RUNTIME_DIR}"; then
	export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
	if ! test -d "${XDG_RUNTIME_DIR}"; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
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
