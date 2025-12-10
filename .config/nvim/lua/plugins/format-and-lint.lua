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
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				javascript = { "eslint_d" },
			}

			-- Create autocommand which carries out the actual linting
			-- on the specified events.
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					-- Only run the linter in buffers that you can modify in order to
					-- avoid superfluous noise, notably within the handy LSP pop-ups that
					-- describe the hovered symbol using Markdown.
					if vim.bo.modifiable then
						lint.try_lint({})
					end
				end,
			})
		end,
	},
}
