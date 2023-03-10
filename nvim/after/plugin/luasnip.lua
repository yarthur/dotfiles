local luaSnipSuccess, luaSnip = pcall(require, "luasnip")
if not luaSnipSuccess then
	vim.notify("LuaSnip could not be found. Skipping LuaSnip setup.")
	return
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })

-- When in a file, will take you to the snippet file for that filetype.
vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}

-- Mapping `<Leader><CR>` to the command above.
vim.keymap.set("n", "<Leader><CR>", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })

-- Opens a menu to choose a value within a choice_node
vim.keymap.set("i", "<C><C>", '<cmd>lua require("luasnip.extras.select_choice")()<cr>', { silent = true, noremap = true })
