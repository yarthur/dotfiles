------------------------------
-- INSTALL PACKER IF NECESSARY
------------------------------
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	use 'ishan9299/nvim-solarized-lua'

	use 'kyazdani42/nvim-web-devicons'

	-- Status Line
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- indentation guide lines
	use "lukas-reineke/indent-blankline.nvim"

	use 'editorconfig/editorconfig-vim'

	-- FZF
	use 'vijaymarupudi/nvim-fzf'
	use {
		'ibhagwan/fzf-lua',
		requires = {
			'vijaymarupudi/nvim-fzf',
			'kyazdani42/nvim-web-devicons'
		}
	}

	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'RishabhRD/nvim-lsputils'
	use 'RishabhRD/popfix'

	-- snippets
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'

	-- completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'

	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	-- Twig Syntax
	use 'lumiliet/vim-twig'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
