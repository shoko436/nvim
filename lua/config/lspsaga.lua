-- LSP Saga for better LSP UI (VSCode-like)
require('lspsaga').setup({
  ui = {
    theme = 'round',
    border = 'rounded',
    winblend = 10,
    expand = '',
    collapse = '',
    preview = ' ',
    code_action = '💡',
    diagnostic = '🐞',
    incoming = ' ',
    outgoing = ' ',
    hover = ' ',
    kind = {},
  },
  hover = {
    max_width = 0.6,
    open_link = 'gx',
    open_browser = '!open',
  },
  diagnostic = {
    on_insert = false,
    on_insert_follow = false,
    insert_winblend = 0,
    show_virt_line = true,
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    max_width = 0.7,
    custom_fix = nil,
    custom_msg = nil,
    text_hl_follow = false,
    border_follow = true,
    keys = {
      exec_action = 'o',
      quit = 'q',
      go_action = 'g'
    },
  },
  code_action = {
    num_shortcut = true,
    show_server_name = false,
    extend_gitsigns = true,
    keys = {
      quit = 'q',
      exec = '<CR>',
    },
  },
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
  request_timeout = 2000,
  finder = {
    edit = { 'o', '<CR>' },
    vsplit = 's',
    split = 'i',
    tabe = 't',
    quit = { 'q', '<ESC>' },
  },
  definition = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
  },
  rename = {
    quit = '<C-c>',
    exec = '<CR>',
  },
  symbol_in_winbar = {
    enable = true,
    separator = '  ',
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
  outline = {
    win_position = 'right',
    win_with = '',
    win_width = 30,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = 'o',
      expand_collapse = 'u',
      quit = 'q',
    },
  },
  callhierarchy = {
    show_detail = false,
    keys = {
      edit = 'e',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      jump = 'o',
      quit = 'q',
      expand_collapse = 'u',
    },
  },
  beacon = {
    enable = true,
    frequency = 7,
  },
})

-- Key mappings for Lspsaga
vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>')
vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>')
vim.keymap.set('n', '<leader>pd', '<cmd>Lspsaga peek_definition<CR>')
vim.keymap.set('n', '<leader>gd', '<cmd>Lspsaga goto_definition<CR>')
vim.keymap.set('n', '<leader>pt', '<cmd>Lspsaga peek_type_definition<CR>')
vim.keymap.set('n', '<leader>gt', '<cmd>Lspsaga goto_type_definition<CR>')
vim.keymap.set('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>')
vim.keymap.set('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>')
vim.keymap.set('n', '<leader>sw', '<cmd>Lspsaga show_workspace_diagnostics<CR>')
vim.keymap.set('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
vim.keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
vim.keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', '[E', function()
  require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set('n', ']E', function()
  require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
vim.keymap.set('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>')
vim.keymap.set('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>')
vim.keymap.set('n', '<A-d>', '<cmd>Lspsaga term_toggle<CR>')
