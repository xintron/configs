require("snacks").setup({
    explorer = { enabled = true, replace_netrw = true },
    picker = {
        enabled = true,
        sources = {
            files = { hidden = true, ignored = true },
            explorer = {
                hidden = true,
                ignored = true,
                supports_live = true,
                auto_close = true,
                follow_file = true,
                git_status = true,
                tree = true,
                jump = { close = true },
            },
        },
    },
})
