# Remove LSP warnings
from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer
config: ConfigAPI = config
c: ConfigContainer = c
# from qutebrowser.api import interceptor

# Disable loading autoconfig
config.load_autoconfig(False)

# Autosave session when qutebrowser is being closed
c.auto_save.session = True

# Darkmode settings
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.preferred_color_scheme = "dark"
# c.colors.webpage.darkmode.policy.images = "never"
# c.colors.webpage.darkmode.threshold.background = 100

# Disable autoplay
c.content.autoplay = False

# Source theme config file
config.source('base16-gruvbox-dark-medium.config.py')

# qute-pass bindings
basecmd = 'spawn --userscript qute-pass -M gopass -d "bemenu -p pass"'
config.bind('<z><l>', basecmd)
config.bind('<z><u><l>', basecmd + ' --username-only')
config.bind('<z><p><l>', basecmd + ' --password-only')
config.bind('<z><o><l>', basecmd + ' --otp-only')

# Font
c.fonts.default_family = "Terminus"
c.fonts.default_size = "14px"
