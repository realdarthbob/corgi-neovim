local map = vim.keymap.set

if vim.lsp and vim.lsp.buf then
  local lsp = vim.lsp.buf

  -- Cmd+B → Go to declaration / definition
  map("n", "<D-b>", lsp.definition, opts)

  -- Cmd+Alt+B (approx) → Go to implementations
  map("n", "<A-D-b>", lsp.implementation, opts)

  -- Alt+Enter → Quick actions / intentions
  map("n", "<A-CR>", lsp.code_action, opts)

  -- Shift+F6 (IntelliJ) ≈ F2 here → Rename
  map("n", "<F2>", lsp.rename, opts)

  -- Cmd+K → Quick documentation (like mouse hover)
  map("n", "<D-k>", lsp.hover, opts)

  -- Cmd+Shift+O → document symbols (like “Go to symbol in file”)
  map("n", "<D-S-o>", lsp.document_symbol, opts)
end
