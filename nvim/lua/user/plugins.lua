------------------------------
-- INSTALL LAZY IF NECESSARY
------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	'ishan9299/nvim-solarized-lua',

	-- 'kyazdani42/nvim-web-devicons',
	'onsails/lspkind.nvim',

	-- Status Line
	{
		'hoob3rt/lualine.nvim',
		dependencies = {'kyazdani42/nvim-web-devicons', opt = true}
	},

	-- indentation guide lines
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function () 
			require("indent_blankline").setup {
				char = "·",
				char_highlight_list = {
					"normal"
				}
			}
		end,
	},

	{'gpanders/editorconfig.nvim', lazy = false },

	-- telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-fzf-native.nvim'}
		}
	},

	-- Automatic closing of ", (, etc
	'windwp/nvim-autopairs',

	-- Commenting!
	{
		'numToStr/Comment.nvim',
		config = true
	},

	-- Surrounding!
	{
		"kylechui/nvim-surround",
		config = true
	},
	-- use {
	-- 	"blackCauldron7/surround.nvim",
	-- 	config = function()
	-- 		require"surround".setup {mappings_style = "sandwich"}
	-- 		-- I'm going to try this, but if I need to
	-- 		-- revert to the tpope/vim-surround way, switch
	-- 		-- to this:
	-- 		-- require"surround".setup {mappings_style = 'surround'}
	-- 	end
	-- }

	-- VCS
	{
		'lewis6991/gitsigns.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		-- tag = 'release' -- To use the latest release
	},

	-- lsp
	{
		'williamboman/mason.nvim',
		-- lazy = false,
		build=":MasonUpdate",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
	},
	-- 'RishabhRD/nvim-lsputils',
	-- 'RishabhRD/popfix',

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = { 'rafamadriz/friendly-snippets' },
	},

	-- completion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip"
		},
	},
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',

	{
		"folke/trouble.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons"
		},
		config = true
	},

	-- Twig Syntax
	'lumiliet/vim-twig',



	-- Tree-Sitter
	-- I need to get my head around this, I think.
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
	"HiPhish/nvim-ts-rainbow2",
	-- 'p00f/nvim-ts-rainbow',

	"AndrewRadev/splitjoin.vim",
})

