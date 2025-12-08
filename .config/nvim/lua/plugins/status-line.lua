return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "gruvbox_dark",
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						"buffers",
						mode = 2,
						buffers_color = {
							-- -- Same values as the general color option can be used here.
							-- active = "lualine_a_normal", -- Color for active buffer.
							-- inactive = "lualine_a_inactive", -- Color for inactive buffer.
							active = { fg = "#fabd2f", bg = "#32302f", gui = "bold" }, -- more contrast
							inactive = { fg = "#a89984", bg = "#3c3836" },
							-- active = { fg = "#fabd2f", bg = "#504945", gui = "bold" }, -- active buffer
							-- inactive = { fg = "#d5c4a1", bg = "#3c3836" },
						},
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},
}
