return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          -- visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
          },
        },
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["m"] = {
            "move",
            config = {
              show_path = "relative", -- "none", "relative", "absolute"
            },
          },
        },
      },
    },
  },
}
