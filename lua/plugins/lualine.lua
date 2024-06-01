return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_c = {
        {
          'buffers',
          show_filename_only = true,
          icons_enabled = false,
          show_modified_status = false,
        },
      },
      lualine_x = { 'filetype' },
    },
  },
}
