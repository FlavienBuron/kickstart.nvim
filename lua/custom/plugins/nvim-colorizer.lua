return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        lua = {
          mode = 'foreground',
        },
      }
    end,
  },
}
