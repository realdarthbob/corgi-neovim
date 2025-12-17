-- Plugin for syntax highlighting

local km = require("keymaps.treesitter")

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "rust",
      "javascript",
      "java",
      "json",
      "toml",
      "yaml",
      "markdown",
    },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true,
    },

    textobjects = {
      lsp_interop = { enable = true },
      select = {
        enable = true,
        lookahead = true,
        keymaps = km.select,
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = km.move_next_start,
        goto_previous_start = km.move_prev_start,
      },
      swap = {
        enable = true,
        swap_next = km.swap_next,
        swap_previous = km.swap_prev,
      },
    }
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
