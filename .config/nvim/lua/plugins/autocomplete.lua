return {
	{
		-- to authenticate, run `:Copilot auth`
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		dependencies = {
			"copilotlsp-nvim/copilot-lsp",
		},
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<Tab>",
						accept_word = "",
					},
				},
			})
		end,
		-- opts = {
		-- 	-- suggestion = { enabled = false },
		-- 	-- panel = { enabled = false },
		-- 	-- filetypes = {
		-- 	-- 	markdown = true,
		-- 	-- 	help = true,
		-- 	-- },
		-- },
	},

	{
		"saghen/blink.cmp",
		version = "1.*",
		-- dependencies = { "fang2hou/blink-copilot" },
		opts = {
			keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept" },
				["<C-Space>"] = { "show" },
			},
			fuzzy = { implementation = "prefer_rust" },
			sources = {
				default = { "lsp", "buffer", "snippets", "path" },
				-- providers = {
				-- 	copilot = {
				-- 		name = "copilot",
				-- 		module = "blink-copilot",
				-- 		score_offset = 100,
				-- 		async = true,
				-- 	},
				-- },
			},
			completion = {
				menu = {
					auto_show = true,
				},
				-- TODO: see if we want this or nah
				-- Show documentation when selecting a completion item
				documentation = { auto_show = true, auto_show_delay_ms = 300 },
				list = {
					selection = { preselect = true, auto_insert = false },
				},
			},
		},
	},
}
