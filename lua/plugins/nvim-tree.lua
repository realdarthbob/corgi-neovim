-- Plugin for visualizing tree

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  keys = {
    { "<D-1>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer (Cmd+1)" },
    { "<D-n>", function()
        require("nvim-tree.api").tree.open()
        require("nvim-tree.api").fs.create()
      end,
      desc = "Create file in NvimTree",
    },
    { "<D-R>", function()
        require("nvim-tree.api").fs.rename()
      end,
      desc = "Rename file in NvimTree",
    },
  },
  config = function()
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
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then
          require("nvim-tree.api").tree.open()
        end
      end,
    })
    
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if vim.fn.winnr("$") == 1 and vim.bo.filetype == "NvimTree" then
          vim.cmd("quit")
        end
      end,
    })
   
  end,
}
 
