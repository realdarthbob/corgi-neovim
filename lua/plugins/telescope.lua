-- Plugin for searching files 

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>F", function() require("telescope.builtin").find_files() end, desc = "Find files" },
    { "<leader>e", function() require("telescope.builtin").oldfiles() end, desc = "Show old files" },
    { "<leader>AF", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
    { "<leader>f<leader>b", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
    { "<leader>f", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Search in current file" },
    { "<leader>f<leader>h", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
  },
  config = function()
    require("telescope").setup({})
  end,
}
