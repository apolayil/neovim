-- Add this to your plugins setup in kickstart.nvim
return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  opts = {
    open_fold_hl_timeout = 150, -- Time in milliseconds to highlight the opened fold
    close_fold_kinds_for_ft = { -- Specify fold kinds to close for specific file types
      default = { 'imports', 'comment' }, -- Default behavior for all file types
      json = { 'array' }, -- Close 'array' folds for JSON files
      c = { 'array', 'comment' }, -- Close 'comment' and 'region' folds for C files
    },
  },
  config = function(_, opts)
    -- General fold settings
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Keymaps for folding
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    vim.keymap.set('n', 'K', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        -- choose one of coc.nvim and nvim lsp
        -- vim.fn.CocActionAsync 'definitionHover' -- coc.nvim
        vim.lsp.buf.hover()
      end
    end)

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    -- Setup LSP servers with folding capabilities
    local language_servers = require('lspconfig').util.available_servers()
    for _, ls in ipairs(language_servers) do
      require('lspconfig')[ls].setup {
        capabilities = capabilities,
      }
    end

    -- Setup ufo
    require('ufo').setup(opts)
  end,
}
