local M = {}

function M.on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  -- Keep default mappings
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "<leader>n", function()
    api.tree.open()
    api.fs.create()
  end, opts("Create file"))

  vim.keymap.set("n", "<leader>r", api.fs.rename, opts("Rename file"))
  vim.keymap.set("n", "<leader>y", api.fs.copy.node, opts("Copy"))
  vim.keymap.set("n", "<leader>x", api.fs.cut, opts("Cut"))
  vim.keymap.set("n", "<leader>p", api.fs.paste, opts("Paste"))
  vim.keymap.set("n", "<leader>d", api.fs.remove, opts("Delete"))

  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "<leader>s", api.node.open.vertical, opts("Open vertical split"))
end

return M
