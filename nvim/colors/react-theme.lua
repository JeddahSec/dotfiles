-- react-theme.lua
-- A Neovim port of the VS Code "React Theme" by mikaelkristiansson
-- (https://marketplace.visualstudio.com/items?itemName=mikaelkristiansson87.react-theme-vscode)
--
-- Install: save as ~/.config/nvim/colors/react-theme.lua
-- Use:     :colorscheme react-theme
--          or in init.lua: vim.cmd.colorscheme("react-theme")

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "react-theme"

-- ---------------------------------------------------------------------------
-- Palette (taken directly from the VS Code theme's colors/tokenColors)
-- ---------------------------------------------------------------------------
local p = {
  bg            = "#282c34",
  bg_dark       = "#21222c", -- editorWidget / suggest widget background
  bg_darker     = "#191a21", -- breadcrumbPicker / dropdown border
  bg_light      = "#343746", -- dropdown background
  line_hl       = "#1e2127", -- editor.lineHighlightBackground
  selection     = "#353b45", -- editor.selectionBackground / findMatch
  bracket_bg    = "#252b39",

  fg            = "#f8f8f2",
  fg_dim        = "#bbbbbb", -- sideBar.foreground
  fg_dimmer     = "#999999", -- editorLineNumber.foreground
  comment       = "#3e4451",
  ruler         = "#424450",

  purple        = "#c5a5c5", -- keywords, storage
  green         = "#8dc891", -- strings
  blue          = "#79b6f2", -- functions
  yellow        = "#fac863", -- types
  cyan          = "#8be9ee", -- constants
  pink          = "#fc929e", -- tags / JSX components
  teal          = "#88c6be", -- punctuation
  fog           = "#d7deea", -- operators
  orange        = "#ff8b50", -- booleans
  entity        = "#d67c9b", -- entities / exceptions

  react_blue    = "#61dafb", -- breadcrumb / progress bar accent

  red           = "#ff5555",
  green_bright  = "#50fa7b",
  cyan_bright   = "#8be9fd",
  orange_bright = "#ffb86c",
  grey_blue     = "#3e4451", -- ignored / disabled

  badge         = "#44475a",
  border        = "#1e2127",
  none          = "NONE",
}

-- Mappings to bridge snippet variables to the palette
local colors = {
  base   = p.bg,
  bg_alt = p.bg_dark,
  fg     = p.fg,
  fg_alt = p.fg_dim,
  grey   = p.grey_blue,
  teal   = p.teal,
  orange = p.orange,
}

-- ---------------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------------
local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local set_hl = vim.api.nvim_set_hl

-- ---------------------------------------------------------------------------
-- Editor UI
-- ---------------------------------------------------------------------------
hl("Normal", { fg = p.fg, bg = p.bg })
hl("NormalFloat", { fg = p.fg, bg = p.bg_dark })
hl("NormalNC", { fg = p.fg, bg = p.bg })
hl("FloatBorder", { fg = p.border, bg = p.bg_dark })
hl("Cursor", { fg = p.bg, bg = p.fg })
hl("CursorLine", { bg = p.line_hl })
hl("CursorLineNr", { fg = p.fg, bold = true })
hl("CursorColumn", { bg = p.line_hl })
hl("ColorColumn", { bg = p.line_hl })
hl("LineNr", { fg = p.fg_dimmer })
hl("SignColumn", { fg = p.fg_dimmer, bg = p.bg })
hl("VertSplit", { fg = p.bg_darker, bg = p.bg })
hl("WinSeparator", { fg = p.bg_darker, bg = p.bg })
hl("StatusLine", { fg = p.fg, bg = p.bg })
hl("StatusLineNC", { fg = p.grey_blue, bg = p.bg })
hl("TabLine", { fg = p.fg_dim, bg = p.bg })
hl("TabLineFill", { bg = p.bg })
hl("TabLineSel", { fg = p.fg, bg = p.badge })
hl("Pmenu", { fg = p.fg, bg = p.bg_dark })
hl("PmenuSel", { fg = p.fg, bg = p.badge })
hl("PmenuSbar", { bg = p.bg_dark })
hl("PmenuThumb", { bg = p.badge })
hl("Search", { fg = p.bg, bg = p.selection })
hl("IncSearch", { fg = p.bg, bg = p.react_blue })
hl("CurSearch", { fg = p.bg, bg = p.react_blue })
hl("Visual", { bg = p.selection })
hl("VisualNOS", { bg = p.selection })
hl("Folded", { fg = p.grey_blue, bg = p.line_hl })
hl("FoldColumn", { fg = p.fg_dimmer, bg = p.bg })
hl("MatchParen", { bg = p.bracket_bg, fg = p.purple, bold = true })
hl("Directory", { fg = p.blue })
hl("Title", { fg = p.blue, bold = true })
hl("ErrorMsg", { fg = p.red, bold = true })
hl("WarningMsg", { fg = p.orange_bright })
hl("ModeMsg", { fg = p.fg })
hl("MoreMsg", { fg = p.green })
hl("Question", { fg = p.green })
hl("WildMenu", { fg = p.bg, bg = p.react_blue })
hl("NonText", { fg = p.ruler })
hl("SpecialKey", { fg = p.ruler })
hl("Whitespace", { fg = p.ruler })
hl("EndOfBuffer", { fg = p.bg })
hl("WinBar", { fg = p.fg_dim, bg = p.bg })
hl("WinBarNC", { fg = p.grey_blue, bg = p.bg })

-- ---------------------------------------------------------------------------
-- Syntax (classic)
-- ---------------------------------------------------------------------------
hl("Comment", { fg = p.comment, italic = true })
hl("Constant", { fg = p.cyan })
hl("String", { fg = p.green })
hl("Character", { fg = p.green })
hl("Number", { fg = p.pink })
hl("Boolean", { fg = p.orange })
hl("Float", { fg = p.pink })
hl("Identifier", { fg = p.fg })
hl("Function", { fg = p.blue })
hl("Statement", { fg = p.purple })
hl("Conditional", { fg = p.purple })
hl("Repeat", { fg = p.purple })
hl("Label", { fg = p.purple })
hl("Operator", { fg = p.fog })
hl("Keyword", { fg = p.purple })
hl("Exception", { fg = p.entity })
hl("PreProc", { fg = p.purple })
hl("Include", { fg = p.purple })
hl("Define", { fg = p.purple })
hl("Macro", { fg = p.purple })
hl("PreCondit", { fg = p.purple })
hl("Type", { fg = p.yellow })
hl("StorageClass", { fg = p.purple })
hl("Structure", { fg = p.yellow })
hl("Typedef", { fg = p.yellow })
hl("Special", { fg = p.teal })
hl("SpecialChar", { fg = p.teal })
hl("Tag", { fg = p.pink })
hl("Delimiter", { fg = p.teal })
hl("SpecialComment", { fg = p.comment, italic = true })
hl("Debug", { fg = p.orange_bright })
hl("Underlined", { underline = true })
hl("Ignore", { fg = p.grey_blue })
hl("Error", { fg = p.red, bold = true })
hl("Todo", { fg = p.bg, bg = p.orange_bright, bold = true })

-- ---------------------------------------------------------------------------
-- Treesitter (@-groups)
-- ---------------------------------------------------------------------------
hl("@comment", { link = "Comment" })
hl("@string", { link = "String" })
hl("@string.escape", { fg = p.teal })
hl("@number", { link = "Number" })
hl("@boolean", { link = "Boolean" })
hl("@function", { link = "Function" })
hl("@function.call", { link = "Function" })
hl("@function.builtin", { fg = p.blue })
hl("@method", { link = "Function" })
hl("@method.call", { link = "Function" })
hl("@constructor", { fg = p.blue })
hl("@keyword", { link = "Keyword" })
hl("@keyword.function", { fg = p.purple })
hl("@keyword.operator", { fg = p.purple })
hl("@keyword.return", { fg = p.purple })
hl("@conditional", { link = "Conditional" })
hl("@repeat", { link = "Repeat" })
hl("@operator", { link = "Operator" })
hl("@variable", { fg = p.fg })
hl("@variable.builtin", { fg = p.entity })
hl("@variable.parameter", { fg = p.fg })
hl("@variable.member", { fg = p.fg })
hl("@constant", { link = "Constant" })
hl("@constant.builtin", { fg = p.cyan })
hl("@type", { link = "Type" })
hl("@type.builtin", { fg = p.yellow })
hl("@property", { fg = p.fg })
hl("@field", { fg = p.fg })
hl("@parameter", { fg = p.fg })
hl("@punctuation.bracket", { fg = p.teal })
hl("@punctuation.delimiter", { fg = p.teal })
hl("@punctuation.special", { fg = p.teal })
hl("@tag", { fg = p.pink })
hl("@tag.attribute", { fg = p.purple })
hl("@tag.delimiter", { fg = p.teal })
hl("@module", { fg = p.yellow })
hl("@namespace", { fg = p.yellow })
hl("@exception", { link = "Exception" })
hl("@attribute", { fg = p.purple })
hl("@label", { link = "Label" })

-- ---------------------------------------------------------------------------
-- LSP Diagnostics
-- ---------------------------------------------------------------------------
hl("DiagnosticError", { fg = p.red })
hl("DiagnosticWarn", { fg = p.orange_bright })
hl("DiagnosticInfo", { fg = p.cyan_bright })
hl("DiagnosticHint", { fg = p.grey_blue })
hl("DiagnosticUnderlineError", { undercurl = true, sp = p.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.orange_bright })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.cyan_bright })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.grey_blue })
hl("LspReferenceText", { bg = p.selection })
hl("LspReferenceRead", { bg = p.selection })
hl("LspReferenceWrite", { bg = p.selection })

