return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      -- Adding this as a dependency because some of the default lsps were removed
      -- See https://github.com/nvimtools/none-ls.nvim/discussions/81 for more information
      "nvimtools/none-ls-extras.nvim",
    },
    opts = function(_, opts)
      local nls = require("null-ls")

      opts.sources = vim.list_extend(opts.sources, {
        nls.builtins.formatting.stylelint,
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,

        nls.builtins.diagnostics.actionlint,
        nls.builtins.diagnostics.yamllint,
        nls.builtins.formatting.gofmt,
        nls.builtins.diagnostics.golangci_lint,
        require("none-ls.diagnostics.eslint_d"),

        require("none-ls.code_actions.eslint_d"),
        nls.builtins.code_actions.impl,
      })
    end,
  },
}
