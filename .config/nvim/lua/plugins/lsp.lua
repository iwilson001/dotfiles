return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "lua_ls", "cssls", "ts_ls", "stylua" },
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"neovim/nvim-lspconfig",
			dependencies = { "https://github.com/ibhagwan/fzf-lua" },
			config = function()
				vim.lsp.enable("lua_ls")
				vim.lsp.enable("ts_ls")

				local map = vim.keymap.set
				map("n", "K", function()
					local diagnostics =
						vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1, col = vim.fn.col(".") - 1 })
					if #diagnostics > 0 then
						vim.diagnostic.open_float(nil) -- {focus = false}
					else
						vim.lsp.buf.hover()
					end
				end, {})
				map("n", "<leader>cr", vim.lsp.buf.rename, {})
				map("n", "<leader>lf", vim.lsp.buf.format, {})

				map("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", {})
				map("n", "gr", "<cmd>FzfLua lsp_references<CR>", {})
				map("n", "gI", "<cmd>FzfLua lsp_implementations<CR>", {})
				map("n", "gy", "<cmd>FzfLua lsp_typedefs<CR>", {})
				map("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", {})
				map("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", {})

				local function goto_diagnostic_global(direction)
					local diagnostics = vim.diagnostic.get(nil) -- nil = all buffers
					if #diagnostics == 0 then
						return
					end

					table.sort(diagnostics, function(a, b)
						if a.bufnr ~= b.bufnr then
							return a.bufnr < b.bufnr
						end
						if a.lnum ~= b.lnum then
							return a.lnum < b.lnum
						end
						return a.col < b.col
					end)

					local cur_buf = vim.api.nvim_get_current_buf()
					local cur_pos = vim.api.nvim_win_get_cursor(0)
					local cur_lnum, cur_col = cur_pos[1] - 1, cur_pos[2]

					local target

					if direction == "next" then
						for i = 1, #diagnostics, 1 do
							local diagnostic = diagnostics[i]
							local isTargetAfterCurrentBuffer = diagnostic.bufnr > cur_buf
							if isTargetAfterCurrentBuffer then
								target = diagnostic
								break
							end

							local isCurrentBuffer = diagnostic.bufnr == cur_buf
							local isTargetAfterCurrentLine = diagnostic.lnum > cur_lnum
							local isCurrentLineNumber = diagnostic.lnum == cur_lnum
							local isTargetAfterCurrentColumn = diagnostic.col > cur_col
							if
								isCurrentBuffer
								and (isTargetAfterCurrentLine or (isCurrentLineNumber and isTargetAfterCurrentColumn))
							then
								target = diagnostic
								break
							end
						end
						target = target or diagnostics[1]
					else
						for i = #diagnostics, 1, -1 do
							local diagnostic = diagnostics[i]
							local isTargetBeforeCurrentBuffer = diagnostic.bufnr < cur_buf
							if isTargetBeforeCurrentBuffer then
								target = diagnostic
								break
							end

							local isCurrentBuffer = diagnostic.bufnr == cur_buf
							local isTargetBeforeCurrentLine = diagnostic.lnum < cur_lnum
							local isCurrentLineNumber = diagnostic.lnum == cur_lnum
							local isTargetBeforeCurrentColumn = diagnostic.col < cur_col
							if
								isCurrentBuffer
								and (isTargetBeforeCurrentLine or (isCurrentLineNumber and isTargetBeforeCurrentColumn))
							then
								target = diagnostic
								break
							end
						end
						target = target or diagnostics[#diagnostics]
					end

					vim.api.nvim_set_current_buf(target.bufnr)
					vim.api.nvim_win_set_cursor(0, { target.lnum + 1, target.col })
				end

				map("n", "]d", function()
					goto_diagnostic_global("next")
				end, { desc = "Next diagnostic" })

				map("n", "[d", function()
					goto_diagnostic_global("prev")
				end, { desc = "Previous diagnostic" })
			end,
		},
	},
}
