local theme = 'monokai-pro'

vim.cmd.colorscheme(theme)
vim.o.background = 'dark'

-- Configuration of lualine
require('lualine').setup {
  options = { theme = theme },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    }
  }
}
