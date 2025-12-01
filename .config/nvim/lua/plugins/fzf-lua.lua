local ONE_HUNDRED_KB = 1024 * 100

return {
	"https://github.com/ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").setup({
			oldfiles = { include_current_session = true },
			previewers = { builtin = { syntax_limit_b = ONE_HUNDRED_KB } },
		})

		local fzf_lua = require("fzf-lua")

		local map = vim.keymap.set

		map("n", "<leader>sf", fzf_lua.files, { desc = "[S]earch for [f]iles? VSCode Ctrl + p equivalent" })
		map("n", "<leader>sh", fzf_lua.grep_project, { desc = "[S]earc[h] for text in project" })

        -- registers fzf-lua for ui things like code actions
		fzf_lua.register_ui_select()
	end,
}
