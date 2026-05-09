local M = {}

M.setup = function()
    -- snacks.nvim
    require("snacks").setup({
        explorer = { enabled = true, replace_netrw = true },
        picker = {
            enabled = true,
            sources = {
                files = { hidden = true },
                explorer = {
                    hidden = true,
                    ignored = true,
                    tree = true,
                },
            },
        },
    })

    -- gitsigns
    require("gitsigns").setup()
end

return M
