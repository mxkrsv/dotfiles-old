export VISUAL=nvim
export EDITOR=nvim
export MOZ_ENABLE_WAYLAND=1
export SDL_VIDEODRIVER=wayland
export QT_QPA_PLATFORM=wayland-egl

# required for LibreOffice
export GTK_THEME="Adwaita:dark"

# setting it in profile perfectly suits usecase (needed for zsh theme)
export DEFAULT_USER="$(whoami)"