-- ---------------------------------------------------------------------------
-- Diff / Git
-- ---------------------------------------------------------------------------
hl("DiffAdd", { fg = p.green_bright, bg = p.none })
hl("DiffChange", { fg = p.cyan_bright, bg = p.none })
hl("DiffDelete", { fg = p.red, bg = p.none })
hl("DiffText", { fg = p.fg, bg = p.selection })
hl("GitSignsAdd", { fg = p.green_bright })
hl("GitSignsChange", { fg = p.cyan_bright })
hl("GitSignsDelete", { fg = p.red })

-- ---------------------------------------------------------------------------
-- Telescope / nvim-cmp / Custom Plugins
-- ---------------------------------------------------------------------------
hl("CmpItemAbbrMatch", { fg = p.react_blue, bold = true })
hl("CmpItemKindFunction", { fg = p.blue })
hl("CmpItemKindVariable", { fg = p.fg })
hl("CmpItemKindKeyword", { fg = p.purple })

-- Custom Plugin Highlights (Telescope, NeoTree, Bufferline, Indent-Blankline, etc.)
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

set_hl(0, "@module", { fg = "#bbc2cf" })

-- ---------------------------------------------------------------------------
-- Terminal ANSI colors (matches the theme's terminal.ansi* values)
-- ---------------------------------------------------------------------------
vim.g.terminal_color_0  = "#21222c"
vim.g.terminal_color_1  = p.red
vim.g.terminal_color_2  = p.green_bright
vim.g.terminal_color_3  = "#f1fa8c"
vim.g.terminal_color_4  = "#bd93f9"
vim.g.terminal_color_5  = "#ff79c6"
vim.g.terminal_color_6  = p.cyan_bright
vim.g.terminal_color_7  = p.fg
vim.g.terminal_color_8  = p.grey_blue
vim.g.terminal_color_9  = "#ff6e6e"
vim.g.terminal_color_10 = "#69ff94"
vim.g.terminal_color_11 = "#ffffa5"
vim.g.terminal_color_12 = "#d6acff"
vim.g.terminal_color_13 = "#ff92df"
vim.g.terminal_color_14 = "#a4ffff"
vim.g.terminal_color_15 = "#ffffff"
