return {
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = function()
      return {
        tools = {
          autoSetHints = true,
          inlay_hints = {
            only_current_line = true,
            show_parameter_hints = false,
            lsp_blacklist = { "rust-analyzer" },
          },
        },
        server = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
                features = "all",
                allTargets = false,
              },
              inlayHints = {
                bindingModeHints = { enable = false },
              },
            },
          },
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            vim.keymap.set("n", "gd", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show Diagnostics" })

            vim.api.nvim_create_autocmd("CursorHold", {
              buffer = bufnr,
              callback = function()
                vim.diagnostic.open_float(nil, { scope = "cursor" })
              end,
            })
          end,
        },
      }
    end,
  },
}
