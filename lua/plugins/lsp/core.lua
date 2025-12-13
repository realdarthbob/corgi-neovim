local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.on_attach = require("keymaps.lsp").on_attach

return M
