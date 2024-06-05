return {
  "nvim-cmp",
  dependencies = {
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({})
      end,
    },
    {
      "onsails/lspkind.nvim",
    },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local lspkind = require("lspkind")
    table.insert(opts.sources, 1, {
      name = "supermaven",
      group_index = 1,
      priority = 100,
    })
    opts.formatting = {
      format = require("lspkind").cmp_format({
        mode = "symbol",
        max_width = 50,
        symbol_map = { Supermaven = "" },
      }),
    }
    vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" })
  end,
}
