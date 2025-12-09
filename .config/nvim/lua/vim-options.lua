vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	callback = function()
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

vim.o.mouse = "a"

vim.o.showmode = false

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- git signs column
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- vim.o.ttimeout = true
-- vim.o.ttimeoutlen = 0

-- Tabs vs spaces
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.o.splitright = true
vim.o.splitbelow = true

-- TODO: `:help 'list'` && `:help 'listchars'`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.inccommand = "split"

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

vim.o.winborder = "rounded"

vim.o.background = "dark"

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.keymap.set

-- copying and deleting
map({ "n", "x" }, "<leader>y", '"+y')
map({ "n", "x" }, "<leader>d", '"+d')

-- clear highlights on search on <Esc> when in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- copying and deleting
map({ "n", "x" }, "<leader>y", '"+y')
map({ "n", "x" }, "<leader>d", '"+d')

-- clear highlights on search on <Esc> when in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd("FileType", {
	-- c – auto-wrap comments using textwidth
	-- r – auto-insert comment leader on pressing Enter
	-- o – auto-insert comment leader when using o or O
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})
