local wezterm = require("wezterm")

local commands = {}

commands.rename_tab = wezterm.action.PromptInputLine({
	description = "Enter new name for tab",
	action = wezterm.action_callback(function(window, _, line)
		if line then
			window:active_tab():set_title(line)
		end
	end),
})

return commands
