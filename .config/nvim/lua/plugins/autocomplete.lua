return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = {
			preset = "enter",
			["<C-y>"] = { "select_and_accept" },
			["<C-Space>"] = { "show" },
		},
		fuzzy = { implementation = "prefer_rust" },
		completion = {
			menu = {
				-- don't auto show so I can manually trigger w/ <C-Space> instead
				auto_show = true,
			},
			-- TODO: see if we want this or nah
			-- Show documentation when selecting a completion item
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
		},
	},
}
