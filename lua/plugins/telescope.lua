-- Plugin for searching files + LSP pickers

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    'nvim-telescope/telescope-ui-select.nvim'
  },
  cmd = "Telescope",

  defaults = {
    file_ignore_patterns = {
      "Library/Mobile% Documents",
      "Library/CloudStorage",
      "Dropbox",
      "%.icloud",

      -- Apple Music
      "Music/iTunes",
      "Music/Music/Media",
      "%.m4p", "%.m4a", "%.aac", "%.mp3",

      -- Photos
      "%.photoslibrary",
      "Pictures/Photos%.library",

      -- Messages
      "Library/Messages",

      -- Mail
      "Library/Mail",

      -- Notes
      "group%.com%.apple%.notes",

      -- Safari / browser
      "Library/Safari",
      "Library/Caches/Safari",

      -- Xcode
      "Library/Developer",
      "Containers/com%.apple%.dt%.Xcode",

      -- General caches
      "Library/Caches",
      "Library/Logs",
    },
  },

  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files({ hidden = true })
      end,
      desc = "Find files",
    },
    {
      "<leader>e",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "Show old files",
    },
    {
      "<leader>F",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live grep",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>f",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      desc = "Search in current file",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Help tags",
    },
    {
      "<leader>FF",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.loop.os_homedir(),
          hidden = true,
          no_ignore = true,
        })
      end,
      desc = "Global file search (entire home)",
    },
    {
      "gd",
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      desc = "LSP definitions",
    },
    {
      "gr",
      function()
        require("telescope.builtin").lsp_references()
      end,
      desc = "LSP references",
    },
    {
      "gi",
      function()
        require("telescope.builtin").lsp_implementations()
      end,
      desc = "LSP implementations",
    },
    {
      "gt",
      function()
        require("telescope.builtin").lsp_type_definitions()
      end,
      desc = "LSP type definitions",
    },
    {
      "ga",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code Action",
    },
    {
      "<leader>ss",
      function()
        require("telescope.builtin").lsp_workspace_symbols()
      end,
      desc = "LSP workspace symbols",
    },
    {
      "<leader>xx",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "[G]it [S]tatus",
    },
    {
      "<leader>gc",
      function()
        require("telescope.builtin").git_commits()
      end,
      desc = "[G]it [C]ommits",
    },
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "[G]it [B]ranches",
    },
  },

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
        find_files = {
          hidden = true,
        },
      },

      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
          }
        }
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
