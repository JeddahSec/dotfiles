return {
  "hiphish/rainbow-delimiters.nvim",
  event = "BufReadPost",
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    vim.api.nvim_set_hl(0, "RainbowDelimiterVsYellow", { fg = "#179fff" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterVsMagenta", { fg = "#ffd700" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterVsCyan", { fg = "#da70d6" })

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
        python = "rainbow-delimiters",
      },
      highlight = {
        "RainbowDelimiterVsYellow",
        "RainbowDelimiterVsMagenta",
        "RainbowDelimiterVsCyan",
      },
    }
  end,
}
