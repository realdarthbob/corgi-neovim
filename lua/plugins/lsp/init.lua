return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
    "b0o/SchemaStore.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mlsp = require("mason-lspconfig")
    local core = require("plugins.lsp.core")
    local servers = require("plugins.lsp.servers")

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        focusable = false,
        source = "always",
      },
    })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      callback = function()
        if vim.bo.buftype ~= "" or vim.bo.filetype == "NvimTree" then
          return
        end
        local diags = vim.diagnostic.get(
          0,
          { lnum = vim.fn.line(".") - 1 }
        )
        if vim.tbl_isempty(diags) then
          return
        end
        vim.diagnostic.open_float(nil, {
          focusable = false,
          border = "rounded",
          source = "always",
          scope = "cursor",
          close_events = {
            "CursorMoved",
            "CursorMovedI",
            "BufHidden",
            "InsertCharPre",
            "WinLeave",
          },
        })
      end,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(args)
        local clients =
            vim.lsp.get_clients({ bufnr = args.buf })
        for _, client in ipairs(clients) do
          if client.server_capabilities.documentFormattingProvider then
            vim.lsp.buf.format({ async = false })
            return
          end
        end
      end,
    })

    for name, settings in pairs(servers) do
      local config = vim.lsp.config[name]
      settings.on_attach = core.on_attach
      settings.capabilities = core.capabilities
      config = vim.tbl_deep_extend(
        "force",
        config,
        settings or {}
      )
      vim.lsp.config(name, config)
    end

    mlsp.setup({
      ensure_installed = vim.tbl_keys(servers),
    })
  end,
}
