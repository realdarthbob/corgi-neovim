local M = {}

M.keys = {
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
    desc = "Global file search",
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
    desc = "Git status",
  },
  {
    "<leader>gc",
    function()
      require("telescope.builtin").git_commits()
    end,
    desc = "Git commits",
  },
  {
    "<leader>gb",
    function()
      require("telescope.builtin").git_branches()
    end,
    desc = "Git branches",
  },
  {
    "ga",
    function()
      vim.lsp.buf.code_action()
    end,
    desc = "Code Action",
  },
  {
    "rn",
    vim.lsp.buf.rename,
    desc = "Rename"
  }
}

return M
