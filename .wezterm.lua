-- Inspiration:
-- https://github.com/KevinSilvester/wezterm-config/tree/master
-- https://stackoverflow.com/a/1283608

-- Pull in APIs
local wezterm = require('wezterm')
local utils   = require('utils')

-- This holds the configuration and checks it for errors.
local config = wezterm.config_builder()

local mux = wezterm.mux
local act = wezterm.action

-- This is where you actually apply your config choices
utils.merge(config, require('general'))
utils.merge(config, require('keybindings'))
utils.merge(config, require('appearance'))
utils.merge(config, require('font'))

-- Maximize window (windowed, not fullscreen)
wezterm.on(
    "gui-startup",
    function(cmd)
        local tab, pane, window = mux.spawn_window(cmd or {})
        local gui = window:gui_window()
        -- Fix to known race condition on macOS with external monitors
        wezterm.time.call_after(0.1, function()
            gui:maximize()
        end)
    end
)

config.term = "xterm-256color"
config.hyperlink_rules = wezterm.default_hyperlink_rules()

config.mouse_bindings = {
    { event = { Down = { streak = 1, button = 'Left' } }, mods = 'SHIFT', action = act.SelectTextAtMouseCursor('Cell'), },
    { event = { Down = { streak = 1, button = 'Middle' } }, mods = 'SHIFT', action = act.PasteFrom('PrimarySelection'), },
    { event = { Down = { streak = 2, button = 'Left' } }, mods = 'SHIFT', action = act.SelectTextAtMouseCursor('Word'), },
    { event = { Down = { streak = 3, button = 'Left' } }, mods = 'SHIFT', action = act.SelectTextAtMouseCursor('Line'), },
    { event = { Drag = { streak = 1, button = 'Left' } }, mods = 'SHIFT|ALT', action = act.ExtendSelectionToMouseCursor('Block'), },
    { event = { Drag = { streak = 1, button = 'Left' } }, mods = 'SHIFT', action = act.ExtendSelectionToMouseCursor('Cell'), },
    { event = { Drag = { streak = 2, button = 'Left' } }, mods = 'SHIFT', action = act.ExtendSelectionToMouseCursor('Word'), },
    { event = { Drag = { streak = 3, button = 'Left' } }, mods = 'SHIFT', action = act.ExtendSelectionToMouseCursor('Line'), },
    { event = { Up = { streak = 1, button = 'Left' } }, mods = 'SHIFT', action = act.CompleteSelection('ClipboardAndPrimarySelection'), },
    { event = { Up = { streak = 2, button = 'Left' } }, mods = 'SHIFT', action = act.CompleteSelection('ClipboardAndPrimarySelection'), },
    { event = { Up = { streak = 3, button = 'Left' } }, mods = 'SHIFT', action = act.CompleteSelection('ClipboardAndPrimarySelection'), },
}

return config
