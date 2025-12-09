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
-- map("n", "<A-Left>", "<C-o>b", opts)
-- map("n", "<M-f>", "<C-o>w", opts)
map("n", "<M-b>", "b", opts)
map("n", "<M-f>", "w", opts)

--  Command + Arrow
map("n", "<Home>", "0", opts)
map("n", "<End>", "$", opts)
map("n", "<leader><Up>", "gg", opts)
map("n", "<leader><Down>", "G", opts)
