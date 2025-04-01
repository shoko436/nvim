require('telescope').setup({
  pickers = {
    find_files = {
      find_command = { "ag", "--silent", "--nocolor", "--follow", "-g", "", "--literal", "--hidden", "--ignore", ".git " },
    }
  }
})
