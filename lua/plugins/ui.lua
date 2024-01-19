return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2500,
    },
  },

  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<tab>", "<Cmd>BufferLineMoveNext<CR>", desc = "Next tab" },
      { "<S-tab>", "<Cmd>BufferLineMovePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        separator_style = "slant",
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- globalstatus = false,
        -- theme = "solarized_dark",
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
 
 ██░ ██ ▒██   ██▒  ██████   ▄████   ▄████   ██████ ▒███████▒
▓██░ ██▒▒▒ █ █ ▒░▒██    ▒  ██▒ ▀█▒ ██▒ ▀█▒▒██    ▒ ▒ ▒ ▒ ▄▀░
▒██▀▀██░░░  █   ░░ ▓██▄   ▒██░▄▄▄░▒██░▄▄▄░░ ▓██▄   ░ ▒ ▄▀▒░ 
░▓█ ░██  ░ █ █ ▒   ▒   ██▒░▓█  ██▓░▓█  ██▓  ▒   ██▒  ▄▀▒   ░
░▓█▒░██▓▒██▒ ▒██▒▒██████▒▒░▒▓███▀▒░▒▓███▀▒▒██████▒▒▒███████▒
 ▒ ░░▒░▒▒▒ ░ ░▓ ░▒ ▒▓▒ ▒ ░ ░▒   ▒  ░▒   ▒ ▒ ▒▓▒ ▒ ░░▒▒ ▓░▒░▒
 ▒ ░▒░ ░░░   ░▒ ░░ ░▒  ░ ░  ░   ░   ░   ░ ░ ░▒  ░ ░░░▒ ▒ ░ ▒
 ░  ░░ ░ ░    ░  ░  ░  ░  ░ ░   ░ ░ ░   ░ ░  ░  ░  ░ ░ ░ ░ ░
 ░  ░  ░ ░    ░        ░        ░       ░       ░    ░ ░    
                                                   ░        
    ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
