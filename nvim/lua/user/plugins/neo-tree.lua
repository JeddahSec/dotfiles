return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
  keys = {
    { '<leader>n', ':Neotree reveal toggle<CR>', desc = 'Toggle file tree' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- optional but highly recommended for file icons
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      opts = {
        filter_rules = {
          autoselect_one = true,
          include_current_win = false,
          bo = {
            filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
            buftype = { 'terminal', 'quickfix' },
          },
        },
        highlights = {
          statusline = {
            -- Doom One blue instead of tokyonight purple
            focused = { bg = '#51afef', fg = '#282c34', bold = true },
            unfocused = { bg = '#3f444a', fg = '#bbc2cf' },
          },
        },
      },
    },
  },
  config = function(_, opts)
    -- Doom One palette (dark, high contrast)
    local colors = {
      bg0 = '#282c34',
      bg1 = '#2f333d',
      bg2 = '#3f444a',
      bg3 = '#4f5766',
      fg = '#bbc2cf',
      grey1 = '#5B6268',
      red = '#ff6c6b',
      orange = '#da8548',
      yellow = '#ECBE7B',
      green = '#98be65',
      aqua = '#46D9FF',
      blue = '#51afef',
      purple = '#c678dd',
      color1 = '#23272e',
    }

    -- Custom highlight groups tying Neo-tree into Doom One
    local set_hl = vim.api.nvim_set_hl
    set_hl(0, 'NeoTreeNormal', { bg = colors.bg0, fg = colors.fg })
    set_hl(0, 'NeoTreeNormalNC', { bg = colors.bg0, fg = colors.fg })
    set_hl(0, 'NeoTreeWinSeparator', { fg = colors.bg2, bg = colors.bg0 })
    set_hl(0, 'NeoTreeFloatBorder', { fg = colors.blue, bg = colors.bg0 })
    set_hl(0, 'NeoTreeFloatTitle', { fg = colors.bg0, bg = colors.blue, bold = true })
    set_hl(0, 'NeoTreeRootName', { fg = colors.blue, bold = true })
    set_hl(0, 'NeoTreeDirectoryIcon', { fg = colors.blue })
    set_hl(0, 'NeoTreeDirectoryName', { fg = colors.blue })
    set_hl(0, 'NeoTreeSymbolicLinkTarget', { fg = colors.purple })
    set_hl(0, 'NeoTreeIndentMarker', { fg = colors.bg3 })
    set_hl(0, 'NeoTreeGitAdded', { fg = colors.green })
    set_hl(0, 'NeoTreeGitModified', { fg = colors.yellow })
    set_hl(0, 'NeoTreeGitDeleted', { fg = colors.red })
    set_hl(0, 'NeoTreeGitUntracked', { fg = colors.orange })
    set_hl(0, 'NeoTreeGitConflict', { fg = colors.red, bold = true })
    set_hl(0, 'SidebarTabActive', { fg = colors.bg0, bg = colors.blue, bold = true })
    set_hl(0, 'SidebarTabInactive', { fg = colors.grey1, bg = colors.bg0 })
    set_hl(0, 'SidebarTabActiveSeparator', { fg = colors.blue, bg = colors.bg1 })
    set_hl(0, 'SidebarTabInactiveSeparator', { fg = colors.bg2, bg = colors.bg1 })
    set_hl(0, 'StatusLineComment', { fg = colors.grey1, bg = colors.color1 })

    require('neo-tree').setup(opts)
  end,
  opts = {
    close_if_last_window = true,
    hide_root_node = true,
    sources = {
      'filesystem',
      'buffers',
      'git_status',
      'document_symbols',
    },
    source_selector = {
      winbar = true,
      statusline = false,
      separator = { left = '', right = '' },
      show_separator_on_edge = true,
      highlight_tab = 'SidebarTabInactive',
      highlight_tab_active = 'SidebarTabActive',
      highlight_background = 'NeoTreeNormal',
      highlight_separator = 'SidebarTabInactiveSeparator',
      highlight_separator_active = 'SidebarTabActiveSeparator',
    },
    event_handlers = {
      -- إغلاق الشجرة تلقائياً عند فتح أي ملف
      {
        event = 'file_opened',
        handler = function(file_path)
          require('neo-tree.command').execute({ action = 'close' })
        end,
      },
      -- إخفاء الـ cursorline تماماً عند الدخول إلى نافذة الشجرة
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          vim.opt_local.cursorline = false
        end,
      },
    },
    default_component_configs = {
      indent = {
        padding = 0,
      },
      name = {
        use_git_status_colors = false,
        highlight_opened_files = true,
      },
    },
    window = {
      width = 35, -- تم تصغير العرض هنا (الافتراضي 40، يمكنك تعديله لـ 25 إذا أردته أصغر)
      mappings = {
        ['<cr>'] = 'open_with_window_picker',
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          '.git',
        },
      },
      -- تحديث فوري وتلقائي لمحتويات المجلدات عند التعديل الخارجي
      use_libuv_file_watcher = true,
      group_empty_dirs = false,
      follow_current_file = {
        enabled = false,
      },
    },
  },
}
