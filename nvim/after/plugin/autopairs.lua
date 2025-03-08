local info = debug.getinfo(1,'S');

local autopairsSuccess, autopairs = pcall(require, 'nvim-autopairs')
if not autopairsSuccess then
	vim.notify("(~/.config/nvim/after/plugin/init.lua): nvim-autopairs could not be loaded.")
	return
end

local cmpAutopairsSuccess, cmpAutopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not cmpAutopairsSuccess then
	vim.notify("(~/.config/nvim/after/plugin/init.lua): nvim-autopairs.completion.cmp could not be loaded.")
	return
end

local apRuleSuccess, apRule = pcall(require, "nvim-autopairs.rule")
if not apRuleSuccess then
	vim.notify("(" .. info.source .. "): nvim-autopairs.rule could not be loaded.")
	return
end

local tsCondsSuccess, tsConds = pcall(require, 'nvim-autopairs.ts-conds')
if not tsCondsSuccess then
	vim.notify("(~/.config/nvim/after/plugin/init.lua): nvim-autopairs.ts-conds could not be loaded.")
	return
end

local cmpSuccess, cmp = pcall(require, 'cmp')
if not cmpSuccess then
	vim.notify("(~/.config/nvim/after/plugin/init.lua): cmp could not be loaded.")
	return
end

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = {'string'},-- it will not add a pair on that treesitter node
		javascript = {'template_string'},
	}
})

-- CMP: If you want to insert `(` after select function or method item
cmp.event:on(
  'confirm_done',
  cmpAutopairs.on_confirm_done()
)

-- Treesitter: press % => %% only while inside a comment or string
autopairs.add_rules({
  apRule("%", "%", "lua")
    :with_pair(tsConds.is_ts_node({'string','comment'})),
  apRule("$", "$", "lua")
    :with_pair(tsConds.is_not_ts_node({'function'}))
})

