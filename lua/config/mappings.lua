-- Set options for key mappings
local opt = { silent = true }

-- Set leader key to space
vim.g.mapleader = " "

-- Save and quit mappings
local keymap = vim.keymap.set
local function nmap(lhs, rhs, opts)
  keymap('n', lhs, rhs, opts or opt)
end

nmap('<Leader>w', ':w<CR>')   -- Save current buffer
nmap('<Leader>wa', ':wa<CR>') -- Save all buffers
nmap('<Leader>q', ':q<CR>')   -- Quit current buffer
nmap('<Leader>qa', ':qa<CR>') -- Quit all buffers

-- Insert mode mappings
keymap('i', '<C-CR>', '<Esc>') -- Press 'jj' to exit insert mode
nmap('<Leader>i', 'I')         -- Insert at beginning of line
nmap('<Leader>a', 'A')         -- Append at end of line
nmap('<Leader>o', 'O')         -- Open new line above
nmap('<Leader>g', 'G')         -- Go to end of file

-- Diagnostics
nmap('<Leader>rn', vim.lsp.buf.rename)                                -- Rename symbol
nmap('<Leader>fc', vim.lsp.buf.format)                                -- Format code
nmap('gd', vim.lsp.buf.definition, { noremap = true, silent = true }) -- Go to definition
nmap('[g', vim.diagnostic.goto_prev)                                  -- Go to previous diagnostic
nmap(']g', vim.diagnostic.goto_next)                                  -- Go to next diagnostic

-- Files finder
nmap('<Leader><Leader>n', ':NvimTreeFocus<CR>')               -- Focus NvimTree
nmap('<C-f>', ':Telescope find_files<CR>')                    -- Find files using Telescope
nmap('<Leader>f', ':Telescope live_grep<CR>')                 -- Live grep using Telescope
nmap('<Leader>/', ':Telescope current_buffer_fuzzy_find<CR>') -- Fuzzy find in current buffer using Telescope

-- Copilot
nmap('<Leader>ccp', function()
  local actions = require('CopilotChat.actions')
  require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
end, { desc = 'CopilotChat - Prompt actions' }) -- CopilotChat prompt actions
nmap('<Leader>ccw', ':CopilotChatOpen<CR>')     -- CopilotChat

-- Navigation
nmap('<C-h>', '<C-w>h') -- Move to left window
nmap('<C-j>', '<C-w>j') -- Move to bottom window
nmap('<C-k>', '<C-w>k') -- Move to top window
nmap('<C-l>', '<C-w>l') -- Move to right window

-- Moving buffers
nmap('<Leader><Leader>h', '<C-w>H') -- Move buffer to left
nmap('<Leader><Leader>j', '<C-w>J') -- Move buffer to bottom
nmap('<Leader><Leader>k', '<C-w>K') -- Move buffer to top
nmap('<Leader><Leader>l', '<C-w>L') -- Move buffer to right

-- Split windows
nmap('<Leader><Leader>s', '<C-w>s <C-w>j :Telescope find_files<CR>') -- Split window horizontally and find files
nmap('<Leader><Leader>v', '<C-w>v <C-w>l :Telescope find_files<CR>') -- Split window vertically and find files

-- Toggleterm
nmap('<Leader><Leader>t', ':ToggleTerm<CR>') -- Toggle terminal

-- Folding
nmap('<Leader>z', 'za') -- Toggle foldopen
nmap('zv', function()
  _G.preview_fold()
end)
