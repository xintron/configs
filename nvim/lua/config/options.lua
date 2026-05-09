vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = 4
opt.tabstop = 4
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
