vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.expandtab = true -- Use spaces instead of tabs
opt.shiftround = true -- Round indent to a multiple of shiftwidth
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.softtabstop = 2 -- Number of spaces a tab counts for while editing
opt.autoindent = true -- Use previous line as default, if no language specific config exists

opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 5

vim.cmd("syntax on")
vim.cmd("filetype plugin on")

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
})
