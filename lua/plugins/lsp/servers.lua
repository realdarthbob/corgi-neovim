return {
  rust_analyzer = {
    --  root_dir = util.root_pattern("app/Cargo.toml", "Cargo.toml", ".git"),
    ft = { "rust" },
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = true,
        check = {
          command = "clippy"
        },
        inlayHints = {
          typeHints = { enable = true },
          parameterHints = { enable = true },
          chainingHints = { enable = true },
          closingBraceHints = { enable = true },
          bindingModeHints = { enable = false },
        },
        rustfmt = {
          enable = true,
        },
      },
      diagnostics = {
        enable = true,
        experimental = {
          enable = true,
        },
      },
    },
  },

  jdtls = {
    settings = {
      java = {
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

  taplo = {
    settings = {
      taplo = {
        format = {
          enable = true,
        },
      },
    },
  }
}
