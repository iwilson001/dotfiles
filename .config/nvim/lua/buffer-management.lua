-- purpose: use neovim buffers isntead of VSCode-like tabs
local map = vim.keymap.set

map({ "n", "v" }, "<leader>ls", "<cmd>ls<CR>", { desc = "list active buffers" })

map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "[B]uffer [d]elete" })

map("n", "<leader>bo", function()
	-- Save cursor + window view
	local view = vim.fn.winsaveview()
	local current = vim.api.nvim_get_current_buf()

	-- Delete all other buffers
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and buf ~= current then
			pcall(vim.api.nvim_buf_delete, buf, { force = true })
		end
	end

	-- Restore view (cursor + scroll position)
	vim.fn.winrestview(view)
end, { desc = "[B]uffer [o]nly" })

-- map("n", "<leader>bo", function()
-- 	vim.cmd("%bd | silent! edit # | bd#")
-- end, { desc = "[B]uffer [o]nly" })

map({ "n" }, "<leader>bp", "<cmd>:bprev<CR>", { desc = "[B]uffer [p]revious" })
map({ "n" }, "<leader>bn", "<cmd>:bnext<CR>", { desc = "[B]uffer [n]ext" })

function BufferGoTo(index)
	local bufs = vim.fn.getbufinfo({ buflisted = 1 })
	table.sort(bufs, function(a, b)
		return a.bufnr < b.bufnr
	end)
	local target = bufs[index]
	if target then
		vim.cmd("buffer " .. target.bufnr)
	end
end

local MIN_BUFFER_INDEX = 1
local MAX_BUFFER_INDEX = 5
for i = MIN_BUFFER_INDEX, MAX_BUFFER_INDEX do
	map("n", "<leader>" .. i, function()
		BufferGoTo(i)
	end, { desc = "[B]uffer at index: " .. i })
end
