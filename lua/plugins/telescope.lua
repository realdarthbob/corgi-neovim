-- Plugin for file explorer

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  cmd = "Telescope",
  keys = require("keymaps.telescope").keys,
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
          prompt_position = "top",
        },
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          "target/",
          "dist/",
          "build/",
          "coverage/",

          "Library/Mobile% Documents",
          "Library/CloudStorage",
          "Dropbox",
          "%.icloud",

          "Music/iTunes",
          "Music/Music/Media",
          "%.m4p",
          "%.m4a",
          "%.aac",
          "%.mp3",

          "%.photoslibrary",
          "Pictures/Photos%.library",

          "Library/Messages",
          "Library/Mail",
          "group%.com%.apple%.notes",
          "Library/Safari",
          "Library/Caches/Safari",
          "Library/Developer",
          "Containers/com%.apple%.dt%.Xcode",
          "Library/Caches",
          "Library/Logs",
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<Esc>"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = { hidden = true },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
