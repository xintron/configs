local wezterm = require("wezterm")

package.path = package.path .. ";" .. wezterm.config_dir .. "/?.lua"

local keymaps = require("keymaps")
require("status")
local c = wezterm.config_builder()

c.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"

c.font = wezterm.font("GeistMono Nerd Font")
c.font_size = 15.0

c.hide_tab_bar_if_only_one_tab = true
c.tab_max_width = 24
c.use_fancy_tab_bar = false
c.unzoom_on_switch_pane = true

-- Command Palette
c.command_palette_bg_color = "#363a4f"
c.command_palette_font_size = c.font_size * 1.2

if not is_windows then
	c.window_decorations = "RESIZE"
end

c.keys = keymaps.keys
c.key_tables = keymaps.key_tables

c.color_scheme = "Catppuccin Macchiato"

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
