local function listed_buffers()
	local buffers = {}
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[bufnr].buflisted then
			table.insert(buffers, bufnr)
		end
	end
	return buffers
end

-- local GLOBAL_HIGHLIGHT_NAMESPACE_ID = 0
-- local TABLINE_PREFIX = "TabLine"
-- vim.api.nvim_set_hl(GLOBAL_HIGHLIGHT_NAMESPACE_ID, TABLINE_PREFIX .. "Active", {
-- 	fg = "#ffffff",
-- 	bg = "#005f87",
-- 	bold = true,
-- })

function _G.render()
	local tabline = ""
	for _, bufnr in ipairs(listed_buffers()) do
		local is_current_buffer = bufnr == vim.api.nvim_get_current_buf()

		if is_current_buffer then
			tabline = tabline .. "%#TabLineSel#"
		else
			tabline = tabline .. "%#TabLine#"
		end

		local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
		tabline = tabline .. " " .. name .. " "
	end
	return tabline
end

-- TODO: comment in when done
vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.render()"
vim.cmd("redrawtabline")
