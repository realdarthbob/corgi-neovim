return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local mlsp = require("mason-lspconfig")

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          focusable = false,
          source = "if_many",
        },
      })

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        callback = function()
          if vim.bo.buftype ~= "" or vim.bo.filetype == "NvimTree" then
            return
          end

          local diags = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
          if vim.tbl_isempty(diags) then
            return
          end

          vim.diagnostic.open_float(nil, {
            focusable = false,
            border = "rounded",
            source = "if_many",
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

      local on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        map("n", "gl", function()
          vim.diagnostic.open_float(nil, {
            focusable = false,
            scope = "cursor",
            border = "rounded",
            source = "if_many",
          })
        end, "Line Diagnostics")
        map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")

        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          pcall(function()
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end)
        end
      end

      local servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = { command = "clippy" },
              inlayHints = { bindingModeHints = { enable = false } },
              rustfmt = { enable = true },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          },
        },
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
          local clients = vim.lsp.get_clients({ bufnr = args.buf })
          for _, client in ipairs(clients) do
            if client.server_capabilities.documentFormattingProvider then
              vim.lsp.buf.format({ async = false })
              return
            end
          end
        end,
      })

      mlsp.setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
        handlers = {
          function(server_name)
            local config = vim.lsp.config[server_name]()
            if not config then return end

            config.on_attach = on_attach
            local extra = servers[server_name]
            if extra then
              config = vim.tbl_deep_extend("force", config, extra)
            end

            vim.lsp.start(config)
          end,
        },
      })
    end,
  },
}
