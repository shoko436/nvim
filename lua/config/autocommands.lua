vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").find_files()
    end
  end,
})

vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile", "BufWinEnter", "WinEnter"}, {
  desc = "Setup fold text for all windows",
  pattern = "*",
  callback = function()
    -- Skip for special buffers
    if vim.bo.buftype ~= '' then
      return
    end

    -- Set custom fold text (window-local option)
    vim.wo.foldtext = 'v:lua.custom_fold_text()'

    -- Refresh folds if using treesitter
    if vim.wo.foldmethod == 'expr' and (vim.wo.foldexpr or ""):find('treesitter') then
      vim.schedule(function()
        vim.cmd('silent! normal! zX')
      end)
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Auto format on save for supported files",
  group = vim.api.nvim_create_augroup("_local_auto_format", { clear = true }),
  pattern = "*",
  callback = function()
    -- Only format if there's an active LSP client that supports formatting
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    local has_formatter = false

    for _, client in ipairs(clients) do
      if client.server_capabilities.documentFormattingProvider then
        has_formatter = true
        break
      end
    end

    if has_formatter then
      vim.lsp.buf.format({ async = false })
    end

    vim.diagnostic.setloclist({ open = false })
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Refresh folds after saving",
  pattern = "*",
  callback = function()
    -- Force refresh of treesitter folds
    local foldmethod = vim.wo.foldmethod
    local foldexpr = vim.wo.foldexpr or ""

    if foldmethod == 'expr' and foldexpr:find('treesitter') then
      vim.schedule(function()
        -- Simply refresh folds without resetting foldmethod
        -- This preserves all fold settings including foldtext
        vim.cmd('normal! zX')  -- Update folds without changing settings
      end)
    else
      vim.cmd("silent! normal! zx")
    end
  end,
})
