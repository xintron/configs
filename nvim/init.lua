-- Set background explicitly to avoid DSR timeout when running within zellij
vim.opt.background = "dark"

require("config.options")

-- Helper for github URLs
local gh = function(x) return "https://github.com/" .. x end

vim.pack.add({
    -- Colors
    gh("folke/tokyonight.nvim"),
    gh("catppuccin/nvim"),
    gh("shaunsingh/nord.nvim"),
    gh("rebelot/kanagawa.nvim"),

    -- UI
    gh("nvim-lualine/lualine.nvim"),
    gh("nvim-tree/nvim-web-devicons"),
    gh("folke/snacks.nvim"),
    gh("lewis6991/gitsigns.nvim"),
})

require("config.keymaps")
require("plugins.ui")
require("plugins.utils")
-- require("plugins.treesitter").setup()
require("plugins.lsp")
