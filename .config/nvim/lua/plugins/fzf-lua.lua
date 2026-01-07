local map = vim.keymap.set
local ONE_HUNDRED_KB = 1024 * 100

return {
	"https://github.com/ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").setup({
			-- default profiles are border-fused + hide
			-- If perf degrades too much, we can go back to borderless, but it not showing file titles would be annoying :/
			{ "borderless-full", "hide" },
			oldfiles = { include_current_session = true },
			previewers = { builtin = { syntax_limit_b = ONE_HUNDRED_KB } },
			code_actions = {
				previewer = vim.fn.executable("delta") == 1 and "codeaction_native" or nil,
			},
			files = {
				formatter = "path.filename_first",
			},
			winopts = {
				height = 0.9,
				width = 0.9,
				preview = {
					-- TODO: remove one of these height settings
					-- layout = "horizontal",
					-- horizontal = "right:50%",
					layout = "vertical",
					vertical = "down:70%",
				},
			},
		})

		local fzf_lua = require("fzf-lua")

		map("n", "<leader>/f", fzf_lua.files, { desc = "[S]earch for [f]iles? VSCode Ctrl + p equivalent" })
		map("n", "<leader>/af", function()
			fzf_lua.files({
				cmd = "rg --files --no-ignore --hidden --follow -g '!.git'",
			})
		end, { desc = "[S]earch for [a]ll [f]iles" })

		map("n", "<leader>/", function()
			require("fzf-lua").live_grep({
				rg_opts = table.concat({
					"--column",
					"--line-number",
					"--no-heading",
					"--color=always",
					"--smart-case",
					"--hidden",
					"--follow",
					"--glob=!.git/*",
				}, " "),
			})
		end, { desc = "global / for text" })
		map("n", "<leader>/a", function()
			fzf_lua.live_grep({
				cmd = "rg --no-ignore --hidden --follow --color=never --line-number --column -g !.git -g !.pnpm",
			})
		end, { desc = "global / for [a]ll text" })

		map({ "n", "v", "x" }, "<leader>/r", function()
			fzf_lua.live_grep({ resume = true })
		end, { desc = "[s]earch [r]esume" })

		map("n", "<leader>/d", function()
			fzf_lua.files({
				fd_opts = '--type d --exclude ".git"',
			})
		end, { desc = "Find directory" })

		-- TODO: figure out if it's possible to look for dir first, then search. This code doesn't work
		-- map("n", "<leader>/d/", function()
		-- 	fzf_lua.files({
		-- 		prompt = "Search in dir> ",
		-- 		fd_opts = "--type d",
		-- 		actions = {
		-- 			["default"] = function(selected)
		-- 				fzf_lua.live_grep_native({
		-- 					cwd = selected[1],
		-- 				})
		-- 			end,
		-- 		},
		-- 	})
		-- end, {})

		-- registers fzf-lua for ui things like code actions
		fzf_lua.register_ui_select()
	end,
}
