-- purpose: use neovim buffers isntead of VSCode-like tabs
local map = vim.keymap.set

map({ "n", "v" }, "<leader>ls", "<cmd>ls<CR>", { desc = "list active buffers" })
