----------------------------------------
-- Colorscheme stuff
----------------------------------------
local success = pcall(vim.cmd, 'colorscheme solarized-high')
if not success then
	vim.notify("Something's not working with this colorscheme")
	return
end

vim.g.background = 'dark'
local colorscheme = 'solarized-high'
local indentHighlightDark = '#eee8d5'


----------------------------------------
-- Telescope
----------------------------------------
local telescopeSuccess, telescope = pcall(require, 'telescope')
if not telescopeSuccess then
	vim.notify("(~/.config/nvim/after/plugin/init.lua): telescope could not be loaded.")
	return
end

telescope.setup({
	sorting_strategy = "ascending",
	layout_strategy = "horizontal",
	layout_config = {
		horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
		vertical = { mirror = false },
		width = 0.87,
		height = 0.80,
		preview_cutoff = 120,
	},
	path_display = { "truncate" },
	border = true,
	borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
})

-- <Leader>e opens Telescope git_files picker
vim.api.nvim_set_keymap('n', '<Leader>e', ':Telescope git_files<CR>', { noremap = true, silent = true })
-- <Leader>f opens Telescope find_files picker
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<CR>', { noremap = true, silent = true })
-- Ctrl+p opens Telescope (no picker)
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope<CR>', { noremap = true, silent = true })
