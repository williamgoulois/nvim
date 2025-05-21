return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
  },
  config = function()
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")
    telescope.setup({
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-g>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-t>"] = lga_actions.quote_prompt({ postfix = "-t" }),
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        },
      },
    })
    telescope.load_extension("live_grep_args")
  end,
  keys = {
    { "<leader>/", "<cmd>Telescope live_grep_args<cr>", desc = "Grep with args" },
    { "<leader>sg", "<cmd>Telescope live_grep_args<cr>", desc = "Grep with args" },
    { "<leader>sG", "<cmd>Telescope live_grep_args<cr>", desc = "Grep with args" },
  },
}
