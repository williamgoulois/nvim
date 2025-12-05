return {
  "ibhagwan/fzf-lua",
  -- opts will be merged with the parent spec
  opts = { use_diagnostic_signs = true },
  keys = function()
    return {
      { "<leader>sF", Utils.folder_grep, desc = "Search inside folder" },
      { "<leader>sg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      { "<leader>sG", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Grep (cwd)" },
    }
  end,
}
