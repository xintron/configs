local M = {}

M.setup = function()
    local lspconfig = require("lspconfig")

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

    -- Manual setup for lua_ls (assumes lua-language-server is in PATH)
    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
            },
        },
    })
end

return M
