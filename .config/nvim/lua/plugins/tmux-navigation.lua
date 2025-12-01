local map = vim.keymap.set

return {
	"https://github.com/alexghergh/nvim-tmux-navigation",
	config = function()
		local nvim_tmux_nav = require("nvim-tmux-navigation")
		nvim_tmux_nav.disable_when_zoomed = true
		map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
		map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
		map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
		map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
	end,
}
