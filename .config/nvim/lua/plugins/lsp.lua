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
				map({ "n" }, "K", vim.lsp.buf.hover, {})
				map("n", "<leader>cr", vim.lsp.buf.rename, {})
				map("n", "<leader>lf", vim.lsp.buf.format, {})

				map("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", {})
				map("n", "gr", "<cmd>FzfLua lsp_references<CR>", {})
				map("n", "gI", "<cmd>FzfLua lsp_implementations<CR>", {})
				map("n", "gy", "<cmd>FzfLua lsp_typedefs<CR>", {})
				map("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", {})
				map("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", {})
			end,
		},
	},
}
