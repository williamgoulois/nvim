return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        vue = { "eslint_d" },
      },
    },
    init = function()
      -- Wrap try_lint to pass cwd for eslint_d (ESLint v9 flat config support)
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyLoad",
        callback = function(event)
          if event.data == "nvim-lint" then
            local lint = require("lint")
            local original_try_lint = lint.try_lint

            lint.try_lint = function(names, opts)
              opts = opts or {}
              if not opts.cwd then
                local linters = names or lint._resolve_linter_by_ft(vim.bo.filetype)
                for _, name in ipairs(type(linters) == "table" and linters or { linters }) do
                  if name == "eslint_d" or name == "eslint" then
                    opts.cwd = vim.fs.root(0, { "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs" })
                    break
                  end
                end
              end
              return original_try_lint(names, opts)
            end
          end
        end,
      })
    end,
  },
}
