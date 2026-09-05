return {
  'neovim-treesitter/nvim-treesitter',
  url = 'https://github.com/neovim-treesitter/nvim-treesitter',
  dependencies = {
    'neovim-treesitter/treesitter-parser-registry',
  },
  lazy = false,
  build = ':tsupdate',
  config = function()
    local ts = require('nvim-treesitter')

    -- languages we want installed/updated locally for highlighting + queries.
    local languages = {
      'arduino',
      'bash',
      'blade',
      'comment',
      'css',
      'diff',
      'dockerfile',
      'ecma',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'html',
      'html_tags',
      'http',
      'ini',
      'javascript',
      'json',
      'jsx',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'passwd',
      'php',
      'php_only',
      'phpdoc',
      'python',
      'regex',
      'ruby',
      'rust',
      'sql',
      'svelte',
      'typescript',
      'tsx',
      'vim',
      'vue',
      'xml',
      'yaml',
    }

    -- treat laravel blade templates as `blade` instead of plain php.
    vim.filetype.add({
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    })

    -- build a quick lookup of already-installed parsers.
    local installed = {}
    for _, lang in ipairs(ts.get_installed()) do
      installed[lang] = true
    end

    -- install only missing languages to keep startup work minimal.
    local missing = {}
    for _, lang in ipairs(languages) do
      if not installed[lang] then
        table.insert(missing, lang)
      end
    end

    -- trigger async installs (with summary logs) when something is missing.
    if #missing > 0 then
      ts.install(missing, { summary = true })
    end

    -- enable treesitter highlighting per-filetype buffer as files open.
    -- also opt into treesitter indentation everywhere except yaml.
    vim.api.nvim_create_autocmd('filetype', {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)

        if vim.bo[args.buf].filetype ~= 'yaml' then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
