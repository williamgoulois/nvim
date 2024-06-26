return {
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "codestral", -- The default model to use.
      display_mode = "split", -- The display mode. Can be "float" or "split".
      show_prompt = true, -- Shows the prompt submitted to Ollama.
      show_model = true, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = true, -- Never closes the window automatically.
      debug = false, -- Prints errors and the command which is run.
    },
  },
}
