-- Lualine
require("lualine").setup()

-- Catppuccin
require("catppuccin").setup({
    background = {
        light = "latte",
        dark = "macchiato",
    },
})

-- Final colorscheme choice
vim.cmd.colorscheme("tokyonight-moon")
