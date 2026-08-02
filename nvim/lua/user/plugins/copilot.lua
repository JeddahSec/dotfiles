-- GitHub Copilot
return {
  'github/copilot.vim',
  config = function()
    vim.cmd([[
      imap <silent><script><expr> <M-CR> copilot#Accept("\<CR>")
      let g:copilot_no_tab_map = v:true
    ]])

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'react-theme',
      callback = function()
        vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
          fg = '#3e4451',
          italic = true,
          force = true,
        })
      end,
    })

    vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
      fg = '#3e4451',
      italic = true,
      force = true,
    })
  end,
}
