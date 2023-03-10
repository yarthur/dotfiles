local luasnipSuccess, luasnip = pcall(require, "luasnip")
if not luasnipSuccess then
	vim.notify("~/.config/nvim/snippets/lua.lua: luasnip could not be loaded.")
	return
end

local snippet = luasnip.snippet
local insert_node = luasnip.insert_node
local text_node = luasnip.text_node

local dynamic_node = luasnip.dynamic_node
local choice_node = luasnip.choice_node
local function_node = luasnip.function_node
local snippet_node = luasnip.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

--------------------------------------------------------------------------------
-- Snippets start here
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Snippets end here
--------------------------------------------------------------------------------

return snippets, autosnippets
