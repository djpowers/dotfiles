local wezterm = require 'wezterm'

return {
  color_scheme = 'nord',
  font = wezterm.font 'JetBrains Mono',
  font_size = 13,
  line_height = 1.2,
  window_decorations = "RESIZE",
  keys = {
    -- Closes the current pane. If that was the last pane in the tab, closes the tab.
    {
      key = 'w',
      mods = 'CMD',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
  },
}
