require "user.config"
require "user.lsp"
require "user.treesitter"
require "user.neorg"
require "user.cmp"
require "user.plugins"

-- Style
vim.cmd('colorscheme gruvbox')
require('lualine').setup{
  options = { theme = 'gruvbox' }
}


