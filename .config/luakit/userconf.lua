local settings = require "settings"

settings.application.prefer_dark_mode = true
settings.session.always_save = true
settings.webview.enable_smooth_scrolling = true
settings.window.search_engines.wiby = "https://wiby.me/?q=%s"
settings.window.search_engines.searx = "https://search.disroot.org/?q=%s"
settings.window.search_engines.default = settings.window.search_engines.searx
