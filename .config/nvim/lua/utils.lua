local M = {}

function M.get_visual_selection()
	-- Escape <esc> to reliably leave visual mode (optional, but good practice)
	local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
	vim.api.nvim_feedkeys(esc, "x", false)

	local vstart = vim.fn.getpos("'<")
	local vend = vim.fn.getpos("'>")

	-- Get the text region and join lines with newline
	local visual_text = table.concat(vim.fn.getregion(vstart, vend), "\n")
	return visual_text
end

return M
