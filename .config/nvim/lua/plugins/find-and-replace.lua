local map = vim.keymap.set

return {
	{
		-- Notes:
		-- <leader>c - close
		-- <leader>f - refresh
		-- <leader>r - replace
		"MagicDuck/grug-far.nvim",
		-- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
		-- additional lazy config to defer loading is not really needed...
		config =  function()
			local grug_far = require("grug-far")

			map("n", "<leader>fr", grug_far.open, {})

			map("n", "<leader>frw", function()
				grug_far.open({ prefills = { search = vim.fn.expand("<cword>") } })
			end, { desc = "find and replace current word under cursor" })

			map("v", "<leader>frv", function()
				grug_far.with_visual_selection()
			end, { desc = "find and replace current visual selection" })

			-- this would replace :%s so only do if needed
			-- map("n", "<leader>frf", function()
			-- 	grug_far.open({ prefills = { paths = vim.fn.expand("%") } })
			-- end)
		end,
	},
}
