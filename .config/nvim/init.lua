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

vim.o.winborder = 'rounded'

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- background color
vim.o.background = 'dark'

-- package management
-- the repos are stored at: .local/nvim/site/pack/core/opt, I had to rm -rf opt to get oil working
vim.pack.add({
	{ src = 'https://github.com/ellisonleao/gruvbox.nvim',        name = 'gruvbox', version = 'main' },
	{ src = 'https://github.com/stevearc/oil.nvim',               name = 'oil',     version = 'master' },
	{ src = 'https://github.com/nvim-mini/mini.nvim',             name = 'mini',    version = 'main' },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = 'https://github.com/ibhagwan/fzf-lua' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/saghen/blink.cmp',                version = 'main' },
	{ src = 'https://github.com/antosha417/nvim-lsp-file-operations', version = 'master' }
})

require('gruvbox').setup({ contrast = 'soft' })
vim.cmd('colorscheme gruvbox')

require('mini.icons').setup()
require('mini.git').setup()
require('mini.diff').setup()
require('mini.statusline').setup()

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls', 'ts_ls', 'cssls' }
})

vim.lsp.config['lua_ls'] = {
	-- Command and arguments to start the server.
	cmd = { 'lua-language-server' },
	-- Filetypes to automatically attach to.
	filetypes = { 'lua' },
	-- Sets the "workspace" to the directory where any of these files is found.
	-- Files that share a root directory will reuse the LSP server connection.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
	-- Specific settings to send to the server. The schema is server-defined.
	-- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			}
		}
	}
}

vim.lsp.enable('lua_ls')
-- vim.lsp.config('lua_ls')

require('blink.cmp').setup()

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.keymap.set

-- fzf-lua
map('n', '<leader>sf', '<cmd>FzfLua files<CR>', { desc = '[S]earch for [f]iles? VSCode Ctrl + p equivalent' })
map('n', '<leader>sh', '<cmd>FzfLua grep_project<CR>', { desc = '[S]earc[h] for text in project' })

map('n', '<leader>lf', vim.lsp.buf.format)

-- oil.nvim
require('oil').setup({
	default_file_explorer = true,
	columns = { 'icon' },
	view_options = {
		show_hidden = true,
	},
})
map({ "n" }, "<leader>e", "<cmd>Oil<CR>")

-- copying and deleting
map({ "n", "x" }, "<leader>y", '"+y')
map({ "n", "x" }, "<leader>d", '"+d')

-- clear highlights on search on <Esc> when in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
