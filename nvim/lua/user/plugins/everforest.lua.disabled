-- Color scheme: Everforest Dark

return {
  'neanias/everforest-nvim',
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    local everforest = require('everforest')

    everforest.setup({
      -- Background modes: 'soft', 'medium', or 'hard'
      background = 'medium',
      transparent_background_level = 0,
      ui_contrast = 'high',
      dim_inactive_windows = false,

      -- Diagnostics and signs
      diagnostic_line_highlight = false,
      diagnostic_virtual_text = 'coloured',

      -- Custom highlight groups to match the Telescope/NeoTree layout
      on_highlights = function(hl, palette)
        -- Telescope styling
        hl.TelescopeNormal = { bg = palette.bg_dim, fg = palette.fg }
        hl.TelescopeBorder = { bg = palette.bg_dim, fg = palette.bg_dim }
        hl.TelescopePromptNormal = { bg = palette.bg0 }
        hl.TelescopePromptBorder = { bg = palette.bg0, fg = palette.bg0 }
        hl.TelescopePromptTitle = { bg = palette.bg0, fg = palette.green }
        hl.TelescopePreviewTitle = { bg = palette.bg_dim, fg = palette.bg_dim }
        hl.TelescopeResultsTitle = { bg = palette.bg_dim, fg = palette.bg_dim }

        -- Floating Terminal
        hl.Floaterm = { bg = palette.bg0 }
        hl.FloatermBorder = { bg = palette.bg0, fg = palette.bg0 }

        -- Neo-tree styling
        hl.NeoTreeNormal = { bg = palette.bg_dim }
        hl.NeoTreeNormalNC = { bg = palette.bg_dim }
        hl.NeoTreeWinSeparator = { fg = palette.bg_dim, bg = palette.bg_dim }
        hl.NeoTreeFileNameOpened = { fg = palette.orange }
        hl.NeoTreeTabActive = { bg = palette.bg_dim, fg = palette.fg, bold = true }
        hl.NeoTreeTabInactive = { bg = palette.bg0, fg = palette.grey0 }

        -- UI Elements & Lines
        hl.StatusLine = { bg = palette.bg_dim, fg = palette.fg }
        hl.MsgArea = { bg = palette.bg_dim }

        -- Line numbers
        hl.LineNrAbove = { fg = palette.grey0 }
        hl.LineNr = { fg = palette.grey1 }
        hl.LineNrBelow = { fg = palette.grey0 }

        -- Git & Plugins
        hl.GitSignsCurrentLineBlame = { fg = palette.grey0 }
        hl.CopilotSuggestion = { fg = palette.grey0 }
        hl.IblIndent = { fg = palette.bg1 }
        hl.IblScope = { fg = palette.grey0 }
      end,
    })

    -- Enable Everforest with dark mode
    vim.o.background = 'dark'
    everforest.load()
  end,
}
