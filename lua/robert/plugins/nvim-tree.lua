require("nvim-tree").setup({
    sort = {
    sorter = "case_sensitive",
  },
  actions = {
    open_file = {
        quit_on_open = true,
    },
  },
  view = {
    width = 30,
  },
  highlights = {
      background = {
        guibg = "NONE",
      },
      fill = {
          guibg = "NONE",
      },
      close_button = {
          guibg = "NONE",
      },
      seperator_visible = {
          guibg = "NONE",
      },
      tab_close = {
          guibg = "NONE",
      },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

