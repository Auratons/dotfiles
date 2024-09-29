-- Inspiration:
-- https://github.com/KevinSilvester/wezterm-config/tree/master
-- https://stackoverflow.com/a/1283608

-- Pull in APIs
local wezterm = require('wezterm')
local utils   = require('utils')

-- This holds the configuration and checks it for errors.
local config = wezterm.config_builder()

local mux = wezterm.mux

-- This is where you actually apply your config choices
utils.merge(config, require('general'))
utils.merge(config, require('keybindings'))
utils.merge(config, require('appearance'))
utils.merge(config, require('font'))

-- Maximize window by docs
-- wezterm.on(
--     'gui-startup',
--     function(cmd)
--         local tab, pane, window = mux.spawn_window(cmd or {})
--         window:gui_window():maximize()
--     end
-- )
-- Maximize window working on MacOS from https://github.com/wez/wezterm/issues/3299
wezterm.on(
    "gui-startup",
    function(cmd)
        -- Pick the active screen to maximize into, there are also other options, see the docs.
        local active = wezterm.gui.screens().active
    
        -- Set the window coords on spawn.
        local tab, pane, window = mux.spawn_window(cmd or {
        x = active.x,
        y = active.y,
        width = active.width,
        height = active.height,
        })
    
        -- You probably don't need both, but you can also set the positions after spawn.
        window:gui_window():set_position(active.x, active.y)
        window:gui_window():set_inner_size(active.width, active.height)
    end
)

config.term = "wezterm"

return config
