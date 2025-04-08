-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

--------------------
-- COLORS
--------------------
-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return 'Dark'
end


function scheme_for_appearance(appearance)
	-- if appearance:find 'Dark' then
	return 'Solarized Dark - Patched'
	-- else
	--   return 'Builtin Solarized Light'
	-- end
end

-- return {
config.color_scheme = scheme_for_appearance(get_appearance())
-- }

--------------------
-- FONTS
--------------------
config.font_size = 16
config.adjust_window_size_when_changing_font_size = true
config.line_height = 1.5

--------------------
-- GUI/WINDOW
--------------------
config.window_close_confirmation = "NeverPrompt"
config.native_macos_fullscreen_mode = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true

-- Start WezTerm window maximized
-- https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.5
}

config.keys = {
	{
		key = 'k',
		mods = 'CMD',
		action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
	},
}

--------------------
-- PLUGINS
--------------------
wezterm.plugin.require("https://gitlab.com/xarvex/presentation.wez").apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
