-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.winbar = "%=%m %f"
vim.opt.wrap = true
vim.g.autoformat = true

-- NOTE: Lsp does not work well with monorepos
-- vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.root_spec = { { ".git", "lua" }, "cwd" }

-- Set to false to disable auto format
vim.g.lazyvim_eslint_auto_format = false

-- Disable all animations
vim.g.snacks_animate = false
