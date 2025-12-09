return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    -- Existing Mappings
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
    local tree_api = require("nvim-tree.api")
    
    local function on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      tree_api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "<D-c>", tree_api.fs.copy.node, opts("Copy File/Folder"))
      vim.keymap.set("n", "<D-x>", tree_api.fs.cut, opts("Cut File/Folder"))
      vim.keymap.set("n", "<D-v>", tree_api.fs.paste, opts("Paste File/Folder"))
      
      vim.keymap.set("n", "<BS>", tree_api.fs.remove, opts("Delete File/Folder"))
      
      vim.keymap.set("n", "<CR>", tree_api.node.open.edit, opts("Open"))
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
