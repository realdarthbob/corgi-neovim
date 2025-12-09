-- =============================================================================
-- NEOVIDE JETBRAINS KEYMAP
-- =============================================================================

-- Enable IDE-like selection behavior
vim.opt.keymodel = "startsel,stopsel"
vim.opt.selectmode = "mouse,key"
vim.opt.selection = "exclusive"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function set_map(modes, lhs, rhs, desc)
  vim.keymap.set(modes, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- --------------------------------------------------
-- 1. SYSTEM & CLIPBOARD
-- --------------------------------------------------
vim.opt.clipboard = "unnamedplus"

set_map({ "n", "i", "v", "s" }, "<D-s>", "<cmd>w<CR>", "Save file")

-- Copy / Paste / Cut (Includes Select Mode 's')
set_map({ "v", "s" }, "<D-c>", '"+y', "Copy selection")
set_map("n", "<D-c>", '"+yy', "Copy line")
set_map({ "n", "v", "s" }, "<D-v>", '"+p', "Paste")
set_map("i", "<D-v>", '<C-r>+', "Paste in insert")
set_map("c", "<D-v>", '<C-r>+', "Paste in command")
set_map({ "v", "s" }, "<D-x>", '"+d', "Cut selection")
set_map("n", "<D-x>", '"+dd', "Cut line")

-- Undo / Redo (Includes Select Mode 's')
set_map({ "n", "v", "s" }, "<D-z>", "u", "Undo")
set_map("i", "<D-z>", "<C-o>u", "Undo in insert")
set_map({ "n", "v", "s" }, "<D-S-z>", "<C-r>", "Redo")
set_map("i", "<D-S-z>", "<C-o><C-r>", "Redo in insert")

-- Select All
set_map({ "n", "v", "i", "s" }, "<D-a>", "<Esc>ggVG", "Select All")


-- --------------------------------------------------
-- 2. NAVIGATION & SELECTION
-- --------------------------------------------------

-- Option + Left/Right (Jump by Word)
set_map({ "n", "v", "s" }, "<A-Left>", "b", "Jump word left")
set_map({ "n", "v", "s" }, "<A-Right>", "e", "Jump word right")
set_map("i", "<A-Left>", "<C-o>b", "Jump word left")
set_map("i", "<A-Right>", "<C-o>e", "Jump word right")

-- Cmd + Left/Right (Start/End of Line)
set_map({ "n", "v", "s" }, "<D-Left>", "0", "Start of line")
set_map({ "n", "v", "s" }, "<D-Right>", "$", "End of line")
set_map("i", "<D-Left>", "<C-o>0", "Start of line")
set_map("i", "<D-Right>", "<C-o>$", "End of line")

-- Cmd + Up/Down (Top/Bottom of file)
set_map({ "n", "v", "s" }, "<D-Up>", "gg", "Top of file")
set_map({ "n", "v", "s" }, "<D-Down>", "G", "Bottom of file")
set_map("i", "<D-Up>", "<C-o>gg", "Top of file")
set_map("i", "<D-Down>", "<C-o>G", "Bottom of file")

-- Shift + Option + Arrows (Word Selection) - Uses Select Mode 'gh'
set_map("i", "<S-A-Left>", "<Esc>ghb", "Select Word Left")
set_map("i", "<S-A-Right>", "<Esc>ghe", "Select Word Right")
set_map("n", "<S-A-Left>", "ghb", "Select Word Left")
set_map("n", "<S-A-Right>", "ghe", "Select Word Right")
set_map({ "v", "s" }, "<S-A-Left>", "b", "Extend Word Left")
set_map({ "v", "s" }, "<S-A-Right>", "e", "Extend Word Right")

-- Shift + Cmd + Arrows (Line Selection) - Uses Select Mode 'gh'
set_map("i", "<S-D-Left>", "<Esc>gh0", "Select to Start")
set_map("i", "<S-D-Right>", "<Esc>gh$", "Select to End")
set_map("n", "<S-D-Left>", "gh0", "Select to Start")
set_map("n", "<S-D-Right>", "gh$", "Select to End")
set_map({ "v", "s" }, "<S-D-Left>", "0", "Extend to Start")
set_map({ "v", "s" }, "<S-D-Right>", "$", "Extend to End")

-- Cmd + W (Extend Selection) and Option + W (Shrink Selection)
set_map({ "n", "v", "s" }, "<D-w>", ":<C-u>lua require('nvim-treesitter.incremental_selection').node_incremental()<CR>", "Extend Selection")
set_map({ "n", "v", "s" }, "<A-w>", ":<C-u>lua require('nvim-treesitter.incremental_selection').node_decremental()<CR>", "Shrink Selection")


-- --------------------------------------------------
-- 3. EDITING ACTIONS
-- --------------------------------------------------

-- Cmd + Backspace (Delete to Line Start)
set_map("i", "<D-BS>", "<C-u>", "Delete to line start")
set_map("n", "<D-BS>", "d0", "Delete to line start")

-- Option + Backspace (Delete Word)
set_map("i", "<A-BS>", "<C-w>", "Delete word backward")
set_map("n", "<A-BS>", "db", "Delete word backward")

-- Backspace/Delete in Selection (Works in both Select and Visual Mode)
set_map("s", "<BS>", "<BS>", "Delete selection")
set_map("s", "<Del>", "<BS>", "Delete selection")
set_map("v", "<BS>", '"_d', "Delete selection")
set_map("v", "<Del>", '"_d', "Delete selection")

-- Duplicate Line (Cmd + D)
set_map("n", "<D-d>", "yyp", "Duplicate line")
set_map("i", "<D-d>", "<Esc>yypa", "Duplicate line insert")
set_map({ "v", "s" }, "<D-d>", "yP", "Duplicate selection")

-- Comment Line (Cmd + /)
set_map("n", "<D-/>", "gcc", "Toggle comment")
set_map({ "v", "s" }, "<D-/>", "gc", "Toggle comment selection")
set_map("i", "<D-/>", "<C-o>gcc", "Toggle comment")

-- Find (Cmd + F) -> Search
set_map({ "n", "v", "s" }, "<D-f>", "/", "Find")
set_map("i", "<D-f>", "<Esc>/", "Find")

-- Replace (Cmd + R) -> Substitute
set_map("n", "<D-r>", ":%s/", "Replace")


-- --------------------------------------------------
-- 4. WINDOWS & TABS
-- --------------------------------------------------

-- Close Tab/Window
set_map("n", "<leader>q", ":q<CR>", "Quit")

-- New File (Cmd+N)
set_map("n", "<D-n>", ":enew<CR>", "New file")

-- Go to Definition (Cmd + B)
set_map("n", "<D-b>", "gd", "Go to definition")
