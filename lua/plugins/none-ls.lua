return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, {
        -- nls.builtins.diagnostics.sylelint,
        nls.builtins.formatting.stylelint,
        nls.builtins.formatting.gofmt,
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.goimports,
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.eslint_d,
        -- nls.builtins.linting.eslint_d,
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.code_actions.impl,
        nls.builtins.formatting.gofumpt,
        nls.builtins.diagnostics.golangci_lint,
      })
    end,
  },
}
