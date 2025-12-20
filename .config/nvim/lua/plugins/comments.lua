return {
	-- TODO: this doesn't even appear to do anything in the context of react so idk if
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			pre_hook = function()
				return vim.bo.commentstring
			end,

			mappngs = {
				basic = true,
				extra = false,
			},
			ignore = "^$",
		})
	end,
	lazy = false,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter",
	},
}
