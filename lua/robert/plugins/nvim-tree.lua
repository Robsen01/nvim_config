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
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
