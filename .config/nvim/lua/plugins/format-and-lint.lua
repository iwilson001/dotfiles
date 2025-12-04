return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				-- figure out current file type w/ `:set filetype?`
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				-- TODO: check if this is the desired formatter for JSON
				json = { "prettierd", "prettier", stop_after_first = true },
				-- TODO: add formatters for: html, css, md
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
