return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"html",
			"css",
			"c",
			"markdown",
			"markdown_inline",
			"javascript",
			"jsdoc",
			"typescript",
			"tsx",
			"json",
			"jsonc",
			"lua",
			"yaml",
		},
	},
}
