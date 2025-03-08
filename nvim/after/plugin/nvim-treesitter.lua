local tsConfigSuccess, tsConfig = pcall(require,"nvim-treesitter.configs")
if not tsConfigSuccess then
	vim.notify("~/.config/nvim/after/plugin/nvim-treesitter.lua: nvim-treesitter.configs could not be loaded.")
	return
end

tsConfig.setup({
	ensure_installed = {
		"comment",
		"css",
		"dockerfile",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"lua",
		"markdown",
		"php",
		"regex",
		"typescript",
		"vue",
		"yaml"
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
	},
})

