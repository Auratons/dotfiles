local wezterm = require('wezterm')

local module = {}

local function is_found(str, pattern)
    return string.find(str, pattern) ~= nil
end

-- Check host platform
function module.platform()
    local is_win = is_found(wezterm.target_triple, 'windows')
    local is_linux = is_found(wezterm.target_triple, 'linux')
    local is_mac = is_found(wezterm.target_triple, 'apple')
    local os = is_win and 'windows' or is_linux and 'linux' or is_mac and 'mac' or 'unknown'
    return {
        os = os,
        is_win = is_win,
        is_linux = is_linux,
        is_mac = is_mac,
    }
end

-- Merge two tables recursively
function module.merge(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                t1[k] = merge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
  end

return module
