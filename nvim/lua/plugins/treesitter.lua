vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

local languages = {
	"bash",
	"css",
	"diff",
	"dockerfile",
	"gitcommit",
	"gitignore",
	"go",
	"gomod",
	"gosum",
	"html",
	"ini",
	"javascript",
	"json",
	"lua",
	"luadoc",
	"make",
	"markdown",
	"markdown_inline",
	"proto",
	"python",
	"rust",
	"sql",
	"terraform",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
}

require("nvim-treesitter").setup({
	highlight = { enable = true },
	indent = { enable = true },
})
require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd("FileType", {
	pattern = languages,
	callback = function()
		vim.treesitter.start()
	end,
})
