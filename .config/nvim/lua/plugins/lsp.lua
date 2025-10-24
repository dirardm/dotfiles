return {
  -- LSP configuration
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- Mason setup
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'clangd', 'pyright' }
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- FIXED: Using the new vim.lsp.start() API instead of deprecated require('lspconfig')
      
      -- Lua LS setup
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'lua',
        callback = function()
          vim.lsp.start({
            name = 'lua_ls',
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = { 'vim' } },
                workspace = { library = vim.api.nvim_get_runtime_file('', true) },
                telemetry = { enable = false },
              },
            },
          })
        end,
      })

      -- Clangd setup
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'c', 'cpp', 'objc', 'objcpp' },
        callback = function()
          vim.lsp.start({
            name = 'clangd',
            capabilities = capabilities,
          })
        end,
      })

      -- Pyright setup
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'python',
        callback = function()
          vim.lsp.start({
            name = 'pyright',
            capabilities = capabilities,
          })
        end,
      })

      -- Diagnostic symbols
      local signs = { Error = ' ', Warn = ' ', Hint = '󰌵 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      vim.diagnostic.config({
        virtual_text = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = { border = 'rounded' },
      })

      -- LSP keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr, remap = false }

          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
          vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        end
      })
    end
  }
}
