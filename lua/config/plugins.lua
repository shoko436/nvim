-- Load Lazy.nvim if it's not installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Themes
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        filter = 'pro'
      })
    end
  },

  -- UI
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      auto_install = true,
      ensure_installed = { 'bash', 'lua', 'diff', 'regex', 'sql', 'yaml', 'vim', 'vimdoc', 'ruby', 'csv', 'terraform', 'go', 'gowork', 'gomod', 'gosum' },
      highlight = {
        enable = true,
        disable = { 'qf' },
        additional_vim_regex_highlighting = { 'ruby' },
      },
      fold = {
        enable = true,
      },
    }
  },                                               -- Resaltado de sintaxis
  { 'nvim-tree/nvim-web-devicons', priority = 1000 },               -- Iconos
  { 'nvim-lualine/lualine.nvim' },                 -- Barra de estado
  -- { 'luukvbaal/statuscol.nvim' },
  { 'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  }, -- Explorador de archivos
  { 'folke/twilight.nvim',        opts = {}, },
  { 'folke/todo-comments.nvim' },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
      'MunifTanjim/nui.nvim',
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }, -- Búsqueda avanzada

  -- LSP and completion
  {
    'RRethy/nvim-treesitter-endwise',
    event = 'InsertEnter',
    config = function()
      require("nvim-treesitter.configs").setup({
        endwise = {
          enable = true,
        },
      })
    end,
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'neovim/nvim-lspconfig' },
  { 'onsails/lspkind.nvim' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'rafamadriz/friendly-snippets' },

  -- Additional LSP enhancements for VSCode-like experience
  { 'nvimdev/lspsaga.nvim', event = 'LspAttach' },
  { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'ray-x/lsp_signature.nvim' },
  { 'j-hui/fidget.nvim', opts = {} },
  {
    'zbirenbaum/copilot-cmp',
    event = 'InsertEnter',
    config = function()
      require('copilot_cmp').setup()
    end,
    dependencies = {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      config = function()
        require('copilot').setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end
    }
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      mappings = {
        reset = {
          normal = '<C-r>',
          insert = '<C-r>'
        },
      }
    },
  },

  -- Utils
  { 'echasnovski/mini.nvim',      version = '*' },
  { 'windwp/nvim-autopairs',      event = 'InsertEnter', config = true },
  { 'mhartington/formatter.nvim', lazy = false },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end
  },
  { 'lewis6991/gitsigns.nvim' },
  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_pipe',
      'rfc_csv',
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
    }
  },

  -- VSCode-like enhancements
  { 'tpope/vim-commentary' }, -- For commenting (gc, gcc)
  { 'mg979/vim-visual-multi', branch = 'master' }, -- Multiple cursors like VSCode
  {
    'nvim-pack/nvim-spectre', -- Search and replace panel
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'akinsho/bufferline.nvim', -- VSCode-like tabs
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup{
        options = {
          mode = "buffers",
          themable = true,
          separator_style = "slant",
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true
            }
          },
        }
      }
    end
  },
  {
    'rcarriga/nvim-notify', -- Better notifications
    config = function()
      vim.notify = require("notify")
      require("notify").setup({
        background_colour = "#000000",
      })
    end
  },
  {
    'stevearc/dressing.nvim', -- Better vim.ui interfaces
    config = function()
      require('dressing').setup()
    end
  },
})
