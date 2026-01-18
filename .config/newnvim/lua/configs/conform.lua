local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "prettier" },
    css = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    python = { "black", "isort" },
    php = { "intelephense" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    --   -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       html = { "prettier" },
  --       css = { "prettier" },
  --       javascript = { "prettier" },
  --       typescript = { "prettier" },
  --       json = { "prettier" },
  --       python = { "black", "isort" },
  --     },
  --     format_on_save = {
  --       timeout_ms = 500,
  --       lsp_fallback = true,
  --     },
  --   },
  -- },
}

return options
