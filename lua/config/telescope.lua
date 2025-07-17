require('telescope').setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
      },
    },
  },
  pickers = {
    find_files = {
      find_command = { "ag", "--silent", "--nocolor", "--follow", "-g", "", "--literal", "--hidden", "--ignore", ".git " },
    },
  }
})
