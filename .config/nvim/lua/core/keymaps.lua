-- lua/core/keymaps.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap leader
vim.g.mapleader = " "

-- Common shortcuts
map("n", "<Leader>w", ":w<CR>", opts)
map("n", "<Leader>q", ":q<CR>", opts)
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opts)

