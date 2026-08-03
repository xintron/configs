local wezterm = require("wezterm")

local function mode_status(window, label, ansi_color, bindings)
	window:set_right_status(wezterm.format({
		{ Background = { AnsiColor = ansi_color } },
		{ Foreground = { Color = "black" } },
		{ Text = " " .. label .. " " },
		"ResetAttributes",
		{ Text = "  " .. bindings },
	}))
end

local KEY_TABLE_STATUS = {
	pane_mode = {
		"PANE",
		"Blue",
		"hjkl move  HJKL resize  v split→  s split↓  z zoom  ⏎ swap  x close  esc exit",
	},
	tab_mode = {
		"TAB",
		"Fuchsia",
		"hl tabs  HL move  1-9 jump  c new  x close  r rename  esc exit",
	},
}

wezterm.on("update-status", function(window)
	local status = KEY_TABLE_STATUS[window:active_key_table()]
	if status then
		mode_status(window, status[1], status[2], status[3])
	else
		window:set_right_status("")
	end
end)

wezterm.on("format-tab-title", function(tab, _, _, config)
	local title = tab.tab_title
	if not title or #title == 0 then
		title = tab.active_pane.title
	end

	local zoom_marker = tab.active_pane.is_zoomed and "*" or ""

	if config.show_tab_index_in_tab_bar then
		local index = tab.tab_index
		if not config.tab_and_split_indices_are_zero_based then
			index = index + 1
		end
		title = index .. zoom_marker .. ": " .. title
	else
		title = zoom_marker .. title
	end

	-- Space around the tabs
	title = " " .. title .. " "

	if tab.active_pane.is_zoomed then
		local attr = tab.is_active and "Background" or "Foreground"
		return {
			{ [attr] = { AnsiColor = "Red" } },
			{ Text = title },
		}
	end

	return title
end)
