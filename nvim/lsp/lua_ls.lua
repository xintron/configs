---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      -- Managed by conform
      format = { enable = false },
      workspace = {
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
}
