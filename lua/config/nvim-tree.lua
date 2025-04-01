require('nvim-tree').setup({
  view = {
    width = 40
  },
  update_focused_file = {
    enable = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      },
    }
  }
})
