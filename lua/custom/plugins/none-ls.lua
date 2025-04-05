local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

return {
  {
    'nvimtools/none-ls.nvim',
    name = 'null-ls',
    dependencies = {
      'jayp0521/mason-null-ls.nvim',
    },
    config = function()
      local null_ls = require 'null-ls'
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup {
        sources = {
          formatting.prettier.with {
            extra_args = { '--print-width', '120' },
          },
          formatting.stylua.with {
            extra_args = { '--column-width', '120' },
          },
          diagnostics.ruff,
          formatting.jq,
          diagnostics.jsonlint,
        },
        on_attach = function(client, bufnr)
          -- Use the client's `settings` to add custom arguments for `ruff` like line length
          if client.name == 'ruff' then
            client.config.settings = client.config.settings or {}
            client.config.settings.ruff = client.config.settings.ruff or {}
            client.config.settings.ruff.extra_args = { '--line-length=120' }
          end
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { async = false }
              end,
            })
          end
        end,
      }
    end,
  },
}
