local M = {}

M.setup = function()
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local opts = { buffer = event.buf }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
        end,
    })

    -- Native Neovim 0.11+ API
    -- We use vim.lsp.config to set settings and vim.lsp.enable to start the server.
    -- The defaults are provided by the nvim-lspconfig plugin.
    vim.lsp.config("lua_ls", {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
            },
        },
    })
    vim.lsp.enable("lua_ls")
end

return M
