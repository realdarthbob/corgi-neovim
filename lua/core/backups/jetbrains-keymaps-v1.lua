-- =============================================================================
-- neovide jetbrains keymap
-- =============================================================================

-- ensure mapleader is set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function set_map(modes, lhs, rhs, desc)
  vim.keymap.set(modes, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- --------------------------------------------------
-- 1. system & clipboard
-- --------------------------------------------------
vim.opt.clipboard = "unnamedplus"

set_map({ "n", "i", "v" }, "<d-s>", "<cmd>w<cr>", "save file")

-- copy / paste / cut
set_map("v", "<d-c>", '"+y', "copy selection")
set_map("n", "<d-c>", '"+yy', "copy line") 
set_map({ "n", "v" }, "<d-v>", '"+p', "paste")
set_map("i", "<d-v>", '<c-r>+', "paste in insert")
set_map("c", "<d-v>", '<c-r>+', "paste in command")
set_map("v", "<d-x>", '"+d', "cut selection")
set_map("n", "<d-x>", '"+dd', "cut line")

-- undo / redo
set_map({ "n", "v" }, "<d-z>", "u", "undo")
set_map("i", "<d-z>", "<c-o>u", "undo in insert")
set_map({ "n", "v" }, "<d-s-z>", "<c-r>", "redo")
set_map("i", "<d-s-z>", "<c-o><c-r>", "redo in insert")

-- select all
set_map({ "n", "v", "i" }, "<d-a>", "<esc>ggvg", "select all")


-- --------------------------------------------------
-- 2. navigation (arrows, words, lines)
-- --------------------------------------------------

-- option + left/right (jump by word)
set_map({ "n", "v" }, "<a-left>", "b", "jump word left")
set_map({ "n", "v" }, "<a-right>", "e", "jump word right") 
set_map("i", "<a-left>", "<c-o>b", "jump word left")
set_map("i", "<a-right>", "<c-o>e", "jump word right")

-- cmd + left/right (start/end of line)
set_map({ "n", "v" }, "<d-left>", "0", "start of line")
set_map({ "n", "v" }, "<d-right>", "$", "end of line")
set_map("i", "<d-left>", "<c-o>0", "start of line")
set_map("i", "<d-right>", "<c-o>$", "end of line")

-- cmd + up/down (top/bottom of file)
set_map({ "n", "v" }, "<d-up>", "gg", "top of file")
set_map({ "n", "v" }, "<d-down>", "G", "bottom of file")
set_map("i", "<d-up>", "<c-o>gg", "top of file")
set_map("i", "<d-down>", "<c-o>G", "bottom of file")


-- --------------------------------------------------
-- 3. selection (shift + arrows) - fixed
-- --------------------------------------------------

-- shift + arrows (character selection)
set_map("i", "<s-left>", "<esc>v<left>", "select left")
set_map("i", "<s-right>", "<esc>v<right>", "select right")
set_map("i", "<s-up>", "<esc>v<up>", "select up")
set_map("i", "<s-down>", "<esc>v<down>", "select down")

-- but strictly mapping them ensures consistency:
set_map("v", "<s-left>", "<left>", "extend left")
set_map("v", "<s-right>", "<right>", "extend right")
set_map("v", "<s-up>", "<up>", "extend up")
set_map("v", "<s-down>", "<down>", "extend down")

-- shift + option + arrows (word selection)
set_map("n", "<s-a-left>", "vb", "select word left")
set_map("n", "<s-a-right>", "ve", "select word right")

set_map("i", "<s-a-left>", "<esc>vb", "select word left")
set_map("i", "<s-a-right>", "<esc>ve", "select word right")

set_map("v", "<s-a-left>", "b", "extend word left")
set_map("v", "<s-a-right>", "e", "extend word right")

-- shift + cmd + arrows (line selection)
set_map("n", "<s-d-left>", "v0", "select to start")
set_map("n", "<s-d-right>", "v$", "select to end")

set_map("i", "<s-d-left>", "<esc>v0", "select to start")
set_map("i", "<s-d-right>", "<esc>v$", "select to end")

set_map("v", "<s-d-left>", "0", "extend to start")
set_map("v", "<s-d-right>", "$", "extend to end")

set_map("n", "<d-a>", "ggVG", "Select all")


-- --------------------------------------------------
-- 4. editing actions
-- --------------------------------------------------

-- cmd + backspace (delete to line start)
set_map("i", "<d-bs>", "<c-u>", "delete to line start")
set_map("n", "<d-bs>", "d0", "delete to line start")

-- option + backspace (delete word)
set_map("i", "<a-bs>", "<c-w>", "delete word backward")
set_map("n", "<a-bs>", "db", "delete word backward")

-- option + backspace (delete selection)
set_map("v", "<BS>", '"_d', "Delete selection")
set_map("v", "<Del>", '"_d', "Delete selection")

-- duplicate line (cmd + d)
set_map("n", "<d-d>", "yyp", "duplicate line")
set_map("v", "<d-d>", "yp", "duplicate selection")
set_map("i", "<d-d>", "<esc>yypa", "duplicate line insert")

-- comment line (cmd + /)

set_map("n", "<d-/>", "gcc", "toggle comment")
set_map("v", "<d-/>", "gc", "toggle comment selection")
set_map("i", "<d-/>", "<c-o>gcc", "toggle comment")

-- find (cmd + f) -> search
set_map({ "n", "v" }, "<d-f>", "/", "find")
set_map("i", "<d-f>", "<esc>/", "find")

-- replace (cmd + r) -> substitute
set_map("n", "<d-r>", ":%s/", "replace")


-- --------------------------------------------------
-- 5. windows & tabs
-- --------------------------------------------------

-- close tab/window 
-- mapped to leader+q because cmd+w is used for selection
set_map("n", "<leader>q", ":q<cr>", "quit")

-- new file (cmd+n)
set_map("n", "<d-n>", ":enew<cr>", "new file")

-- go to definition (cmd + b)
set_map("n", "<d-b>", "gd", "go to definition")
