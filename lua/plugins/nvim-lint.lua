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
      -- linters_by_ft = {
      --   javascript = { "eslint" },
      --   javascriptreact = { "eslint" },
      --   typescript = { "eslint" },
      --   typescriptreact = { "eslint" },
      --   vue = { "eslint" },
      -- },
    },
    init = function()
      -- Wrap try_lint to set ESLINT_D_ROOT and silently change cwd so
      -- eslint_d resolves the correct app in a monorepo.
      -- We avoid opts.cwd because nvim-lint's with_cwd uses vim.cmd.cd()
      -- which prints the directory path to the command line.
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyLoad",
        callback = function(event)
          if event.data == "nvim-lint" then
            local lint = require("lint")
            local original_try_lint = lint.try_lint

            lint.try_lint = function(names, opts)
              opts = opts or {}
              local linters = names or lint._resolve_linter_by_ft(vim.bo.filetype)
              local needs_cwd = false
              for _, name in ipairs(type(linters) == "table" and linters or { linters }) do
                if name == "eslint_d" or name == "eslint" then
                  needs_cwd = true
                  break
                end
              end

              if needs_cwd then
                local root = vim.fs.root(0, { "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs" })
                if root then
                  vim.env.ESLINT_D_ROOT = root
                  local prev_cwd = vim.fn.getcwd()
                  if prev_cwd ~= root then
                    vim.cmd("silent cd " .. vim.fn.fnameescape(root))
                    original_try_lint(names, opts)
                    vim.cmd("silent cd " .. vim.fn.fnameescape(prev_cwd))
                    return
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
