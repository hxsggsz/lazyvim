return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")

      opts.sources = vim.list_extend(opts.sources, {
        nls.builtins.formatting.stylelint,
        nls.builtins.diagnostics.actionlint,
        nls.builtins.diagnostics.yamllint,
        nls.builtins.formatting.gofmt,
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.goimports,
        nls.builtins.diagnostics.eslint_d.with({
          name = "eslint_d",
          meta = {
            url = "https://github.com/mantoni/eslint_d.js/",
            description = "Like ESLint, but faster.",
            notes = {
              "Once spawned, the server will continue to run in the background. This is normal and not related to null-ls. You can stop it by running `eslint_d stop` from the command line.",
            },
          },
          command = "eslint_d",
        }),
        nls.builtins.code_actions.eslint_d.with({
          name = "eslint_d",
          command = "eslint_d",
          meta = {
            url = "https://github.com/mantoni/eslint_d.js",
            description = "Injects actions to fix ESLint issues or ignore broken rules. Like ESLint, but faster.",
            notes = {
              "Once spawned, the server will continue to run in the background. This is normal and not related to null-ls. You can stop it by running `eslint_d stop` from the command line.",
            },
          },
        }),
        nls.builtins.code_actions.impl,
        nls.builtins.formatting.gofumpt,
        nls.builtins.diagnostics.golangci_lint,
      })
    end,
  },
}
