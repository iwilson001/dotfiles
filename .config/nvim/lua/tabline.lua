local function listed_buffers()
	local buffers = {}
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[bufnr].buflisted then
			table.insert(buffers, bufnr)
		end
	end
	return buffers
end

function _G.a_render()
	local tabline = ""
	for _, bufnr in ipairs(listed_buffers()) do
		local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
		tabline = tabline .. " " .. name .. " "
	end
	return tabline
end

-- TODO: comment in when done
vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.a_render()"
vim.cmd("redrawtabline")
