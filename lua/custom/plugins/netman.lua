return {
  {
    'miversen33/netman.nvim',
    url = 'git@github.com:miversen33/netman.nvim.git',
    config = function()
      require('netman').setup()
      require('netman.api').load_provider 'netman.providers.ssh'
    end,
  },
}
