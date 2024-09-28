-- Inspiration:
-- https://github.com/KevinSilvester/wezterm-config/tree/master
-- https://stackoverflow.com/a/1283608

-- Pull in APIs
local wezterm = require('wezterm')
local utils   = require('utils')

-- This holds the configuration and checks it for errors.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
utils.merge(config, require('general'))
utils.merge(config, require('keybindings'))
utils.merge(config, require('appearance'))
utils.merge(config, require('font'))

return config
