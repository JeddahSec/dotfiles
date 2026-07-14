-- Color scheme

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  opts = {
    flavour = 'mocha', --  mocha أو frappe حسب رغبتك
    transparent_background = false,
    term_colors = true,
    integrations = {
      neotree = true,
      telescope = { enabled = true },
      bufferline = true,
      gitsigns = true,
      indent_blankline = { enabled = true },
    },
    custom_highlights = function(colors)
      return {
        TelescopeNormal = { bg = colors.mantle, fg = colors.text },
        TelescopeBorder = { bg = colors.mantle, fg = colors.mantle },

        TelescopePromptNormal = { bg = colors.crust },
        TelescopePromptBorder = { bg = colors.crust, fg = colors.crust },
        TelescopePromptTitle = { bg = colors.crust, fg = colors.teal },
        TelescopePreviewTitle = { bg = colors.mantle, fg = colors.mantle },
        TelescopeResultsTitle = { bg = colors.mantle, fg = colors.mantle },

        Floaterm = { bg = colors.crust },
        FloatermBorder = { bg = colors.crust, fg = colors.crust },

        NeoTreeTabActive = { bg = colors.mantle, fg = colors.text, bold = true },
        NeoTreeTabInactive = { bg = colors.surface0, fg = colors.overlay0 },
        NeoTreeTabSeparatorActive = { bg = colors.mantle, fg = colors.mantle },
        NeoTreeTabSeparatorInactive = { bg = colors.mantle, fg = colors.mantle },
        NeoTreeTabHeader = { bg = colors.mantle, fg = colors.subtext0 },
        NeoTreeNormal = { bg = colors.mantle },
        NeoTreeNormalNC = { bg = colors.mantle },
        NeoTreeWinSeparator = { fg = colors.mantle, bg = colors.mantle },
        NeoTreeFileNameOpened = { fg = colors.orange },
        BufferlineInactive = { bg = colors.mantle },
        BufferlineActiveSeparator = { bg = colors.base, fg = colors.mantle },
        BufferlineInactiveSeparator = { bg = colors.mantle, fg = colors.mantle },
        TabActive = { bg = colors.base },
        TabActiveSeparator = { bg = colors.base, fg = colors.mantle },
        TabInactive = { bg = colors.mantle },
        TabInactiveSeparator = { bg = colors.mantle, fg = colors.mantle },

        SidebarTabActive = { bg = colors.mantle },
        SidebarTabActiveSeparator = { bg = colors.mantle, fg = colors.mantle },
        SidebarTabInactive = { bg = colors.mantle, fg = colors.overlay0 },
        SidebarTabInactiveSeparator = { bg = colors.mantle, fg = colors.mantle },
        StatusLine = { bg = colors.mantle, fg = colors.text },
        StatusLineComment = { bg = colors.mantle, fg = colors.overlay0 },

        -- Git
        GitSignsCurrentLineBlame = { fg = colors.surface1 },

        LineNrAbove = { fg = colors.surface1 },
        LineNr = { fg = colors.surface2 },
        LineNrBelow = { fg = colors.surface1 },

        MsgArea = { bg = colors.mantle },

        SpellBad = { undercurl = true, sp = '#7F3A43' },

        IblIndent = { fg = colors.surface0 },
        IblScope = { fg = colors.surface2 },

        CopilotSuggestion = { fg = colors.overlay0 },
      }
    end,
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme('catppuccin')
  end,
}
