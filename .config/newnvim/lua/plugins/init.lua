return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "pyright", -- Add pyright or "python-lsp-server"
        -- Add other servers as needed
      },
    },
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvimtools/none-ls.nvim", -- null-ls new repo
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Prettier formatter
          null_ls.builtins.formatting.prettier.with({
            filetypes = {
              "html",
              "css",
              "javascript",
              "typescript",
              "json",
              "svelte",
              "markdown",
            },
          }),
        },
      })
    end,
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "python"
      },
    },
  },
}
