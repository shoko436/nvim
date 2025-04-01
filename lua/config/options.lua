-- enable 24-bit colour
vim.opt.termguicolors = true -- enable 24-bit colour
vim.o.scrolloff = 8
vim.o.textwidth = 110
vim.o.colorcolumn = '110,120'
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.laststatus = 2
vim.o.showmode = false
vim.o.cursorline = true
vim.o.completeopt = 'menu,menuone,noselect,noinsert,popup'
vim.o.smartcase = true
vim.o.syntax = 'on'

-- numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2

-- indenting
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- title config
vim.o.title = true
vim.o.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

-- folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldcolumn = '0'
vim.o.foldtext = ''
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldnestmax = 4 -- only allow 4 nested folds

-- plugins
vim.g.rcsv_delimiters = { ",", "\t" }
