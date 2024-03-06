-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
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
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 16
-- config.color_scheme = 'Solarized Dark Higher Contrast'
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
config.initial_cols=150
config.initial_rows=40

-- and finally, return the configuration to wezterm
return config
