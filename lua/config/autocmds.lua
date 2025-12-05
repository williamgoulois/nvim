-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- local lint = require("lint")
--
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePre", "InsertLeave" }, {
--   callback = function()
--     -- check if eslint config exists
--     if vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript" then
--       local eslintConfigFilenames = {
--         "eslint.config.js",
--         "eslint.config.mjs",
--         "eslint.config.cjs",
--         "eslint.config.ts",
--         "eslint.config.mts",
--         "eslint.config.cts",
--         ".eslintrc.js",
--         ".eslintrc.json",
--         ".eslintrc.cjs",
--       }
--       if vim.fs.root(0, eslintConfigFilenames) == nil then
--         return
--       end
--     end
--
--     lint.try_lint()
--   end,
-- })

local ns = require("lint").get_namespace("eslint_d")
vim.diagnostic.config({ virtual_text = true }, ns)
