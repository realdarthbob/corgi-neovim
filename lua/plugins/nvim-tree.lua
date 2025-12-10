-- Plugin for showing tree structure

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>1", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
  },
  
  config = function()
    local tree_api = require("nvim-tree.api")
    
    local function on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      tree_api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "<leader>n", function()
          require("nvim-tree.api").tree.open()
          require("nvim-tree.api").fs.create()
        end,
        opts("Create file in NvimTree")
      ) 
      vim.keymap.set("n", "<leader>R", function()
          require("nvim-tree.api").fs.rename()
        end,
       opts("Rename file in NvimTree")
      )
      vim.keymap.set("n", "<leader>c", tree_api.fs.copy.node, opts("Copy File/Folder"))
      vim.keymap.set("n", "<leader>x", tree_api.fs.cut, opts("Cut File/Folder"))
      vim.keymap.set("n", "<leader>v", tree_api.fs.paste, opts("Paste File/Folder"))
      
      vim.keymap.set("n", "<BS>", tree_api.fs.remove, opts("Delete File/Folder"))
      
      vim.keymap.set("n", "<CR>", tree_api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "s", function() 
          tree_api.node.open.vertical()
        end, 
        opts("Open vertical")
      )
    end
    
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
            git = true, },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
      },
      on_attach = on_attach,
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then
          tree_api.tree.open()
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
