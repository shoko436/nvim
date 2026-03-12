local theme = 'monokai-pro'

vim.cmd.colorscheme(theme)
vim.o.background = 'dark'

-- Enhanced UI settings for VSCode-like appearance
vim.opt.termguicolors = true
vim.opt.winblend = 10
vim.opt.pumblend = 10

-- Better split borders
vim.opt.fillchars = {
  fold = " ",
  foldopen = "▾",
  foldsep = " ",
  foldclose = "▸",
  stl = " ",
  eob = " ",
  diff = "╱",
  msgsep = "‾",
}

-- Configuration of lualine with VSCode-like setup
require('lualine').setup {
  options = {
    theme = theme,
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = ' ●',
          readonly = ' ',
          unnamed = '[No Name]',
          newfile = ' [New]',
        }
      }
    },
    lualine_x = {
      {
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return '  ' .. client.name
            end
          end
          return msg
        end,
        icon = '',
        color = { fg = '#ffffff', gui = 'bold' },
      },
      'encoding',
      'fileformat',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'nvim-tree', 'toggleterm', 'trouble'}
}
