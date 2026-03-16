--------------------------------
-- Modes
--------------------------------
-- 	"n" -> normal mode
-- 	"i" -> insert_mode
-- 	"v" -> visual_mode
-- 	"x" -> visual_block_mode
-- 	"t" -> term_mode
-- 	"c" -> command_mode

local set_keymap = vim.api.nvim_set_keymap;
local defaultOpts = { noremap = true, silent = true }

-- Remap leader to Space (" ") in normal mode
set_keymap('n', '<Space>', '<NOP>', defaultOpts)
vim.g.mapleader = ' '

set_keymap(
	'n',
	'<Leader>h',
	':noh<CR>',
	{
		noremap = true,
		silent = true,
		desc = 'Remove search [H]ighlighting.'
	}
)

set_keymap(
	'n',
	'<C-h>',
	'<C-w>h',
	{
		noremap = true,
		silent = true,
		desc = 'Jump to the split to the left.'
	}
)

set_keymap(
	'n',
	'<C-j>',
	'<C-w>j',
	{
		noremap = true,
		silent = true,
		desc = 'Jump to the split below.'
	}
)

set_keymap(
	'n',
	'<C-k>',
	'<C-w>k',
	{
		noremap = true,
		silent = true,
		desc = 'Jump to the split above.'
	}
)

set_keymap(
	'n',
	'<C-l>',
	'<C-w>l',
	{
		noremap = true,
		silent = true,
		desc = 'Jump to the split to the right.'
	}
)

-- Resize splits with arrows
set_keymap(
	'n',
	"<SC-Up>",
	":resize -2<CR>",
	{
		noremap = true,
		silent = true,
		desc = 'Resize split(s) 2 lines "up"/smaller.'
	}
)
set_keymap(
	'n',
	"<SC-Down>",
	":resize +2<CR>",
	{
		noremap = true,
		silent = true,
		desc = 'Resize split(s) 2 lines "down"/larger.'
	}
)
set_keymap(
	'n',
	"<SC-Left>",
	":vertical resize -2<CR>",
	{
		noremap = true,
		silent = true,
		desc = 'Vertically resize split(s) 2 lines "left"/smaller.'
	}
)
set_keymap(
	'n',
	"<SC-Right>",
	":vertical resize +2<CR>",
	{
		noremap = true,
		silent = true,
		desc = 'Vertically resize split(s) 2 lines "right"/larger.'
	}
)

-- Indent forward/back in Visual mode
set_keymap(
	'v',
	'<',
	'<gv',
	{
		noremap = true,
		silent = true,
		desc = 'Indent back/shallower.'
	}
)
-- set_keymap(
-- 	'v',
-- 	'>',
-- 	'>gv',
-- 	{
-- 		noremap = true,
-- 		silent = true,
-- 		desc = 'Indent forward/deeper.'
-- 	}
-- )

-- Move selected line(s) of text in visual mode
set_keymap('x', 'J', ':move \'<-2<CR>gv-gv', defaultOpts)
set_keymap('x', 'K', ':move \'>+1<CR>gv-gv', defaultOpts)

-- Quick Switch buffers
set_keymap('n', '<S-l>', ':bnext<CR>', defaultOpts)
set_keymap('n', '<S-h>', ':bprevious<CR>', defaultOpts)

-- Toggle Relative Line Numbers
set_keymap('n', '<Leader>rn', ':set relativenumber!<CR>', defaultOpts)

-- Yank once, paste "everywhere" (instead of pasting what you just pasted over the second time you hit "p")
set_keymap("v", "p", '"_dP', defaultOpts)
