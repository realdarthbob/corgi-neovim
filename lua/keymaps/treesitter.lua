local M = {}

M.select = {
  ["af"] = "@function.outer",
  ["if"] = "@function.inner",
  ["ac"] = "@class.outer",
  ["ic"] = "@class.inner",
  ["aa"] = "@parameter.outer",
  ["ia"] = "@parameter.inner",
  ["ab"] = "@block.outer",
  ["ib"] = "@block.inner",
}

M.move_next_start = {
  ["]m"] = "@function.outer",
  ["]a"] = "@parameter.outer",
  ["]c"] = "@class.outer",
  ["]b"] = "@block.outer",
}

M.move_prev_start = {
  ["[m"] = "@function.outer",
  ["[a"] = "@parameter.outer",
  ["[c"] = "@class.outer",
  ["[b"] = "@block.outer",
}

M.swap_next = {
  ["<leader>a"] = "@parameter.inner",
}

M.swap_prev = {
  ["<leader>A"] = "@parameter.inner",
}

return M
