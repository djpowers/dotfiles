local wezterm = require 'wezterm'
local act = wezterm.action

local SPACER = string.rep(' ', 20)
local COLOR_SCHEME_NAME = 'nord'
local color_scheme = wezterm.color.get_builtin_schemes()[COLOR_SCHEME_NAME]

wezterm.on(
  'format-tab-title',
  function(tab)
    return {
      { Text = SPACER .. tab.active_pane.title .. SPACER .. '⌘' .. tab.tab_index + 1 },
    }
  end
)

return {
  color_scheme = COLOR_SCHEME_NAME,
  font = wezterm.font 'JetBrains Mono',
  font_size = 13,
  line_height = 1.2,
  window_decorations = "RESIZE",
  window_frame = {
    -- The size of the font in the tab bar.
    font_size = 13,
    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = color_scheme.background,

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = color_scheme.foreground,
  },
  colors = {
    tab_bar = {
      active_tab = {
        bg_color = color_scheme.selection_fg,
        fg_color = color_scheme.selection_bg,
      },
      inactive_tab = {
        bg_color = color_scheme.background,
        fg_color = color_scheme.foreground,
      },
       inactive_tab_hover = {
        bg_color = color_scheme.selection_bg,
        fg_color = color_scheme.selection_fg,
      },
      new_tab = {
        bg_color = color_scheme.background,
        fg_color = color_scheme.foreground,
      },
      new_tab_hover = {
        bg_color = color_scheme.selection_bg,
        fg_color = color_scheme.selection_fg,
      },
    },
  },
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
    -- Rebind SUPER-Left, SUPER-Right as CTRL-a, CTRL-b respectively to match macOS behavior, going to beginning or end of line
    {
      key = 'LeftArrow',
      mods = 'CMD',
      action = act.SendKey { key = 'a', mods = 'CTRL' },
    },
    {
      key = 'RightArrow',
      mods = 'CMD',
      action = act.SendKey { key = 'e', mods = 'CTRL' },
    },
    -- Rebind CMD-Backspace as CTRL-u to delete from cursor to start of line
    {
      key = 'Backspace',
      mods = 'CMD',
      action = act.SendKey { key = 'u', mods = 'CTRL' },
    },
  },
}
