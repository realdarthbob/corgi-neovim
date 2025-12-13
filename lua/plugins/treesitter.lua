-- Plugin for syntax highlighting

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
      select = {
        enable = true,
        lookahead = true,
        include_surrounding_whitespace = true,
      }
    }
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
