-- Plugin for tree view of files

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  keys = {
    -- { "<leader>1", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
  },

  config = function()
    local api = require("nvim-tree.api")

    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
      },
      on_attach = function(bufnr)
        require("keymaps.nvim-tree").on_attach(bufnr)
      end,
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then
          api.tree.open()
        end
      end,
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if vim.bo.filetype ~= "NvimTree" then
          api.tree.find_file({ open = false, focus = false })
        end
      end,
    })
  end,
}
