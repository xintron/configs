local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("Cascadia Code")
config.font_size = 14.0

config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

config.keys = {
	{
		-- Rename tabs
		key = "R",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

-- Match the colorscheme based on the system appearance
local function get_color_scheme()
	if wezterm.gui.get_appearance():find("Dark") then
		return "Catppuccin Macchiato"
	else
		return "Catppuccin Latte"
	end
end
config.color_scheme = get_color_scheme()

local launch_menu = {}

-- TODO: Figure out how to handle WSL vs PowerShell
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "pwsh.exe", "-NoLogo" }

	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "pwsh.exe", "-NoLogo" },
	})
end

return config
