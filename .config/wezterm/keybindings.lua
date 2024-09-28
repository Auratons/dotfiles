local wezterm = require('wezterm')
local utils   = require('utils')

local mod      = {}
local platform = utils.platform()
local act      = wezterm.action

if platform.is_mac then
    mod.SUPER     = 'SUPER'
    mod.SUPER_REV = 'SUPER|CTRL'
    mod.OPT       = 'ALT'
elseif platform.is_win or platform.is_linux then
    mod.SUPER     = 'ALT' -- to not conflict with Windows key shortcuts
    mod.SUPER_REV = 'ALT|CTRL'
    mod.OPT       = 'CTRL'
end

return {
    keys = {
        -- Tabs: navigation
        { key = 'LeftArrow',  mods = mod.SUPER,     action = act.ActivateTabRelative(-1) },
        { key = 'RightArrow', mods = mod.SUPER,     action = act.ActivateTabRelative(1) },
        { key = 'LeftArrow',  mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
        { key = 'RightArrow', mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

        -- Cursor: movement
        -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
        { key = "LeftArrow",  mods = mod.OPT,     action = act.SendString("\x1bb") },
        -- Make Option-Right equivalent to Alt-f; forward-word
        { key = "RightArrow", mods = mod.OPT,     action = act.SendString("\x1bf") },
    }
}
