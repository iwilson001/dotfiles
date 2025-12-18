return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function all_buffer_diagnostics()
				local counts = { 0, 0, 0, 0 }

				for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
					if vim.bo[bufnr].buflisted then
						for _, d in ipairs(vim.diagnostic.get(bufnr)) do
							counts[d.severity] = counts[d.severity] + 1
						end
					end
				end

				local parts = {}
				table.insert(parts, " " .. counts[1])
				table.insert(parts, " " .. counts[2])
				table.insert(parts, " " .. counts[3])
				table.insert(parts, "󰌵 " .. counts[4])

				return table.concat(parts, " ")
			end

			require("lualine").setup({
				options = {
					theme = "gruvbox_dark",
					section_separators = "",
					component_separators = "",
				},

				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff" },
					lualine_c = { all_buffer_diagnostics, { "diagnostics", always_visible = true } },
					-- lualine_c = { {
					-- 	"diagnostics",
					-- 	always_visible = true,
					-- } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},

				tabline = {
					lualine_a = {
						{
							"buffers",
							mode = 2, -- buffer name + index
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
				},

				winbar = {
					lualine_a = {
						{
							"filename",
							path = 1, -- 0: name, 1: relative 2: absolute 3: absolute relative to home 4:
							shortening_target = 100, -- makes room for other components
						},
					},
					lualine_z = {
						"lsp_status",
					},
				},
				inactive_winbar = {},
			})
		end,
	},
}
