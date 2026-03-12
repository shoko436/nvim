-- VSCode-like editor options
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.textwidth = 110
vim.opt.colorcolumn = '110,120'
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.laststatus = 3 -- Global statusline
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.completeopt = 'menu,menuone,noinsert,preview'
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.syntax = 'on'
vim.opt.autoread = true
vim.opt.swapfile = false -- Disable swap files for better performance
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'

-- Better search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Better completion
vim.opt.pumheight = 15 -- Maximum number of entries in popup menu
vim.opt.pumblend = 10  -- Transparency for popup menu
vim.opt.winblend = 10  -- Transparency for floating windows

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = 'yes' -- Automatically adjust sign column

-- Indenting (VSCode defaults)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Title config
vim.opt.title = true
vim.opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

-- Better visual feedback
vim.opt.showmatch = true
vim.opt.matchtime = 2

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Folding (enhanced)
-- vim.opt.foldcolumn = '1'
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt.foldtext = 'v:lua.custom_fold_text()'
-- vim.opt.foldopen = 'quickfix,insert,search,tag,undo'
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 99
-- vim.opt.foldenable = true

-- Ensure fillchars includes proper characters for folds
-- vim.opt.fillchars = {
--   fold = ' ',
--   foldopen = '▾',
--   foldclose = '▸',
--   foldsep = ' ',
--   eob = ' ',
-- }

-- Custom fold text function (must be defined before setting foldtext)
function _G.custom_fold_text()
  local fs = vim.v.foldstart
  local fe = vim.v.foldend
  local line = vim.fn.getline(fs)
  local lines_count = fe - fs + 1
  local suffix = string.format(" 📦 %d lines", lines_count)
  local max_width = vim.o.columns - 10
  local fold_line = line:gsub('\t', '    '):gsub('%s+$', '')
  fold_line = fold_line:sub(1, max_width - #suffix)
  return fold_line .. suffix
end

-- Better whitespace handling
vim.opt.list = true
vim.opt.listchars = {
  tab = '→ ',
  trail = '·',
  extends = '»',
  precedes = '«',
  nbsp = '⎵',
}

-- Plugin configurations
vim.g.rcsv_delimiters = { ",", "\t" }

-- Set leader key early
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable loader cache for better performance
if vim.loader then
  vim.loader.enable()
end
