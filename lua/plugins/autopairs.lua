-- Auto Entering and closing pairs

return {
  {
    "windwp/nvim-autopairs",
    dependencies = {
      "hrsh7th/cmp-nvim-lua"
    },
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        fast_wrap = {},
      })
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
