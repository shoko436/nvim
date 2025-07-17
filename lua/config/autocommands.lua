vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").find_files()
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Auto format on save and show LSP diagnostics",
  group = vim.api.nvim_create_augroup("_local_auto_format", { clear = true }),
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
    vim.diagnostic.setloclist({ open = false })
  end,
})

vim.api.nvim_create_autocmd("TextChanged", {
  desc = "Redraw folds on text change",
  pattern = "*",
  callback = function()
    vim.cmd("silent! normal! zx")
  end,
})
