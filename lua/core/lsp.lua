local map = vim.keymap.set



if vim.lsp and vim.lsp.buf then
  local lsp = vim.lsp.buf

  map("n", "gdc", lsp.definition, opts)
  map("n", "gi", lsp.implementation, opts)
  map("n", "<C-CR>", lsp.code_action, opts)
  map("n", "<F2>", lsp.rename, opts)
  map("n", "<leader>k", lsp.hover, opts)
  map("n", "<leader>S-o", lsp.document_symbol, opts)
  map("n", "gr", function()
      lsp.references({ includeDeclaration = false })
    end
  )
end
