-- Color scheme
-- lua/user/plugins/doom-one.lua

-- Doom One palette (matches the hex values doom-one.nvim ships with)
local colors = {
  bg = '#282c34',
  bg_alt = '#21242b',
  fg = '#bbc2cf',
  fg_alt = '#5B6268',
  base = '#1c1f24',
  black = '#1c1f24',
  grey = '#3f444a',
  red = '#ff6c6b',
  orange = '#da8548',
  green = '#98be65',
  teal = '#4db5bd',
  yellow = '#ECBE7B',
  blue = '#51afef',
  dark_blue = '#2257A0',
  magenta = '#c678dd',
  violet = '#a9a1e1',
  cyan = '#46D9FF',
  dark_cyan = '#5699AF',
}

return {
  'NTBBloodbath/doom-one.nvim',
  lazy = false,    -- Load immediately on startup
  priority = 1000, -- Ensure it loads before other UI components
  config = function()
    -- Theme options
    vim.g.doom_one_cursor_coloring = false
    vim.g.doom_one_terminal_colors = true
    vim.g.doom_one_italic_comments = true
    vim.g.doom_one_enable_treesitter = true
    vim.g.doom_one_diagnostics_text_color = false
    vim.g.doom_one_transparent_background = false

    -- doom-one.nvim doesn't natively integrate with neo-tree, bufferline's
    -- sidebar tabs, or telescope's custom groups, so define those ourselves,
    -- the same way the catppuccin config does with `custom_highlights`.
    local function apply_custom_highlights()
      local set_hl = vim.api.nvim_set_hl

      set_hl(0, 'TelescopeNormal', { bg = colors.bg_alt, fg = colors.fg })
      set_hl(0, 'TelescopeBorder', { bg = colors.bg_alt, fg = colors.bg_alt })
      set_hl(0, 'TelescopePromptNormal', { bg = colors.base })
      set_hl(0, 'TelescopePromptBorder', { bg = colors.base, fg = colors.base })
      set_hl(0, 'TelescopePromptTitle', { bg = colors.base, fg = colors.teal })
      set_hl(0, 'TelescopePreviewTitle', { bg = colors.bg_alt, fg = colors.bg_alt })
      set_hl(0, 'TelescopeResultsTitle', { bg = colors.bg_alt, fg = colors.bg_alt })

      set_hl(0, 'Floaterm', { bg = colors.base })
      set_hl(0, 'FloatermBorder', { bg = colors.base, fg = colors.base })

      set_hl(0, 'NeoTreeTabActive', { bg = colors.bg_alt, fg = colors.fg, bold = true })
      set_hl(0, 'NeoTreeTabInactive', { bg = colors.grey, fg = colors.fg_alt })
      set_hl(0, 'NeoTreeTabSeparatorActive', { bg = colors.bg_alt, fg = colors.bg_alt })
      set_hl(0, 'NeoTreeTabSeparatorInactive', { bg = colors.bg_alt, fg = colors.bg_alt })
      set_hl(0, 'NeoTreeTabHeader', { bg = colors.bg_alt, fg = colors.fg_alt })
      set_hl(0, 'NeoTreeNormal', { bg = colors.bg_alt })
      set_hl(0, 'NeoTreeNormalNC', { bg = colors.bg_alt })
      set_hl(0, 'NeoTreeWinSeparator', { fg = colors.bg_alt, bg = colors.bg_alt })
      set_hl(0, 'NeoTreeFileNameOpened', { fg = colors.orange })

      set_hl(0, 'BufferlineInactive', { bg = colors.bg_alt })
      set_hl(0, 'BufferlineActiveSeparator', { bg = colors.base, fg = colors.bg_alt })
      set_hl(0, 'BufferlineInactiveSeparator', { bg = colors.bg_alt, fg = colors.bg_alt })

      set_hl(0, 'TabActive', { bg = colors.base })
      set_hl(0, 'TabActiveSeparator', { bg = colors.base, fg = colors.bg_alt })
      set_hl(0, 'TabInactive', { bg = colors.bg_alt })
      set_hl(0, 'TabInactiveSeparator', { bg = colors.bg_alt, fg = colors.bg_alt })

      set_hl(0, 'SidebarTabActive', { bg = colors.bg_alt })
      set_hl(0, 'SidebarTabActiveSeparator', { bg = colors.bg_alt, fg = colors.bg_alt })
      set_hl(0, 'SidebarTabInactive', { bg = colors.bg_alt, fg = colors.fg_alt })
      set_hl(0, 'SidebarTabInactiveSeparator', { bg = colors.bg_alt, fg = colors.bg_alt })

      set_hl(0, 'StatusLine', { bg = colors.bg_alt, fg = colors.fg })
      set_hl(0, 'StatusLineComment', { bg = colors.bg_alt, fg = colors.fg_alt })

      -- Git
      set_hl(0, 'GitSignsCurrentLineBlame', { fg = colors.grey })
      set_hl(0, 'LineNrAbove', { fg = colors.grey })
      set_hl(0, 'LineNr', { fg = colors.fg_alt })
      set_hl(0, 'LineNrBelow', { fg = colors.grey })

      set_hl(0, 'MsgArea', { bg = colors.bg_alt })
      set_hl(0, 'SpellBad', { undercurl = true, sp = '#7F3A43' })
      set_hl(0, 'IblIndent', { fg = colors.grey })
      set_hl(0, 'IblScope', { fg = colors.fg_alt })
      set_hl(0, 'CopilotSuggestion', { fg = colors.fg_alt })
    end

    -- Set as active colorscheme
    vim.cmd.colorscheme('doom-one')

    -- Reapply custom highlights whenever the colorscheme (re)loads,
    -- since doom-one.nvim clears highlight groups on `ColorScheme`.
    apply_custom_highlights()
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'doom-one',
      callback = apply_custom_highlights,
    })
  end,
}
