local M = {}

function M.on_attach(bufnr)
  local gs = package.loaded.gitsigns
  if not gs then
    return
  end

  local map = vim.keymap.set
  local opts = { buffer = bufnr, silent = true }

  map("n", "]h", gs.next_hunk, opts)
  map("n", "[h", gs.prev_hunk, opts)

  map("n", "<leader>hs", gs.stage_hunk, opts)
  map("n", "<leader>hr", gs.reset_hunk, opts)
  map("n", "<leader>hS", gs.stage_buffer, opts)
  map("n", "<leader>hu", gs.undo_stage_hunk, opts)
  map("n", "<leader>hR", gs.reset_buffer, opts)
  map("n", "<leader>hp", gs.preview_hunk, opts)
  map("n", "<leader>hb", function()
    gs.blame_line({ full = true })
  end, opts)
end

return M
