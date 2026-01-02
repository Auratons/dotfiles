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

-- Maximize window
wezterm.on(
    "gui-startup",
    function(cmd)
        -- Pick the active screen to maximize into, there are also other options, see the docs.
        local active = wezterm.gui.screens().active
        wezterm.log_info("Active screen:")
        wezterm.log_info(active)
    
        -- Set the window coords on spawn.
        local tab, pane, window = mux.spawn_window(cmd or {})
        window:gui_window():toggle_fullscreen()
    end
)

config.term = "wezterm"
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Jump over words
config.keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {
        key="LeftArrow",
        mods="ALT",
        action=wezterm.action{SendString="\x1bb"}
    },
    -- Make Option-Right equivalent to Alt-f; forward-word
    {
        key="RightArrow",
        mods="ALT",
        action=wezterm.action{SendString="\x1bf"}
    }
}

config.mouse_bindings = {
    { event = { Down = { streak = 1, button = 'Left' } }, mods = 'SHIFT', action = act.SelectTextAtMouseCursor('Cell'), },
    { event = { Down = { streak = 1, button = 'Middle' } }, mods = 'SHIFT', action = act.PasteFrom('PrimarySelection'), },
    { event = { Down = { streak = 2, button = 'Left' } }, mods = 'SHIFT', action = act.SelectTextAtMouseCursor('Word'), },
    { event = { Down = { streak = 3, button = 'Left' } }, mods = 'SHIFT', action = act.SelectTextAtMouseCursor('Line'), },
    { event = { Drag = { streak = 1, button = 'Left' } }, mods = 'SHIFT', action = act.ExtendSelectionToMouseCursor('Block'), },
    { event = { Drag = { streak = 1, button = 'Left' } }, mods = 'SHIFT', action = act.ExtendSelectionToMouseCursor('Cell'), },
    { event = { Drag = { streak = 2, button = 'Left' } }, mods = 'SHIFT', action = act.ExtendSelectionToMouseCursor('Word'), },
    { event = { Drag = { streak = 3, button = 'Left' } }, mods = 'SHIFT', action = act.ExtendSelectionToMouseCursor('Line'), },
    { event = { Up = { streak = 1, button = 'Left' } }, mods = 'SHIFT', action = act.CompleteSelection('ClipboardAndPrimarySelection'), },
    { event = { Up = { streak = 2, button = 'Left' } }, mods = 'SHIFT', action = act.CompleteSelection('ClipboardAndPrimarySelection'), },
    { event = { Up = { streak = 3, button = 'Left' } }, mods = 'SHIFT', action = act.CompleteSelection('ClipboardAndPrimarySelection'), },
}

return config

