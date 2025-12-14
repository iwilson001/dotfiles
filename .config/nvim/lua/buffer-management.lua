-- purpose: use neovim buffers isntead of VSCode-like tabs
local map = vim.keymap.set

map({ "n", "v", "x" }, "<leader>ls", "<cmd>ls<CR>", { desc = "list active buffers" })

map({ "n", "v", "x" }, "<leader>bd", "<cmd>bd<CR>", { desc = "[B]uffer [d]elete" })

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

map({ "n", "v", "x" }, "<leader>bp", "<cmd>:bprev<CR>", { desc = "[B]uffer [p]revious" })
map({ "n", "v", "x" }, "<leader>bn", "<cmd>:bnext<CR>", { desc = "[B]uffer [n]ext" })

map({ "n", "v", "x" }, "<leader>bcl", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf < current and vim.api.nvim_buf_is_loaded(buf) then
			pcall(vim.api.nvim_buf_delete, buf, { force = false })
		end
	end
end, { desc = "[B]uffer [c]lose [l]eft" })

map({ "n", "v", "x" }, "<leader>bcr", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf > current and vim.api.nvim_buf_is_loaded(buf) then
			pcall(vim.api.nvim_buf_delete, buf, { force = false })
		end
	end
end, { desc = "[B]uffer [c]lose [r]ight" })

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
local MAX_BUFFER_INDEX = 9
for i = MIN_BUFFER_INDEX, MAX_BUFFER_INDEX do
	map("n", "<leader>" .. i, function()
		BufferGoTo(i)
	end, { desc = "[B]uffer at index: " .. i })
end
