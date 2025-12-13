local M = {}

M.keys = {
  { "<F5>",       function() require("dap").continue() end,          desc = "DAP continue" },
  { "<leader>so", function() require("dap").step_over() end,         desc = "DAP step over" },
  { "<leader>si", function() require("dap").step_into() end,         desc = "DAP step into" },
  { "<leader>sO", function() require("dap").step_out() end,          desc = "DAP step out" },
  { "<leader>DB", function() require("dap").toggle_breakpoint() end, desc = "DAP breakpoint" },
  {
    "<leader>BC",
    function()
      require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end,
    desc = "DAP conditional breakpoint",
  },
  { "<leader>DR", function() require("dap").repl.open() end, desc = "DAP repl" },
  { "<leader>DL", function() require("dap").run_last() end,  desc = "DAP run last" },
  { "<leader>DX", function() require("dap").terminate() end, desc = "DAP terminate" },
}

return M
