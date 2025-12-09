-- General Vim options

local opt = vim.opt
local g = vim.g

-- Disable netrw (since we use nvim-tree)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true

-- Tabs / indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Scrolling
opt.scrolloff = 5

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Clipboard
opt.clipboard = "unnamedplus"
