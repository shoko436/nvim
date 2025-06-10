-- enable 24-bit colour
vim.opt.termguicolors = true -- enable 24-bit colour
vim.o.scrolloff = 8
vim.o.textwidth = 110
vim.o.colorcolumn = '110,120'
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.laststatus = 2
vim.o.showmode = false
vim.o.cursorline = true
vim.o.completeopt = 'menu,menuone,noinsert,preview'
vim.o.smartcase = true
vim.o.syntax = 'on'
vim.o.autoread = true
vim.o.swapfile = true
vim.o.backup = false

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
vim.o.foldcolumn = '1'                             -- Columna de plegado
vim.o.foldmethod = 'expr'                          -- Método de plegado basado en sintaxis
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'      -- Usar Treesitter para plegar
vim.o.foldtext = 'v:lua.custom_fold_text()'        -- Función personalizada para el texto del plegado
vim.o.foldopen = 'quickfix,insert,search,tag,undo' -- Métodos de apertura de plegados
vim.o.foldlevel = 99                               -- Para que no esté colapsado por defecto
vim.o.foldlevelstart = 99                          -- Para que no esté colapsado por defecto
vim.o.foldenable = true
vim.opt.fillchars = {
  fold = ' ',
  foldopen = '',
  foldclose = '',
  foldsep = ' ',
  eob = ' ',
}

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

-- plugins
vim.g.rcsv_delimiters = { ",", "\t" }
