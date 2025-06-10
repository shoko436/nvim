local builtin = require("statuscol.builtin")
require("statuscol").setup({
  relculright = true,                                                       -- muestra números relativos a la derecha
  segments = {
    { text = { builtin.foldfunc },      click = "v:lua.PreviewFoldClick" }, -- plegado
    { text = { "%s" },                  click = "v:lua.ScSa" },             -- signos
    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },             -- números de línea
  }
})

function _G.preview_fold()
  local lnum = vim.fn.line('.')
  if vim.fn.foldclosed(lnum) == -1 then return end

  local start_line = vim.fn.foldclosed(lnum)
  local end_line = vim.fn.foldclosedend(lnum)
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local win_width = math.max(vim.api.nvim_win_get_width(0) - 10, 20)
  local win_height = math.min(#lines, 15)

  local win_opts = {
    relative = "cursor",
    row = 1,
    col = 0,
    width = win_width,
    height = win_height,
    style = "minimal",
    border = "rounded",
    focusable = false,
    noautocmd = true,
  }

  local win = vim.api.nvim_open_win(buf, false, win_opts)

  -- Cerrar automáticamente después de 2 segundos o al mover el cursor
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, 2000)

  vim.api.nvim_create_autocmd({ "CursorMoved", "BufLeave" }, {
    once = true,
    callback = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })
end

function _G.PreviewFoldClick(_, lnum, _, _)
  vim.fn.cursor(lnum, 1)
  _G.preview_fold()
end
