-- VSCode-like key mappings
local opt = { silent = true }
local keymap = vim.keymap.set

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function nmap(lhs, rhs, opts)
  keymap('n', lhs, rhs, opts or opt)
end

local function imap(lhs, rhs, opts)
  keymap('i', lhs, rhs, opts or opt)
end

local function vmap(lhs, rhs, opts)
  keymap('v', lhs, rhs, opts or opt)
end

-- =============================
-- VSCode-like File Operations
-- =============================
nmap('<C-s>', ':w<CR>')                       -- Save file (Ctrl+S)
imap('<C-s>', '<Esc>:w<CR>a')                 -- Save file in insert mode
nmap('<C-S-s>', ':wa<CR>')                    -- Save all files (Ctrl+Shift+S)
nmap('<C-w>', ':bdelete<CR>')                 -- Close current buffer (VSCode-like)
nmap('<C-S-w>', ':qa<CR>')                    -- Close all buffers
nmap('<C-n>', ':enew<CR>')                    -- New file (Ctrl+N)
-- nmap('<C-o>', ':Telescope find_files<CR>')    -- Open file (Ctrl+O)
nmap('<C-Tab>', ':BufferLineCycleNext<CR>')   -- Next buffer (Ctrl+Tab)
nmap('<C-S-Tab>', ':BufferLineCyclePrev<CR>') -- Previous buffer (Ctrl+Shift+Tab)

-- =============================
-- VSCode-like Navigation
-- =============================
nmap('<C-p>', ':Telescope find_files<CR>')                    -- Quick Open (Ctrl+P)
nmap('<C-S-p>', ':Telescope commands<CR>')                    -- Command Palette (Ctrl+Shift+P)
nmap('<C-f>', ':Telescope live_grep<CR>')                     -- Find in Files (Ctrl+F)
nmap('<C-S-f>', ':Telescope current_buffer_fuzzy_find<CR>')   -- Find in current file (Ctrl+Shift+F)
nmap('<C-g>', ':Telescope lsp_document_symbols<CR>')          -- Go to symbol (Ctrl+G)
nmap('<C-S-g>', ':Telescope lsp_workspace_symbols<CR>')       -- Go to symbol in workspace
nmap('<C-t>', ':tabnew<CR>')                                  -- New tab (Ctrl+T)
nmap('<C-S-t>', ':tabclose<CR>')                              -- Close tab

-- =============================
-- VSCode-like Editing
-- =============================
nmap('<C-z>', 'u')                        -- Undo (Ctrl+Z)
nmap('<C-S-z>', '<C-r>')                  -- Redo (Ctrl+Shift+Z)
nmap('<C-a>', 'ggVG')                     -- Select all (Ctrl+A)
vmap('<C-c>', '"+y')                      -- Copy (Ctrl+C)
nmap('<C-v>', '"+p')                      -- Paste (Ctrl+V)
imap('<C-v>', '<C-r>+')                   -- Paste in insert mode
vmap('<C-x>', '"+d')                      -- Cut (Ctrl+X)
-- nmap('<C-d>', ':t.<CR>')                  -- Duplicate line (Ctrl+D)
-- vmap('<C-d>', ':t\'><CR>')                -- Duplicate selection
nmap('<C-/>', ':Commentary<CR>')          -- Toggle comment (Ctrl+/)
vmap('<C-/>', ':Commentary<CR>')          -- Toggle comment for selection

-- =============================
-- VSCode-like LSP Features
-- =============================
nmap('gd', vim.lsp.buf.definition)        -- Go to definition
nmap('gD', vim.lsp.buf.declaration)       -- Go to declaration
nmap('gi', vim.lsp.buf.implementation)    -- Go to implementation
nmap('gr', vim.lsp.buf.references)        -- Go to references
nmap('K', vim.lsp.buf.hover)              -- Show hover
-- nmap('<C-k>', vim.lsp.buf.signature_help) -- Signature help
nmap('<F2>', vim.lsp.buf.rename)          -- Rename symbol (F2)
nmap('<C-.>', vim.lsp.buf.code_action)    -- Code actions (Ctrl+.)
nmap('<C-S-.>', vim.lsp.buf.code_action)  -- Code actions alternative

