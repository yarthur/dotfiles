return {
	{
		"iamcco/markdown-preview.nvim",

		cmd = {
			"MarkdownPreview",
			"MarkdownPreviewStop",
			"MarkdownPreviewToggle",
		},

		ft = {
			"markdown",
		},

		build = function()
			vim.fn["mkdp#util#install"]()
		end,

		init = function()
			vim.g.mkdp_filetypes = { "markdown" }

			-- Do not automatically start preview when opening markdown files.
			vim.g.mkdp_auto_start = 0

			-- Automatically close preview window when switching away from markdown.
			vim.g.mkdp_auto_close = 1

			-- Refresh preview as you edit.
			vim.g.mkdp_refresh_slow = 0

			-- Only open locally.
			vim.g.mkdp_open_to_the_world = 0
			vim.g.mkdp_open_ip = "127.0.0.1"
			vim.g.mkdp_port = "8888"

			-- Let the plugin choose the browser.
			vim.g.mkdp_browser = "open"

			-- Show preview URL in command line.
			vim.g.mkdp_echo_preview_url = 1

			-- Browser page title.
			vim.g.mkdp_page_title = "${name}"
		end,

		keys = {
			{
				"<leader>mp",
				"<cmd>MarkdownPreviewToggle<cr>",
				ft = "markdown",
				desc = "Toggle Markdown Preview",
			},
		},
	},
}
