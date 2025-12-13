-- Plugin for terminal

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = false,
      direction = "horizontal",
      size = 15,
      shade_terminals = true,
    })
  end,
}