-- =============================
-- VSCode-like Diagnostics
-- =============================
nmap('<C-S-m>', ':Trouble toggle<CR>')                    -- Problems panel (Ctrl+Shift+M)
nmap('<F8>', vim.diagnostic.goto_next)                    -- Next error (F8)
nmap('<S-F8>', vim.diagnostic.goto_prev)                  -- Previous error (Shift+F8)
nmap('<C-S-u>', ':Trouble toggle document_diagnostics<CR>') -- Show problems for current file

-- =============================
-- VSCode-like Panel Management
-- =============================
nmap('<C-`>', ':ToggleTerm<CR>')          -- Toggle terminal (Ctrl+`)
nmap('<C-b>', ':NvimTreeToggle<CR>')      -- Toggle sidebar (Ctrl+B)
nmap('<C-S-e>', ':NvimTreeFocus<CR>')     -- Focus explorer (Ctrl+Shift+E)
-- nmap('<C-j>', ':ToggleTerm<CR>')          -- Toggle panel (Ctrl+J)

-- =============================
-- Better Navigation
-- =============================
nmap('<C-h>', '<C-w>h')   -- Move to left window
nmap('<C-l>', '<C-w>l')   -- Move to right window
nmap('<C-j>', '<C-w>j')   -- Move to bottom window
nmap('<C-k>', '<C-w>k')   -- Move to top window

-- =============================
-- VSCode-like Tab Management (Buffer Navigation)
-- =============================
nmap('<Leader>1', '<Cmd>lua require("bufferline").go_to_buffer(1, true)<CR>')
nmap('<Leader>2', '<Cmd>lua require("bufferline").go_to_buffer(2, true)<CR>')
nmap('<Leader>3', '<Cmd>lua require("bufferline").go_to_buffer(3, true)<CR>')
nmap('<Leader>4', '<Cmd>lua require("bufferline").go_to_buffer(4, true)<CR>')
nmap('<Leader>5', '<Cmd>lua require("bufferline").go_to_buffer(5, true)<CR>')
nmap('<Leader>6', '<Cmd>lua require("bufferline").go_to_buffer(6, true)<CR>')
nmap('<Leader>7', '<Cmd>lua require("bufferline").go_to_buffer(7, true)<CR>')
nmap('<Leader>8', '<Cmd>lua require("bufferline").go_to_buffer(8, true)<CR>')
nmap('<Leader>9', '<Cmd>lua require("bufferline").go_to_buffer(9, true)<CR>')

nmap('<C-PageUp>', '<Cmd>BufferLineCyclePrev<CR>')    -- Previous buffer
nmap('<C-PageDown>', '<Cmd>BufferLineCycleNext<CR>')  -- Next buffer

-- Alternative buffer navigation
nmap('<Leader>bn', ':bnext<CR>')                  -- Next buffer
nmap('<Leader>bp', ':bprevious<CR>')              -- Previous buffer
nmap('<Leader>bd', ':bdelete<CR>')                -- Delete buffer
nmap('<Leader>bo', '<Cmd>BufferLineCloseOthers<CR>')  -- Close other buffers

-- Simple buffer switching (fallback)
nmap('<Tab>', ':bnext<CR>')                       -- Next buffer with Tab
nmap('<S-Tab>', ':bprevious<CR>')                 -- Previous buffer with Shift+Tab

-- Quick buffer picker (alternative to numbered navigation)
nmap('<Leader>bb', ':Telescope buffers<CR>')      -- Buffer picker

-- =============================
-- Enhanced Telescope Operations
-- =============================
nmap('<Leader>ff', ':Telescope find_files<CR>')
nmap('<Leader>fc', ':Telescope current_buffer_fuzzy_find<CR>')
nmap('<Leader>fg', ':Telescope live_grep<CR>')
nmap('<Leader>fh', ':Telescope help_tags<CR>')
nmap('<Leader>fr', ':Telescope oldfiles<CR>')
nmap('<Leader>fk', ':Telescope keymaps<CR>')
nmap('<Leader>fs', ':Telescope lsp_document_symbols<CR>')
nmap('<Leader>fS', ':Telescope lsp_workspace_symbols<CR>')
nmap('<Leader>fb', ':Telescope buffers<CR>')

-- =============================
-- GitHub Copilot
-- =============================
nmap('<Leader>cc', ':CopilotChatToggle<CR>')
nmap('<Leader>ce', ':CopilotChatExplain<CR>')
vmap('<Leader>ce', ':CopilotChatExplain<CR>')
nmap('<Leader>cf', ':CopilotChatFix<CR>')
vmap('<Leader>cf', ':CopilotChatFix<CR>')
nmap('<Leader>co', ':CopilotChatOptimize<CR>')
vmap('<Leader>co', ':CopilotChatOptimize<CR>')
nmap('<Leader>cd', ':CopilotChatDocs<CR>')
vmap('<Leader>cd', ':CopilotChatDocs<CR>')
nmap('<Leader>ct', ':CopilotChatTests<CR>')
vmap('<Leader>ct', ':CopilotChatTests<CR>')

-- =============================
-- Formatting
-- =============================
nmap('<Leader>fm', function() vim.lsp.buf.format { async = true } end) -- Format document
vmap('<Leader>fm', function() vim.lsp.buf.format { async = true } end) -- Format selection
nmap('<C-S-i>', function() vim.lsp.buf.format { async = true } end)    -- Format document (Ctrl+Shift+I)

-- =============================
-- Quick Actions
-- =============================
nmap('<Esc>', ':nohlsearch<CR>')      -- Clear search highlight
nmap('<Leader>w', ':w<CR>')           -- Quick save
nmap('<Leader>q', ':q<CR>')           -- Quick quit
nmap('<Leader>x', ':x<CR>')           -- Save and quit

-- =============================
-- Folding
-- =============================
nmap('za', 'za')                      -- Toggle fold
nmap('zR', 'zR')                      -- Open all folds
nmap('zM', 'zM')                      -- Close all folds
nmap('<C-S-[>', 'zm')                 -- Fold more (Ctrl+Shift+[)
nmap('<C-S-]>', 'zr')                 -- Fold less (Ctrl+Shift+])

-- =============================
-- Split Management
-- =============================
nmap('<C-\\>', ':vsplit<CR>')         -- Vertical split
nmap('<C-S-\\>', ':split<CR>')        -- Horizontal split
nmap('<Leader>wq', '<C-w>q')          -- Close split (changed from <C-S-w> to avoid conflict)

-- =============================
-- Line Operations
-- =============================
nmap('<A-Up>', ':move .-2<CR>')       -- Move line up (Alt+Up)
nmap('<A-Down>', ':move .+1<CR>')     -- Move line down (Alt+Down)
vmap('<A-Up>', ':move \'<-2<CR>gv')   -- Move selection up
vmap('<A-Down>', ':move \'>+1<CR>gv') -- Move selection down

-- =============================
-- Text Objects and Selection
-- =============================
nmap('<C-S-l>', 'V')                  -- Select line
imap('<C-S-l>', '<Esc>V')             -- Select line from insert mode

-- =============================
-- Insert Mode Enhancements
-- =============================
imap('<C-BS>', '<C-w>')               -- Delete word backward
imap('<C-Del>', '<C-o>dw')            -- Delete word forward
imap('<C-Enter>', '<Esc>o')           -- New line below
imap('<C-S-Enter>', '<Esc>O')         -- New line above

-- =============================
-- Better Defaults
-- =============================
nmap('j', 'gj')                       -- Move down visual line
nmap('k', 'gk')                       -- Move up visual line
nmap('Y', 'y$')                       -- Yank to end of line
vmap('<', '<gv')                      -- Indent left and reselect
vmap('>', '>gv')                      -- Indent right and reselect

-- Terminal mode mappings
keymap('t', '<Esc>', '<C-\\><C-n>')   -- Exit terminal mode with Esc
