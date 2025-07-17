local builtin = require("statuscol.builtin")
require("statuscol").setup({
  relculright = true, -- muestra números relativos a la derecha
  segments = {
    { text = { builtin.foldfunc },      click = "v:lua.StatusColToggleFold" },
    { text = { "%s" },                  click = "v:lua.ScSa" }, -- signos
    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" }, -- números de línea
  }
})

function _G.preview_fold()
  local lnum = vim.fn.line('.')
  if vim.fn.foldclosed(lnum) == -1 then return end

  local start_line = vim.fn.foldclosed(lnum)
  local end_line = vim.fn.foldclosedend(lnum)
  if start_line < 1 or end_line < start_line then return end

  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  if not lines or #lines == 0 then return end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)

  local width = math.max(20, math.floor(vim.o.columns * 0.6))
  local height = math.min(#lines, 10)

  local win = vim.api.nvim_open_win(buf, false, {
    relative = 'cursor',
    row = 1,
    col = 0,
    width = width,
    height = height,
    style = 'minimal',
    border = 'rounded',
    noautocmd = true,
    focusable = false,
  })

  -- autoclose on cursor move or after delay
  vim.api.nvim_create_autocmd({ 'CursorMoved', 'InsertEnter', 'BufLeave' }, {
    once = true,
    callback = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })

  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, 3000)
end

function _G.StatusColToggleFold()
  vim.schedule(function()
    vim.cmd("normal! za")
  end)
end
