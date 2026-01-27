return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    messages = { view = 'mini' },
    notify = {
      enabled = true,
      view = 'mini',
    },
    views = {
      cmdline_popup = {
        position = {
          row = '30%', -- higher than center (50%). Lower number = higher on screen.
          col = '50%',
        },
      },
    },
  },
}
