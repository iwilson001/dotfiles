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
				-- need to include vim motion to add, ex: hello -> 'hello' requires saiw', or easier, sai"'
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				replace = "sr", -- Replace surrounding
			},
		},
	},
}
