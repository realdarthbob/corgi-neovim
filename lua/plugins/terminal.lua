return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<leader>t]],
      direction = "horizontal",
      size = 15,
      shade_terminals = true,
    })
  end,
}
