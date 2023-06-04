require('mini.basics').setup({
  options = {
    basic = false,
    extra_ui = false,
    win_borders = 'default',
  },
  mappings = {
    basic = true,
    option_toggle_prefix = [[\]],
    windows = false,
    move_with_alt = false,
  },
  autocommands = {
    basic = true,
    relnum_in_visual_mode = false,
  }
})
-- Delete "Correct latest misspelled word" keymap in normal mode, as it overwrites the "suspend" feature
vim.keymap.del('n', '<C-z>')

require('mini.bracketed').setup()
