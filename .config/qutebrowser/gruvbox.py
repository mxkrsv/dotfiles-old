# base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
# Base16 qutebrowser template by theova
# Gruvbox dark, medium scheme by Dawid Kurek (dawikur@gmail.com), morhetz
# (https://github.com/morhetz/gruvbox)
# Modified by Maxim Karasev (git.sr.ht/~begs/dotfiles)

fg0 = "#fbf1c7"
fg = '#ebdbb2'
fg3 = "#bdae93"
bg = '#282828'
bg1 = '#3c3836'
bg2 = "#504945"
bg3 = "#665c54"
brred = "#fb4934"
brgreen = "#b8bb26"
bryellow = "#fabd2f"
brblue = "#83a598"
brpurple = "#d3869b"
braqua = "#8ec07c"
blue = "#458588"
green = "#98971a"
purple = "#b16286"
orange = "#d65d0e"
red = "#cc241d"
aqua = "#689d6a"
gray = "#a89984"

# Set qutebrowser colors

c.colors.completion.fg = fg
c.colors.completion.odd.bg = bg1
c.colors.completion.even.bg = bg
c.colors.completion.category.fg = bryellow
c.colors.completion.category.bg = bg
c.colors.completion.category.border.top = bg
c.colors.completion.category.border.bottom = bg
c.colors.completion.item.selected.fg = bg
c.colors.completion.item.selected.bg = fg
c.colors.completion.item.selected.border.top = fg
c.colors.completion.item.selected.border.bottom = fg
c.colors.completion.item.selected.match.fg = green
c.colors.completion.match.fg = brgreen
c.colors.completion.scrollbar.fg = fg
c.colors.completion.scrollbar.bg = bg

c.colors.contextmenu.disabled.bg = bg1
c.colors.contextmenu.disabled.fg = fg3
c.colors.contextmenu.menu.bg = bg
c.colors.contextmenu.menu.fg = fg
c.colors.contextmenu.selected.bg = bg2
c.colors.contextmenu.selected.fg = fg

c.colors.downloads.bar.bg = bg
c.colors.downloads.start.fg = bg
c.colors.downloads.start.bg = brblue
c.colors.downloads.stop.fg = bg
c.colors.downloads.stop.bg = braqua
c.colors.downloads.error.fg = brred

c.colors.hints.fg = bg
c.colors.hints.bg = bryellow
c.colors.hints.match.fg = fg

c.colors.keyhint.fg = fg
c.colors.keyhint.suffix.fg = fg
c.colors.keyhint.bg = bg

c.colors.messages.error.fg = bg
c.colors.messages.error.bg = brred
c.colors.messages.error.border = brred
c.colors.messages.warning.fg = bg
c.colors.messages.warning.bg = brpurple
c.colors.messages.warning.border = brpurple
c.colors.messages.info.fg = fg
c.colors.messages.info.bg = bg
c.colors.messages.info.border = bg

c.colors.prompts.fg = fg
c.colors.prompts.border = f"1px solid {bg2}"
c.colors.prompts.bg = bg
c.colors.prompts.selected.bg = bg2
c.colors.prompts.selected.fg = fg

c.colors.statusbar.normal.fg = brgreen
c.colors.statusbar.normal.bg = bg
c.colors.statusbar.insert.fg = fg
c.colors.statusbar.insert.bg = purple
c.colors.statusbar.passthrough.fg = fg
c.colors.statusbar.passthrough.bg = bg2
c.colors.statusbar.private.fg = bg
c.colors.statusbar.private.bg = bg1
c.colors.statusbar.command.fg = fg
c.colors.statusbar.command.bg = bg
c.colors.statusbar.command.private.fg = fg
c.colors.statusbar.command.private.bg = bg
c.colors.statusbar.caret.fg = fg
c.colors.statusbar.caret.bg = red
c.colors.statusbar.caret.selection.fg = fg
c.colors.statusbar.caret.selection.bg = orange
c.colors.statusbar.progress.bg = brblue
c.colors.statusbar.url.fg = fg
c.colors.statusbar.url.error.fg = brred
c.colors.statusbar.url.hover.fg = fg
c.colors.statusbar.url.success.http.fg = braqua
c.colors.statusbar.url.success.https.fg = bryellow
c.colors.statusbar.url.warn.fg = brpurple

c.colors.tabs.bar.bg = bg
c.colors.tabs.indicator.start = purple
c.colors.tabs.indicator.stop = green
c.colors.tabs.indicator.error = brred
c.colors.tabs.odd.fg = fg
c.colors.tabs.odd.bg = bg1
c.colors.tabs.even.fg = fg
c.colors.tabs.even.bg = bg
c.colors.tabs.pinned.even.fg = fg0
c.colors.tabs.pinned.even.bg = bg2
c.colors.tabs.pinned.odd.fg = fg0
c.colors.tabs.pinned.odd.bg = bg3
c.colors.tabs.pinned.selected.even.fg = bg
c.colors.tabs.pinned.selected.even.bg = fg
c.colors.tabs.pinned.selected.odd.fg = bg
c.colors.tabs.pinned.selected.odd.bg = fg
c.colors.tabs.selected.odd.fg = bg
c.colors.tabs.selected.odd.bg = fg
c.colors.tabs.selected.even.fg = bg
c.colors.tabs.selected.even.bg = fg

# Not always wanted
# c.colors.webpage.bg = bg
