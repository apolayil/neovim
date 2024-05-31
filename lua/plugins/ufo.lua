return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    -- Example configuration:
    vim.o.foldcolumn = '0' -- '0' is not bad, that column on the side that tells you amount of folds.
    vim.o.foldlevel = 99 -- leave all folds open
    vim.o.foldlevelstart = 99 -- start with everything open
    vim.o.foldenable = true

    -- Using ufo provider in nvim lsp as much as possible
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    local language_servers = { 'clangd' } -- Add the language servers you need
    for _, ls in ipairs(language_servers) do
      require('lspconfig')[ls].setup {
        capabilities = capabilities,
        -- you can add other fields for setting up lsp server in this table
      }
    end
    require('ufo').setup()
  end,
}
