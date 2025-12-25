return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>1", "<cmd>Neotree filesystem toggle reveal<CR>", desc = "Explorer (reveal file)" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      window = {
        position = "float",
        popup = {
          size = {
            height = "80%",
            width = "60%",
          },
          position = "50%",
          border = "rounded",
        },
        mappings = {
          ["<CR>"] = "open",
          ["q"] = "close_window",
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = false,
            },
          },
        },
      },
      filesystem = {
        preview = { enabled = true },
        filtered_items = { hide_dotfiles = false },
        follow_current_file = { enabled = true, leave_dirs_open = true },
        use_libuv_file_watcher = true,
        group_empty_dirs = true,
      },
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then
          vim.cmd("Neotree filesystem show")
        end
      end,
    })
  end,
}
