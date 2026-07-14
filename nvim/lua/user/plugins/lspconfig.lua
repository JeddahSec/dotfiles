-- Language Server Protocol Configuration (Neovim 0.11+ Native Way)

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'b0o/schemastore.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    if has_cmp then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    local servers = { 'intelephense', 'phpactor', 'pyright', 'tailwindcss', 'html', 'emmet_ls', }
    for _, server in ipairs(servers) do
      vim.lsp.config(server, { capabilities = capabilities })
      vim.lsp.enable(server)
    end
    vim.lsp.config('jsonls', {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    })
    vim.lsp.enable('jsonls')

    vim.lsp.config('html', {
      capabilities = capabilities,
      settings = {
        html = {
          format = {
            enable = true,
          },
          suggest = {
            html5 = true,
          },
        },
      },
    })
    vim.lsp.enable('html')

    vim.lsp.config('emmet_ls', {
      capabilities = capabilities,
      filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
    })
    vim.lsp.enable('emmet_ls')


    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })
    vim.lsp.enable('lua_ls')

    local vue_plugin_path = vim.fn.expand('$MASON/packages') .. '/vue-language-server/node_modules/@vue/language-server'
    vim.lsp.config('vtsls', {
      capabilities = capabilities,
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              {
                name = '@vue/typescript-plugin',
                location = vue_plugin_path,
                languages = { 'vue' },
                configNamespace = 'typescript',
              },
            },
          },
        },
      },
    })
    vim.lsp.enable('vtsls')

    vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Open diagnostics float' })
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Show code actions' })
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = 'Go to implementation' })
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'Go to references' })
    vim.keymap.set('n', '<Leader>lr', '<cmd>LspRestart<CR>', { silent = true, desc = 'Restart LSP' })
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Hover documentation' })
    vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename symbol' })

    vim.diagnostic.config({
      virtual_text = false,
      float = { source = true },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.INFO] = '',
          [vim.diagnostic.severity.HINT] = '',
        },
      },
    })
  end,
}
