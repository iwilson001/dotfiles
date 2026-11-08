return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept" },
				["<C-Space>"] = { "show" },
			},
			fuzzy = { implementation = "prefer_rust" },
			sources = {
				default = { "lsp", "buffer", "snippets", "path" },
			},
			completion = {
				menu = {
					auto_show = true,
				},
				documentation = { auto_show = true, auto_show_delay_ms = 300 },
				list = {
					selection = { preselect = true, auto_insert = false },
				},
			},
		},
	},
}
