return {
  {
    {
      "williamboman/mason.nvim",
      {
        opt = function(_, opts)
          table.insert(opts.ensure_installed, "stylelint")
          table.insert(opts.ensure_installed, "gopls")
          table.insert(opts.ensure_installed, "goimports")
        end,
      },
    },
  },
}
