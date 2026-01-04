return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()

			local map = vim.keymap.set

			map("n", "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })

			map("n", "<leader>gb", "<cmd>Gitsigns blame<CR>", { desc = "Git Blame" })
			map("n", "<leader>gbl", "<cmd>Gitsigns blame_line<CR>", { desc = "Git Blame Line" })
		end,
	},
}
