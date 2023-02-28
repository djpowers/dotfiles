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
require('mini.bracketed').setup()
