-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- Fonts and color scheme
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 16

config.color_scheme = 'Catppuccin Mocha'

config.hide_tab_bar_if_only_one_tab = true

config.macos_window_background_blur = 30

config.window_decorations = 'RESIZE'

-- Pad window to avoid the content to be too close to the border,
-- so it's easier to see and select.
config.window_padding = {
  left = 3,
  right = 3,
  top = 3,
  bottom = 3,
}

config.inactive_pane_hsb = {
  -- NOTE: these values are multipliers, applied on normal pane values
  saturation = 0.9,
  brightness = 0.6,
}
-- Default window size
config.initial_cols=120
config.initial_rows=40

-- Tab font
config.window_frame = {
-- font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
    border_left_width = '0.5cell',
  border_right_width = '0.5cell',
  border_bottom_height = '0.25cell',
  border_top_height = '0.25cell',
  border_left_color = 'purple',
  border_right_color = 'purple',
  border_bottom_color = 'purple',
  border_top_color = 'purple',

}
-- Key maps
config.keys =
{
  { key = 'f', mods = 'CMD', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'h', mods = 'CMD', action = act.ActivatePaneDirection 'Left', },
  { key = 'l', mods = 'CMD', action = act.ActivatePaneDirection 'Right', },
  { key = 't', mods = 'CMD', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CMD', action = act.CloseCurrentTab{ confirm = false } },
  { key = 'x', mods = 'CMD', action = act.CloseCurrentPane{ confirm = false } },
  { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, }
}
-- and finally, return the configuration to wezterm
return config
