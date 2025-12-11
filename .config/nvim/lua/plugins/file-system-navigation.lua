return {
	{
		"stevearc/oil.nvim",
		-- Optional dependencies
		dependencies = { "nvim-mini/mini.icons" },
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		config = function()
			local map = vim.keymap.set

			require("oil").setup({
				default_file_explorer = true,
				columns = { "icon" },
				view_options = {
					show_hidden = true,
				},
			})
			map({ "n" }, "<leader>e", "<cmd>Oil<CR>", { desc = "open oil file explorer" })
		end,
	},

	"https://github.com/antosha417/nvim-lsp-file-operations",
}
