-- Setup statusline
vim.o.showmode = false -- Mode is already shown on lualine
local lualine_options = {
  theme = 'gruvbox',
  disabled_filetypes = {},
  always_divide_middle = true,
  icons_enabled = false
}
local lualine_icons = true
if os.getenv("TERM") == "linux" then
  lualine_icons = false
  lualine_options.component_separators = { left = '', right = '' }
  lualine_options.section_separators = { left = '', right = '' }
end -- disable powerline if on tty
require 'lualine'.setup {
  options = lualine_options,
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'branch', icons_enabled = lualine_icons }, 'diff',
      'diagnostics' },
    lualine_c = { { 'filename', path = 1, shorting_target = 0 } },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  --tabline = {
  --  lualine_a = {'buffers'},
  --  --lualine_b = {'branch'},
  --  --lualine_c = {'filename'},
  --  lualine_x = {},
  --  lualine_y = {},
  --  lualine_z = {'tabs'}
  --},
  extensions = {}
}

-- vim:et ts=2 sw=2
