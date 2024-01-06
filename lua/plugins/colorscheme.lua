return {
  { "catppuccin/nvim" },
  { "elvessousa/sobrio" },
  { "folke/edgy.nvim" },
  {
    "miikanissi/modus-themes.nvim",
    name = "modus",
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
  },
  {
    "xiyaowong/transparent.nvim",
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  "EdenEast/nightfox.nvim",
  lazy = true,
}, {
  "lalitmee/cobalt2.nvim",
  lazy = true,
  dependencies = { "tjdevries/colorbuddy.nvim" },
  config = function()
    require("colorbuddy").colorscheme("cobalt2")
    -- Disable spell checking as it is not readable
    vim.o.spell = false
  end,
}, {
  "sainnhe/everforest",
  lazy = true,
}, {
  "Mofiqul/dracula.nvim",
  lazy = true,
}, {
  "rose-pine/neovim",
  name = "rose-pine",
  opts = {
    variant = "moon",
  },
  lazy = true,
}, {
  "folke/tokyonight.nvim",
  optional = true,
  dependencies = {
    -- toggle theme
    {
      "eliseshaffer/darklight.nvim",
      opts = {
        mode = "colorscheme",
        dark_mode_colorscheme = "tokyonight-storm",
        light_mode_colorscheme = "tokyonight-day",
      },
    },
  },
}
