return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' }, -- جعل الإضافة تعمل تلقائياً عند فتح وحفظ الملفات
  keys = {
    -- إضافة الاختصار اليدوي الآمن (المسافة + m + p) لتنسيق الملف الحالي يدوياً دون تعارض مع Telescope
    {
      '<leader>mp',
      function()
        require('conform').format({ async = true, lsp_format = 'fallback' })
      end,
      mode = 'n',
      desc = 'Format buffer (Conform)',
    },
  },
  opts = {
    formatters_by_ft = {
      -- إعداداتك الأصلية للـ PHP والويب
      php = { 'pint' },
      javascript = { 'oxfmt', 'prettierd', stop_after_first = true },
      javascriptreact = { 'oxfmt', 'prettierd', stop_after_first = true },
      typescript = { 'oxfmt', 'prettierd', stop_after_first = true },
      typescriptreact = { 'oxfmt', 'prettierd', stop_after_first = true },
      vue = { 'prettierd', stop_after_first = true },

      -- [جديد]: إضافة اللغات الأخرى لضمان تنسيقها
      lua = { 'stylua' },
      css = { 'prettierd', 'prettier', stop_after_first = true },
      html = { 'prettierd', 'prettier', stop_after_first = true },
      json = { 'prettierd', 'prettier', stop_after_first = true },
      python = { 'isort', 'black' },
    },
    formatters = {
      oxfmt = {
        require_cwd = true,
      },
      prettierd = {
        require_cwd = true,
      },
      prettier = {
        require_cwd = true,
      },
    },
    format_on_save = function(bufnr)
      -- الابقاء على ميزة تعطيل التنسيق عند الطلب الخاصة بك
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      return {
        timeout_ms = 1000,
        -- [تعديل]: تفعيل الخيار البديل هنا ليعمل التنسيق عبر الـ LSP إذا لم تتوفر أداة تنسيق خارجية للملف
        lsp_format = 'fallback',
      }
    end,
  },
  init = function()
    -- الأوامر الخاصة بك لتعطيل وتفعيل التنسيق تلقائياً عند الحفظ
    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    })

    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })
  end,
}
