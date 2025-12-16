-- General Vim options

local opt = vim.opt
local g = vim.g

if g.neovide then
  g.neovide_input_macos_option_key_is_meta = 'only_left'
end

opt.keymodel = "startsel,stopsel"
opt.selectmode = "key"

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
opt.tabstop = 4
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

-- Neovide Options
g.neovide_cursor_animation_length = 0
g.neovide_cursor_trail_size = 0
g.neovide_cursor_animate_in_insert_mode = false
g.neovide_cursor_animate_command_line = false
g.neovide_input_use_logo = true
g.neovide_scroll_animation_length = 0

-- Diagnostics

opt.updatetime = 400

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_on_insert = true,
  severity_sort = true,
  float = {
    source = true,
    focusable = false,
    border = "rounded",
  },
})

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
