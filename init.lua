-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim options
require('config.options')

-- General mapping
require('config.mappings')

-- Autocommands
require('config.autocommands')

-- Plugins
require('config.plugins')

-- Configuration of mason
require('config.mason')

-- Configuration of theme
require('config.theme')

-- Configuration of nvim-tree
require('config.nvim-tree')

-- Configuration of telescope
require('config.telescope')

-- Configuration of gitsigns
require('config.gitsigns')

-- Configuration of LSP
require('config.lsp')

-- Configuration of nvim-cmp
require('config.nvim-cmp')

-- Configuration of LuaSnip
require('config.luasnip')

-- Configuration of formatter.nvim
require('config.formatter-nvim')

-- Configuration of indent-blankline-nvim
require('config.indent-blankline-nvim')
