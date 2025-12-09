return {
	{
		"nvim-mini/mini.pairs",
		version = "*",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			markdown = true,
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			skip_unbalanced = true,
			-- skip autopair for treesitter nodes
			skip_ts = { "string" },
		},
	},
	{
		"nvim-mini/mini.surround",
		version = "*",
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes, need to include vim motion to add, ex: hello -> 'hello' requires saiw', or easier, sai"'
				delete = "gsd", -- Delete surrounding
				replace = "gsr", -- Replace surrounding

				-- NOT USED
				find = "", -- Find surrounding (to the right)
				find_left = "", -- Find surrounding (to the left)
				highlight = "", -- Highlight surrounding
				suffix_last = "", -- Suffix to search with "prev" method
				suffix_next = "", -- Suffix to search with "next" method
				update_n_lines = "",
			},
		},
	},
}
