return {
	{
		"stevearc/oil.nvim",
		-- Optional dependencies
		dependencies = { "nvim-mini/mini.icons", "https://github.com/antosha417/nvim-lsp-file-operations" },
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
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-mini/mini-icons",
	-- 	},
	-- 	config = function()
	-- 		local neo_tree = require("neo-tree").setup({
	--
	--            })
	--
	-- 		vim.diagnostic.config({
	-- 			signs = {
	-- 				text = {
	-- 					[vim.diagnostic.severity.ERROR] = "",
	-- 					[vim.diagnostic.severity.WARN] = "",
	-- 					[vim.diagnostic.severity.INFO] = "",
	-- 					[vim.diagnostic.severity.HINT] = "󰌵",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"antosha417/nvim-lsp-file-operations",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
	-- 	},
	-- 	config = function()
	-- 		require("lsp-file-operations").setup()
	-- 	end,
	-- },
}
