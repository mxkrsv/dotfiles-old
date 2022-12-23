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
