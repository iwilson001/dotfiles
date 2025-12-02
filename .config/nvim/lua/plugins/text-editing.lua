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
}
