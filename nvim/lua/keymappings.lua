-- Remap leader to Space (" ") in normal mode
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Remove search Highlighting
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- Ctrl+(direction) to jump between splits
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })


-- Indent forward/back in Visual mode
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Move selected line(s) of text in visual mode
vim.api.nvim_set_keymap('x', 'J', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'K', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })

-- Quick Switch buffers
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })
