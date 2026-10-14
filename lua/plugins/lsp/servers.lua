local platform = require("core.platform")

local servers = {
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
        rucstfmt = {
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

  -- jdtls = {
  --   settings = {
  --     java = {
  --     },
  --   },
  -- },

  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },

  kotlin_language_server = {
    settings = {
      kotlin = {
        compiler = {
          jvm = {
            target = "25",
          },
        },
        linting = {
          debounceTime = 250,
        },
        completion = {
          snippets = {
            enabled = true,
          },
        },
      },
    },
  },

  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      }
    }
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

  pyright = {

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

  dockerls = {},

  taplo = {
    settings = {
      taplo = {
        format = {
          enable = true,
        },
      },
    },
  },
}

if not platform.is_windows then
  servers.bashls = {
    settings = {
      formatters_by_ft = {
        sh   = { "shfmt" },
        bash = { "shfmt" },
        zsh  = { "shfmt" },
      },
    },
  }
end

if platform.is_windows then
  servers.powershell_es = {
    settings = {
      powershell = {
        codeFormatting = {
          preset = "OTBS",
        },
      },
    },
  }
end

return servers
