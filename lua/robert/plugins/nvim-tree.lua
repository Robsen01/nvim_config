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

