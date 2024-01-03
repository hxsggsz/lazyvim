return {
  {
    "williamboman/mason.nvim",
    opt = function(_, opts)
      table.insert(opts.ensure_installed, "stylelint")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.stylelint,
        nls.builtins.formatting.stylelint,
      })
    end,
  },
}
