-- Plugin for searching files 

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<D-F>", function() require("telescope.builtin").find_files() end, desc = "Find files" },
    { "<D-A><D-F>", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
    { "<D-f><D-b>", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
    { "<D-f>", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Search in current file" },
    { "<D-f><D-h>", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
  },
  config = function()
    require("telescope").setup({})
  end,
}
