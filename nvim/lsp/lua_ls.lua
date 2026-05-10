---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      format = { enable = true },
      workspace = {
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
}
