local M = {}

M.on_attach = function(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  map("n", "K", vim.lsp.buf.hover, "Hover")
  map("n", "gl", function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      scope = "cursor",
      border = "rounded",
      source = "always",
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

return M
