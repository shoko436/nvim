-- Enhanced formatter configuration for multiple languages
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    -- Ruby
    ruby = {
      require("formatter.filetypes.ruby").rubocop,
    },

    -- Go
    go = {
      require("formatter.filetypes.go").gofmt,
      require("formatter.filetypes.go").goimports,
    },

    -- Terraform
    terraform = {
      require("formatter.filetypes.terraform").terraformfmt,
    },

    -- YAML
    yaml = {
      require("formatter.filetypes.yaml").prettier,
    },

    -- JSON
    json = {
      require("formatter.filetypes.json").prettier,
    },

    -- JavaScript/TypeScript
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },

    -- HTML/CSS
    html = {
      require("formatter.filetypes.html").prettier,
    },
    css = {
      require("formatter.filetypes.css").prettier,
    },

    -- Python
    python = {
      require("formatter.filetypes.python").black,
      require("formatter.filetypes.python").isort,
    },

    -- Lua
    lua = {
      require("formatter.filetypes.lua").stylua,
    },

    -- SQL
    sql = {
      function()
        return {
          exe = "sql-formatter",
          args = { "--language", "postgresql" },
          stdin = true,
        }
      end
    },

    -- Markdown
    markdown = {
      require("formatter.filetypes.markdown").prettier,
    },

    -- Remove trailing whitespace for all files
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})

-- Auto-format on save for supported filetypes
vim.api.nvim_create_augroup("FormatAutogroup", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "FormatAutogroup",
  pattern = {
    "*.rb", "*.go", "*.tf", "*.yml", "*.yaml", "*.json",
    "*.js", "*.ts", "*.html", "*.css", "*.py", "*.lua",
    "*.sql", "*.md"
  },
  command = "FormatWrite",
})
