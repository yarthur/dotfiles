-- :help options

local options = {
	-- Make backspace behave in a sane manner.
	backspace = "indent,eol,start",

	-- Use Spaces instead of Tabs
	expandtab = true,

	-- Set Tab width to 4 spa
	tabstop = 4,

	-- Set clipboard to unnamed.
	-- This allows nvim to copy to OS clipboard.
	clipboard = {"unnamed", "unnamedplus"},

	-- set text conceal to apply only to normal and command line modes
	concealcursor = "nc",

	-- turn on line wrapping
	wrap = true,

	-- wrap lines when coming within n characters from side
	wrapmargin = 8,

	-- set soft wrapping
	linebreak = true,

	-- Preceed wrapped line with "↪"
	showbreak = "↪",

	-- Show line numbers
	number = true,

	--" Show relative line numbers
	relativenumber = true,

	-- Show hidden characters
	list = true,
	listchars = {
		eol = "¶",
		tab = "→ ",
		trail = "·",
		space = "·",
		extends = "❯",
		precedes = "❮"
	},

	-- Highlight current row
	cursorline = true,

	--Enables 24-bit RGB color in the |TUI
	termguicolors = true,
}

for optKey, optValue in pairs(options) do
	vim.opt[optKey] = optValue
end

-- Switch syntax highlighting on
vim.cmd [[syntax on]]

-- Allow hidden buffers, don't limit to 1 file per window/split
vim.cmd [[filetype plugin indent on]]
