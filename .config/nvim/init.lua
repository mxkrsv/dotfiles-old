---- General options

vim.highlight.on_yank = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.textwidth = 80
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.title = true
vim.o.scrolloff = 3
vim.o.termguicolors = true
vim.o.background = "dark"

---- Theme configuration

require("gruvbox").setup({
	transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")

---- Completion configuration

vim.o.completeopt = 'menu,menuone,noselect'

local luasnip = require 'luasnip'
local cmp = require 'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
    },
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  }, {
    { name = 'buffer' },
    { name = 'path' }
  })
})

---- LSP configuration

local lspconfig = require 'lspconfig'
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'gopls', 'pylsp', 'rust_analyzer' }
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

-- Setup some servers specifically
lspconfig['texlab'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    texlab = {
      build = {
        onSave = true,
        forwardSearchAfter = true,
        args = { '-lualatex' },
      },
      forwardSearch = {
        executable = 'zathura',
        args = { '%p', '--synctex-forward=%l:1:%f' },
      },
      chktex = {
        onOpenAndSave = true,
      },
      latexindent = {
        modifyLineBreaks = true,
      },
    }
  }
}

if string.find(vim.api.nvim_buf_get_name(0), 'nvim') then
  lspconfig['sumneko_lua'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'os', 'pairs', 'string' }
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true)
        }
      }
    }
  }
else
  lspconfig['sumneko_lua'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'string' }
        }
      }
    }
  }
end

---- Statusline configuration

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

---- Tree-sitter configuration

require 'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  --indent = { enable = true }
}

-- Setup folding based on treesitter
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldnestmax = 1

---- packer.nvim magic hotplug

local function safe_require(module_name)
  local status_ok, module = pcall(require, module_name)
  if not status_ok then
    do return end
  end
  return module
end

local packer = safe_require 'packer'

if packer ~= nil then
  packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Theme
    use "ellisonleao/gruvbox.nvim"
    -- Nvim lsp configurations
    use 'neovim/nvim-lspconfig'
    -- Nvim treesitter configurations
    use 'nvim-treesitter/nvim-treesitter'
    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    -- Snippets
    use 'L3MON4D3/LuaSnip'
    -- Statusline
    use 'nvim-lualine/lualine.nvim'
  end)
end


-- vim:et ts=2 sw=2
