-- Keymaps

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Window navigation (optional)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Option + Arrow
map("n", "<A-Left>", "b", opts)
map("n", "<A-Right>", "w", opts)
map("i", "<A-Left>", "<C-o>b", opts)
map("i", "<A-Right>", "<C-o>w", opts)

--  Command + Arrow
map({ "n", "v" }, "<D-Left>", "^", opts)
map({ "n", "v" }, "<D-Right>", "$", opts)
map("i", "<D-Left>", "<C-o>^", opts)
map("i", "<D-Right>", "<C-o>&", opts)
map({ "n", "v", "i" }, "<D-Up>", "gg", opts)
map({ "n", "v", "i" }, "<D-Down>", "G", opts)

-- Selections
map({ "n", "v" }, "<D-a>", "ggVG", opts)

-- Copy / Paste
map({"n", "v", "i"}, "<D-c>", "y", opts)
map({ "n", "v" }, "<D-v>", '"+p', opts)
map("i", "<D-v>", '<C-r>+', opts)

-- Undo / Redo
map({ "n", "v" }, "<D-z>", "u", opts)
map("i", "<D-z>", "<C-o>u", opts)

map({ "n", "v" }, "<D-Z>", "<C-r>", opts)
map("i", "<D-Z>", "<C-o><C-r>", opts)

