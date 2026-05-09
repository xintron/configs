-- Set background explicitly to avoid DSR timeout
vim.opt.background = "dark"

require("config.options")

-- Helper for github URLs
local gh = function(x) return "https://github.com/" .. x end

vim.pack.add({
    gh("folke/tokyonight.nvim"),
    gh("catppuccin/nvim"),
    gh("shaunsingh/nord.nvim"),
    gh("rebelot/kanagawa.nvim"),
    gh("nvim-lualine/lualine.nvim"),
    gh("nvim-tree/nvim-web-devicons"),
    gh("folke/snacks.nvim"),
    gh("lewis6991/gitsigns.nvim"),
})

require("plugins.ui").setup()
require("plugins.utils").setup()
-- require("plugins.treesitter").setup()
-- require("plugins.lsp").setup()
require("config.keymaps").setup()
