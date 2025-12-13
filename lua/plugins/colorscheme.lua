return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,

  config = function()
    require("catppuccin").setup({
      flavour = "mocha",

      transparent_background = false,
      term_colors = true,

      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
      },

      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        telescope = true,
        which_key = true,
        lsp_trouble = true,
        dap = true,
        dap_ui = true,
        mason = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
