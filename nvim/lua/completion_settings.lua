-- Mapping stuff cribbed from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings

local cmp = require('cmp')

-- ---------------------------
-- Functions for Mapping stuff
-- ---------------------------
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
-- ---
-- End
-- ---

vim.o.completeopt = "menu,menuone,noselect"

cmp.setup({
	cmdline = {
		':',
		{
			sources = {
				{ name = "cmdline" }
			}
		}
	},
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = 'vsnip' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = "buffer" },
		{ name = "path" }
	}
})

-- For the following, reference https://github.com/hrsh7th/cmp-nvim-lsp
-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
