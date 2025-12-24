return {
	{

		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			---@param buf integer
			---@param language string
			local function treesitter_try_attach(buf, language)
				-- check if parser exists and load it
				if not vim.treesitter.language.add(language) then
					return
				end
				-- enables syntax highlighting and other treesitter features
				vim.treesitter.start(buf, language)

				-- enables treesitter based folds
				-- for more info on folds see `:help folds`
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

				-- enables treesitter based indentation
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local buf, filetype = args.buf, args.match
					local language = vim.treesitter.language.get_lang(filetype)
					if not language then
						return
					end

					local installed_parsers = require("nvim-treesitter").get_installed("parsers")

					-- only enable treesitter if the parser is installed
					if vim.tbl_contains(installed_parsers, language) then
						-- enable the parser if it is installed
						treesitter_try_attach(buf, language)
						-- else
						-- 	-- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
						-- 	treesitter_try_attach(buf, language)
					end
				end,
			})

			local parsers = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"css",
				"javascript",
				"jsdoc",
				"typescript",
				"tsx",
				"json",
				"jsonc",
				"yaml",
				"rust",
			}

			require("nvim-treesitter").install(parsers)
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-context" },
}
