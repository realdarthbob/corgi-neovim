-- Keymaps

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- If not set elsewhere, you probably want this for proper Cmd+C / Cmd+V
vim.opt.clipboard = "unnamedplus"

-- --------------------------------------------------
-- BASIC
-- --------------------------------------------------
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- --------------------------------------------------
-- WINDOW NAVIGATION
-- --------------------------------------------------
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- --------------------------------------------------
-- OPTION + ARROW  (word jump)
-- --------------------------------------------------
-- move by word
map({ "n", "v" }, "<A-Left>", "b", opts)
-- map({ "n", "v" }, "<A-S-Left>", "viw", opts)
map({ "n", "v" }, "<A-Right>", "w", opts)
-- map({ "n", "v" }, "<A-S-Right>", "e", opts)
map("i", "<A-Left>", "<C-o>b", opts)
map("i", "<A-Right>", "<C-o>w", opts)


-- --------------------------------------------------
-- CMD + ARROW  (line jump / selection)
-- --------------------------------------------------
-- CMD+Left / CMD+Right:
--  - in NORMAL: select from cursor to start/end of line
--  - in VISUAL: move cursor to start/end while keeping selection
--  - in INSERT: same as normal (jump into visual selection)
map({ "n", "v" }, "<D-Left>", "^", opts)
map({ "n", "v" }, "<D-S-Left>", "v^", opts)
map("i", "<D-Left>", "<C-o>^", opts)

map({ "n", "v" }, "<D-Right>", "$", opts)
map({ "n", "v" }, "<D-S-Right>", "v$", opts)
map("i", "<D-Right>", "<C-o>$", opts)

-- -- CMD+Up / CMD+Down → top / bottom of file (no selection)
map({ "n", "v", "i" }, "<D-Up>", "gg", opts)
map({ "n", "v", "i" }, "<D-Down>", "G", opts)

-- --------------------------------------------------
-- SELECTIONS
-- --------------------------------------------------
-- CMD+W → expand line selection
--   normal: select current line
--   visual: add one more line downward each time
map("n", "<D-w>", "V", opts)
map("x", "<D-w>", "j", opts)

-- OPT+W → word selection grow
--   normal: select current word
--   visual: extend selection one word to the right
map("n", "<A-w>", "viw", opts)
map("v", "<A-w>", "e", opts)

-- CMD+A → select whole buffer
map({ "n", "v" }, "<D-a>", "ggVG", opts)

-- --------------------------------------------------
-- COPY / PASTE (system clipboard)
-- --------------------------------------------------
-- COPY:
--   normal: copy current line
--   visual: copy selection
map("n", "<D-c>", '"+yy', opts)
map("x", "<D-c>", '"+y', opts)

-- PASTE:
map("n", "<D-v>", '"+p', opts)
map("x", "<D-v>", '"+p', opts)
map("i", "<D-v>", '<C-r>+', opts)
map("c", "<D-v>", '<C-r>+', opts)

-- --------------------------------------------------
-- UNDO / REDO
-- --------------------------------------------------
map({ "n", "v" }, "<D-z>", "u", opts)
map("i", "<D-z>", "<C-o>u", opts)

map({ "n", "v" }, "<D-Z>", "<C-r>", opts)
map("i", "<D-Z>", "<C-o><C-r>", opts)

-- --------------------------------------------------
-- CMD+DEL  (delete whole line)
-- --------------------------------------------------
-- On macOS “Delete” is Backspace; forward delete is <Del>.
-- We map both Cmd+Backspace and Cmd+Delete to "delete line".
map("n", "<D-BS>", "dd", opts)
map("i", "<D-BS>", "<Esc>dd", opts)
map("x", "<D-BS>", "d", opts)

map("n", "<D-Del>", "dd", opts)
map("i", "<D-Del>", "<Esc>dd", opts)
map("x", "<D-Del>", "d", opts)

-- --------------------------------------------------
-- CMD+D  (duplicate line / selection)
-- --------------------------------------------------
-- Normal: duplicate current line
map("n", "<D-d>", "yyp", opts)

-- Visual: duplicate selection just below
map("x", "<D-d>", "y'>p", opts)

-- --------------------------------------------------
-- CMD+SHIFT+T  (toggle terminal)
-- --------------------------------------------------
map({ "n", "t" }, "<D-T>", "<cmd>ToggleTerm<CR>", opts)
