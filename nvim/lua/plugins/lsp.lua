return {
	-- Mason for managing LSP servers
	{
		'williamboman/mason.nvim',
		build = ":MasonUpdate",
		config = true,
	},

	-- LSP config
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			'neovim/nvim-lspconfig'
		},
	},
	{
		'neovim/nvim-lspconfig',
		lazy = false,
	},
}
