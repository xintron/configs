vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- goimports is a drop-in replacement to gofmt, if available we only run goimports
		go = { "goimports", "gofmt", stop_after_first = true },
		javascript = { "oxfmt" },
		typescript = { "oxfmt" },

		-- Markup
		markdown = { "oxfmt" },
		html = { "oxfmt" },
		css = { "oxfmt" },

		-- Config formats
		json = { "oxfmt" },
		jsonc = { "oxfmt" },
		yaml = { "oxfmt" },
		toml = { "oxfmt" },
	},

	default_format_opts = { lsp_format = "fallback" },
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})
