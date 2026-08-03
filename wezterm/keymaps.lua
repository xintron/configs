local wezterm = require("wezterm")
local commands = require("commands")

local keymaps = {}

-- Wraps an action so that performing it also pops the active key table,
-- for bindings that represent a one-off, "do it and return to normal
-- mode" operation rather than a repeated action.
local function auto_exit(action)
	return wezterm.action.Multiple({ action, wezterm.action.PopKeyTable })
end

keymaps.keys = {
	{ key = "p", mods = "LEADER", action = wezterm.action.ActivateKeyTable({ name = "pane_mode", one_shot = false }) },
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action.ActivateKeyTable({ name = "tab_mode", one_shot = false }),
	},
	{ key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "f", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
}

keymaps.key_tables = {
	pane_mode = {
		{ key = "h", mods = "", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "j", mods = "", action = wezterm.action.ActivatePaneDirection("Down") },
		{ key = "k", mods = "", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "l", mods = "", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "H", mods = "", action = wezterm.action.AdjustPaneSize({ "Left", 3 }) },
		{ key = "J", mods = "", action = wezterm.action.AdjustPaneSize({ "Down", 3 }) },
		{ key = "K", mods = "", action = wezterm.action.AdjustPaneSize({ "Up", 3 }) },
		{ key = "L", mods = "", action = wezterm.action.AdjustPaneSize({ "Right", 3 }) },
		{ key = "v", mods = "", action = auto_exit(wezterm.action.SplitPane({ direction = "Right" })) },
		{ key = "s", mods = "", action = auto_exit(wezterm.action.SplitPane({ direction = "Down" })) },
		{ key = "z", mods = "", action = wezterm.action.TogglePaneZoomState },
		{
			key = "Enter",
			mods = "",
			action = auto_exit(wezterm.action.PaneSelect({ mode = "SwapWithActiveKeepFocus" })),
		},
		{ key = "x", mods = "", action = auto_exit(wezterm.action.CloseCurrentPane({ confirm = false })) },
		{ key = "Escape", mods = "", action = wezterm.action.PopKeyTable },
	},
	tab_mode = {
		{ key = "h", mods = "", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "l", mods = "", action = wezterm.action.ActivateTabRelative(1) },
		{ key = "H", mods = "", action = wezterm.action.MoveTabRelative(-1) },
		{ key = "L", mods = "", action = wezterm.action.MoveTabRelative(1) },
		{ key = "1", mods = "", action = wezterm.action.ActivateTab(0) },
		{ key = "2", mods = "", action = wezterm.action.ActivateTab(1) },
		{ key = "3", mods = "", action = wezterm.action.ActivateTab(2) },
		{ key = "4", mods = "", action = wezterm.action.ActivateTab(3) },
		{ key = "5", mods = "", action = wezterm.action.ActivateTab(4) },
		{ key = "6", mods = "", action = wezterm.action.ActivateTab(5) },
		{ key = "7", mods = "", action = wezterm.action.ActivateTab(6) },
		{ key = "8", mods = "", action = wezterm.action.ActivateTab(7) },
		{ key = "9", mods = "", action = wezterm.action.ActivateTab(8) },
		{ key = "c", mods = "", action = auto_exit(wezterm.action.SpawnTab("CurrentPaneDomain")) },
		{ key = "x", mods = "", action = auto_exit(wezterm.action.CloseCurrentTab({ confirm = true })) },
		{ key = "r", mods = "", action = auto_exit(commands.rename_tab) },
		{ key = "Escape", mods = "", action = wezterm.action.PopKeyTable },
	},
}

return keymaps
