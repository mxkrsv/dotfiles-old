local execute = vim.api.nvim_command

vim.highlight.on_yank = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.textwidth = 80
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.title = true

-- Setup theme
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.gruvbox_bold = true
vim.g.gruvbox_italic = false
vim.g.gruvbox_invert_selection = false
vim.g.gruvbox_contrast_dark = 'medium'
execute 'colorscheme gruvbox'
execute 'hi Normal guibg=none'

-- vim:et ts=2 sw=2
