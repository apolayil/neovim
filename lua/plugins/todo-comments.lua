return -- Highlight todo, notes, etc in comments
{
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true,
    keywords = { -- Some better colors that are better on light mode.
      TODO = { color = '#ff7400' },
      PERF = { color = '#50C878' },
      NOTE = { color = '#aeaeae' },
      TEST = { color = '#C4B454' },
      ISSUE = { color = '#FF3131' },
      REF = { icon = '', color = '#FF00FF', alt = { 'REFERENCE', 'REF' } },
    },
    colors = {
      error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
    },
  },
}

-- ISSUE:
-- TODO:
-- PERF:
-- HACK:
-- WARN:
-- NOTE:
-- TEST:
-- REF: CSSE2310 Reference label.
