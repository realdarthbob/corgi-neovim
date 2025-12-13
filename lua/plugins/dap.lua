return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  keys = require("keymaps.dap").keys,
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.listeners.after.event_initialized["dapui"] = function()
      dapui.open()
    end

    dapui.setup({
      layouts = {
        {
          elements = {
            { id = "console", size = 0.5 },
          },
          size = 10,
          position = "bottom",
        },
      },
      controls = {
        enabled = false,
      },
    })

    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb" },
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.rust = {
      {
        name = "Debug (cargo)",
        type = "codelldb",
        request = "launch",
        program = function()
          vim.fn.system({ "cargo", "build" })
          return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        env = { RUST_BACKTRACE = "full" },
      },
    }
  end,
}
