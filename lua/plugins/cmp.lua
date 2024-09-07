return {
  "nvim-cmp",
  dependencies = {
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
          disable_inline_completion = true,
          keymaps = {
            accept_suggestion = "<tab>",
            clear_suggestion = "<A-c>",
            accept_word = "<A-w>",
          },
          log_level = "off",
        })
      end,
    },
    {
      "onsails/lspkind.nvim",
    },
  },
  keys = {
    { "<tab>", false, mode = { "i", "s" } },
    { "<s-tab>", false, mode = { "i", "s" } },
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
