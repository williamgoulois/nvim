return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["h"] = "close_node",
          ["l"] = "open",
          ["A"] = "add_to_aider",
          ["D"] = "drop_from_aider",
          ["R"] = "read_only_to_aider",
        },
      },
      commands = {
        add_to_aider = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          local cmd = string.format("tmux send-keys -t '.2' '/add %s' Enter", path)
          vim.fn.system(cmd)
        end,
        drop_from_aider = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          local cmd = string.format("tmux send-keys -t '.2' '/drop %s' Enter", path)
          vim.fn.system(cmd)
        end,
        read_only_to_aider = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          local cmd = string.format("tmux send-keys -t '.2' '/read-only %s' Enter", path)
          vim.fn.system(cmd)
        end,
      },
    },
  },
}
