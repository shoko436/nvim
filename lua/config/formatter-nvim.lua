-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    ruby = {
      require("formatter.filetypes.ruby").rubocop,
    },
    terraform = {
      require("formatter.filetypes.terraform").terraformfmt,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})
