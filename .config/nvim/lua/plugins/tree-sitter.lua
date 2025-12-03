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
			"javascript",
			"typescript",
			"json",
			"lua",
            "tsx"
		},
	},
}
