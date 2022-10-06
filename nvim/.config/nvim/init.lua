require "user.config"
require "user.lsp"
require "user.treesitter"
require "user.telescope"
require "user.neorg"
require "user.cmp"
require "user.plugins"

-- Style
local status_ok, _ = pcall(require, "gruvbox")
if not status_ok then
  return
end

vim.cmd('colorscheme gruvbox')
require('lualine').setup{
  options = { theme = 'gruvbox' }
}


