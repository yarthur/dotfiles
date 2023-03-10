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

-- "Safe" Require -- Boilerplate `pcall(require...)` for these config files
-- TODO: figure out how to allow for a different Plugin name in the notify call
local safeRequire = snippet(
	"safeRequire",
	fmt([[
local {plugin}Success, {plugin} = pcall(require, '{plugin}')
if not {plugin}Success then
	vim.notify("{filename}: {plugin} could not be loaded.")
	return
end
		]],
		{
			plugin = i(1, "plugin"),
			filename = i(2, "filename"),
		},
		{
			repeat_duplicates = true
		}
	)
)

table.insert(snippets, safeRequire)

local choices = snippet(
	"testChoice",
	{choice_node(1, { i(1, "this"), t("that"), t("us") })}
)
table.insert(snippets, choices)

--------------------------------------------------------------------------------
-- Snippets end here
--------------------------------------------------------------------------------

return snippets, autosnippets
