return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<F12>]],
      direction = 'float',
      float_opts = {
        border = 'single',
        width = math.ceil(vim.o.columns * 0.85),
        height = math.ceil(vim.o.lines * 0.85),
        winblend = 0,
      },
    })
    vim.cmd([[
      highlight! link ToggleTerm1FloatBorder FloatBorder
      highlight! link ToggleTerm1Normal NormalFloat
    ]])
  end,
}
