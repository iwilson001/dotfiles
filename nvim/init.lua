vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a'

vim.o.showmode = false

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- TODO: what is this?
vim.o.signcolumn = 'yes'

-- TODO: what is this?
vim.o.updatetime = 250

-- TODO: what is this?
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

-- TODO: `:help 'list'` && `:help 'listchars'`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

-- clear highlights on search on <Esc> when in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- diagnostic keymap
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })



-- background color
vim.o.background = 'dark'

-- package management
require("config.lazy")
