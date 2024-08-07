return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  opt = function()
    -- Example configuration:
    vim.o.foldcolumn = '1' -- '1' is the default value, showing the fold column on the side.
    vim.o.foldlevel = 99 -- Leave all folds open.
    vim.o.foldlevelstart = 99 -- Start with everything open.
    vim.o.foldenable = true -- Enable folding.

    -- Using ufo provider in nvim as much as possible
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local language_servers = require('lspconfig').util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
      require('lspconfig')[ls].setup {
        capabilities = capabilities,
        -- you can add other fields for setting up lsp server in this table
      }
    end

    require('ufo').setup()
  end,
}
