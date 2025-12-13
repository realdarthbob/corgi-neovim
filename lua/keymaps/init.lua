local map = vim.keymap.set

vim.opt.keymodel = "startsel,stopsel"
vim.opt.selectmode = "mouse,key"
vim.opt.selection = "exclusive"

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"

-- Duplicate Line (Cmd + D)
map("n", "<leader>d", "yyp", { desc = "Duplicate line" })
map({ "v", "s" }, "<leader>d", "yP", { desc = "Duplicate selection" })

-- Repeat recording on selected lines
map("x", "@a", ":<C-u>normal @a<CR>", { silent = true })

---------------------------------------------------------------------
-- Searching & Cursor Centering
---------------------------------------------------------------------

-- Keep cursor centered when jumping to search results
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Keep cursor centered when using J to join lines
map("n", "J", "mzJ`z")

---------------------------------------------------------------------
-- Window Navigation (move between splits)
---------------------------------------------------------------------

map("n", "<C-h>", "<C-w>h") -- Move to left window
map("n", "<C-j>", "<C-w>j") -- Move to window below
map("n", "<C-k>", "<C-w>k") -- Move to window above
map("n", "<C-l>", "<C-w>l") -- Move to right window

---------------------------------------------------------------------
-- Window Resizing
---------------------------------------------------------------------

map("n", "<C-Up>", ":resize +2<CR>")             -- Increase height
map("n", "<C-Down>", ":resize -2<CR>")           -- Decrease height
map("n", "<C-Left>", ":vertical resize -2<CR>")  -- Make window narrower
map("n", "<C-Right>", ":vertical resize +2<CR>") -- Make window wider

---------------------------------------------------------------------
-- Buffer Navigation (switch between open files)
---------------------------------------------------------------------

map("n", "<S-l>", ":bnext<CR>")        -- Next buffer
map("n", "<S-h>", ":bprevious<CR>")    -- Previous buffer
map("n", "<leader>bd", ":bdelete<CR>") -- Close current buffer
map("n", "<leader>q", "<cmd>q<CR>")
map("n", "<leader>w", "<cmd>w<CR>")
---------------------------------------------------------------------
-- Indentation Improvements
---------------------------------------------------------------------

map("v", "<", "<gv") -- Keep visual selection when indenting left
map("v", ">", ">gv") -- Keep visual selection when indenting right

---------------------------------------------------------------------
-- Move Lines Up & Down (very common)
---------------------------------------------------------------------

-- Move selected lines down
map("v", "J", ":m '>+1<CR>gv=gv")

-- Move selected lines up
map("v", "K", ":m '<-2<CR>gv=gv")

---------------------------------------------------------------------
-- Paste Behavior Fix (keeps clipboard untouched)
---------------------------------------------------------------------

map("v", "p", '"_dP') -- Paste without overwriting the default register

---------------------------------------------------------------------
-- Terminal
-----------------------------------------------------------------------
-- map("n", "<leader>t", function() vim.cmd("belowright 15split | terminal") end, { desc = "Open Terminal"})
map("n", "<leader>t", "<cmd>ToggleTerm<CR>", {
  noremap = true,
  silent = true,
  desc = "Toggle terminal",
})
---------------------------------------------------------------------
-- Terminal Mode Escape (important for using built-in terminal)
---------------------------------------------------------------------

map("t", "<Esc>", [[<C-\><C-n>]]) -- Exit terminal insert mode back to normal mode
