return { -- rose pine colorsheme, oh man this looks so good transparent!!
  'rose-pine/neovim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- Pre-load configurations, such as setting Vim options that need to be in place
    -- before the plugin loads, can go here.
    vim.cmd.colorscheme 'rose-pine-dawn'
    vim.cmd.hi 'Comment gui=none'
  end,
  config = function()
    require('rose-pine').setup {
      dim_inactive_windows = true,
      -- Ensure 'styles' is configured correctly according to the plugin's documentation.

      styles = {
        transparency = true,
        -- italic_comments = true,
      },
      highlight_groups = {
        TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
        TelescopeNormal = { bg = 'none' },
        TelescopePromptNormal = { bg = 'base' },
        TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
        TelescopeSelection = { fg = 'text', bg = 'base' },
        TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
      },
    }
  end,
}
