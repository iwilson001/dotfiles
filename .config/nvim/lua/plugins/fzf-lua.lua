local map = vim.keymap.set
local ONE_HUNDRED_KB = 1024 * 100

return {
	"https://github.com/ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").setup({
			-- default profiles are border-fused + hide
			-- TODO: try adding 'bat' for better syntax highlighting
			{ "max-perf", "border-fused", "hide" },
			oldfiles = { include_current_session = true },
			previewers = { builtin = { syntax_limit_b = ONE_HUNDRED_KB } },
			code_actions = {
				previewer = vim.fn.executable("delta") == 1 and "codeaction_native" or nil,
			},
		})

		local fzf_lua = require("fzf-lua")

		map("n", "<leader>sf", fzf_lua.files, { desc = "[S]earch for [f]iles? VSCode Ctrl + p equivalent" })
		map("n", "<leader>sh", fzf_lua.grep_project, { desc = "[S]earc[h] for text" })
		map({ "n", "v", "x" }, "<leader>sr", function()
			fzf_lua.grep_project({ resume = true })
		end, {})

		map("n", "<leader>saf", function()
			fzf_lua.files({
				cmd = "rg --files --no-ignore --hidden --follow -g '!.git'",
			})
		end, { desc = "[S]earch for [a]ll [f]iles" })
		map("n", "<leader>saw", function()
			fzf_lua.live_grep({
				cmd = "rg --no-ignore --hidden --follow --color=never --line-number --column -g !.git",
			})
		end, { desc = "[S]earch for [a]ll [w]ords" })

		-- registers fzf-lua for ui things like code actions
		fzf_lua.register_ui_select()
	end,
}
