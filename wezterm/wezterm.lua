local wezterm = require("wezterm")
local c = wezterm.config_builder()

local themes = {
	dark = "Catppuccin Mocha",
	light = "Catppuccin Latte",
}

function get_default_theme()
	if wezterm.gui then
		local appearance = wezterm.gui.get_appearance()
		if appearance:find("Dark") then
			return themes.dark
		else
			return themes.light
		end
	end
	return themes.dark -- fallback for mux server
end

local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"
local is_macos = wezterm.target_triple:find("apple%-darwin") ~= nil

c.font = wezterm.font("GeistMono Nerd Font")
c.font_size = 14.0

c.hide_tab_bar_if_only_one_tab = true
c.use_fancy_tab_bar = false

c.keys = {
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
	{
		-- Toggle theme
		key = "T",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window, pane)
			local overrides = window:get_config_overrides() or {}
			local current = overrides.color_scheme or c.color_scheme

			-- Toggle between dark and light
			if current == themes.dark then
				overrides.color_scheme = themes.light
			else
				overrides.color_scheme = themes.dark
			end

			window:set_config_overrides(overrides)
		end),
	},
}

c.color_scheme = get_default_theme()

local launch_menu = {}

if is_windows then
	c.font_size = 12.0

	local wsl = wezterm.default_wsl_domains()
	for _, dom in ipairs(wsl) do
		dom.default_cwd = "~"
	end
	c.wsl_domains = wsl

	c.default_domain = "WSL:Ubuntu"
	c.default_prog = { "wsl.exe", "~", "--distribution", "Ubuntu" }

	launch_menu = {
		{
			label = "PowerShell 7",
			domain = { DomainName = "local" },
			args = { "pwsh.exe", "-NoLogo" },
		},
		{
			label = "Windows PowerShell 5.1",
			domain = { DomainName = "local" },
			args = { "powershell.exe" },
		},
		{
			label = "Git Bash",
			domain = { DomainName = "local" },
			args = { "C:/Program Files/Git/git-bash.exe", "--cd-to-home" },
		},
	}
end

c.launch_menu = launch_menu

return c
