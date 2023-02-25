local wezterm = require 'wezterm'
local act = wezterm.action

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
    -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
    {
      key = 'LeftArrow',
      mods = 'OPT',
      action = act.SendKey { key = 'b', mods = 'ALT' },
    },
    {
      key = 'RightArrow',
      mods = 'OPT',
      action = act.SendKey { key = 'f', mods = 'ALT' },
    },
  },
}
