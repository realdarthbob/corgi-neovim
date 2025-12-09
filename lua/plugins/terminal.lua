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

    vim.keymap.set({ "n", "t" }, "<D-S-t>", "<cmd>ToggleTerm<CR>", {
      noremap = true,
      silent = true,
      desc = "Toggle terminal",
    })
  end,
}
