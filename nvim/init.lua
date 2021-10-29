require('keymappings')

-- Make backspace behave in a sane manner.
vim.o.backspace = "indent,eol,start"

-- Show line numbers
vim.o.number = true
--" Show relative line numbers
vim.o.relativenumber = true

vim.opt.list = true
vim.opt.listchars = {
	eol = "¶",
	tab = "→ ",
	trail = "·",
	space = "·",
	extends = "❯",
	precedes = "❮"
}

-- Use Spaces instead of Tabs
vim.opt.expandtab = true

-- Set Tab width to 4 space
vim.opt.tabstop = 4

-- Highlight current row
vim.opt.cursorline = true

-- Set clipboard to unnamed.
-- This allows nvim to copy to OS clipboard.
vim.opt.clipboard = {"unnamed", "unnamedplus"}

-- set text conceal to apply only to normal and command line modes
vim.opt.concealcursor = "nc"

-- turn on line wrapping
vim.opt.wrap = true

-- wrap lines when coming within n characters from side
vim.opt.wrapmargin = 8

-- set soft wrapping
vim.opt.linebreak = true

-- Preceed wrapped line with "↪"
-- vim.opt.showbreak = "↪"

-- ???
vim.opt.termguicolors = true

-- Switch syntax highlighting on
vim.cmd [[syntax on]]

-- Allow hidden buffers, don't limit to 1 file per window/split
vim.cmd [[filetype plugin indent on]]
