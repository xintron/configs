vim.lsp.config('*', {
    root_markers = {'.git'},
})

vim.lsp.enable({
    "lua_ls"
})
