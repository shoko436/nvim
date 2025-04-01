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
  { 'folke/tokyonight.nvim' }, -- Tema estilo VSCode
  { 'Mofiqul/vscode.nvim' },
  { 'Mofiqul/dracula.nvim' },
  { 'olimorris/onedarkpro.nvim', priority = 1000, },
  {
    'svrana/neosolarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('neosolarized').setup({
        comment_italics = true,
        background_set = true,
      })
    end,
    dependencies = {
      'tjdevries/colorbuddy.nvim',
    },
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        filter = 'octagon',
        transparent_background = false,
        backgrouund_clear = { 'float_win' },
        terminal_colors = true,
        devicons = true,
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
      ensure_installed = { 'bash', 'lua', 'diff', 'regex', 'sql', 'yaml', 'vim', 'vimdoc', 'ruby', 'csv', 'rego', 'terraform' },
      highlight = {
        enable = true,
        disable = { 'qf' },
        additional_vim_regex_highlighting = { 'ruby' },
      },
    }
  },                                 -- Resaltado de sintaxis
  { 'nvim-tree/nvim-web-devicons' }, -- Iconos
  { 'onsails/lspkind.nvim' },
  { 'nvim-lualine/lualine.nvim' },   -- Barra de estado
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
  }, -- Explorador de archivos
  { 'folke/todo-comments.nvim' },
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
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
    }
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
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
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
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  -- Utils
  { 'L3MON4D3/LuaSnip' }, -- Soporte para snippets
  { 'saadparwaiz1/cmp_luasnip' },
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
})
