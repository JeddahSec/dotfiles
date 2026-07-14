-- Mason Configuration (Independent & Always Loaded)

return {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  event = 'VeryLazy',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup({
      ui = { height = 0.8 },
    })

    require('mason-lspconfig').setup({
      ensure_installed = {
        'intelephense',
        'phpactor',
        'vtsls',
        'tailwindcss',
        'jsonls',
        'lua_ls',
        'pyright',
        'cssls',
        'html',
        'emmet_ls',
      },
      automatic_installation = true,
    })
  end,
}
