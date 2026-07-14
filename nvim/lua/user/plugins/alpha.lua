return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
    [[  ▄▄▄▄ ▄▄▄▄── ▄▄▄▄─▄▄▄  ▄▄▄▄─▄▄▄  ▄▄▄▄─▄▄▄▄ ▄▄▄▄ ▄▄▄▄ ▄▄▄▄─▄▄▄▄ ▄▄▄▄── ▄▄▄▄──]],
    [[  ████ ████─  ████ ████ ████ ████ ████─████ ████─████ ▀▀▀▀─▄▄▄▄ ████─  ████  ]],
    [[──▀▀▀▀ ▀▀▀▀── ▀▀▀▀─▀▀▀  ▀▀▀▀─▀▀▀  ▀▀▀▀ ▀▀▀▀ ▀▀▀▀ ▀▀▀▀ ▀▀▀▀─▀▀▀▀ ▀▀▀▀── ▀▀▀▀──]],
      }
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find File", "<cmd>lua require('telescope.builtin').find_files()<cr>"),
        dashboard.button("r", "  Recent Files", "<cmd>lua require('telescope.builtin').oldfiles()<cr>"),
        dashboard.button("g", "  Find Text", "<cmd>lua require('telescope.builtin').live_grep()<cr>"),
        dashboard.button("c", "  Config", "<cmd>edit $MYVIMRC<cr>"),
        dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<cr>"),
        dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
      }

      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end

      dashboard.section.footer.val = {
        "🅙🅔🅓🅓🅐🅗🅢🅔🅒",
      }
      dashboard.section.footer.opts.hl = "Comment"

      dashboard.config.layout = {
        { type = "padding", val = 1 },
        dashboard.section.header,
        { type = "padding", val = 1 },
        dashboard.section.buttons,
        { type = "padding", val = 1 }, 
        dashboard.section.footer,
      }

      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          pcall(function() require("lualine").hide() end)
          vim.opt.laststatus = 0
        end,
      })
      vim.api.nvim_create_autocmd("BufUnload", {
        buffer = 0,
        callback = function()
          pcall(function() require("lualine").hide({ unhide = true }) end)
          vim.opt.laststatus = 3
        end,
      })
      alpha.setup(dashboard.opts)
    end,
  },
}
