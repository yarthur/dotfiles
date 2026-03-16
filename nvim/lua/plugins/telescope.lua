return {
	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzf-native.nvim',
		},
	},

	-- File browser extension
	{
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'nvim-lua/plenary.nvim'
		},
	},

	-- Find pickers extension
	{
		'keyvchan/telescope-find-pickers.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' },
	},
}

