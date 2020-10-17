# Disable loading autoconfig
config.load_autoconfig(False)
# Autosave session when qutebrowser is being closed
c.auto_save.session = True
# Darkmode settings
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.preferred_color_scheme = "dark"
#c.qt.args = ['blink-settings=forceDarkModeEnabled=true,forceDarkModeInversionAlgorithm=lightness-cielab,...']
#c.colors.webpage.darkmode.policy.images = "never"
#c.colors.webpage.darkmode.threshold.background = 100
# Disable autoplay
c.content.autoplay = False
# Source theme config file
#config.source('base16-nord.config.py')
config.source('base16-gruvbox-dark-medium.config.py')
# qute-pass bindings
config.bind('<z><l>', 'spawn --userscript qute-pass -d "wofi -S dmenu"')
config.bind('<z><u><l>', 'spawn --userscript qute-pass --username-only -d "wofi -S dmenu"')
config.bind('<z><p><l>', 'spawn --userscript qute-pass --password-only -d "wofi -S dmenu"')
config.bind('<z><o><l>', 'spawn --userscript qute-pass --otp-only -d "wofi -S dmenu"')

c.fonts.default_family = "Terminus"
c.fonts.default_size = "14px"
