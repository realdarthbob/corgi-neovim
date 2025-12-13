local util = require("lspconfig.util")

return {
  rust_analyzer = {
    root_dir = util.root_pattern("app/Cargo.toml", "Cargo.toml", ".git"),
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = "clippy",
        },
        inlayHints = {
          bindingModeHints = { enable = false },
        },
        rustfmt = {
          enable = true,
        },
      },
    },
  },

  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },

  jsonls = {
    before_init = function(_, config)
      config.settings.json.schemas =
          config.settings.json.schemas or {}
      vim.list_extend(
        config.settings.json.schemas,
        require("schemastore").json.schemas()
      )
    end,
    settings = {
      json = {
        format = { enable = true },
        validate = { enable = true },
      },
    },
  },

  yamlls = {
    settings = {
      yaml = {
        format = { enable = true },
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = require("schemastore").yaml.schemas(),
        validate = true,
        keyOrdering = false,
      },
      redhat = {
        telemetry = { enabled = false },
      },
    },
  },

  dockerls = {},
}
