function safeRequire (requirePath)
	local success, required = pcall(require, requirePath)

	if not success then
		vim.notify(requirePath .. " failed to load.")

		return
	end

	return required
end

local pluginList = {
	'general',
	'keymap',
	'plugins',
}

-- Loop through list of plugins and require them
for _, plugin in ipairs(pluginList) do
	safeRequire("user."..plugin)
end
