local M = {}

--
-- Setkeys: bind a list of keys
--

-- mode & options: see SetkeysBulder
-- keymaps: { key = action } map, see vim.keymap.set()
local function setkeys( mode, keymaps, options )
    for key, action in pairs( keymaps ) do
        vim.keymap.set( mode, key, action, options )
    end
end

--- @param mode ( string | string[] ) aaa
-- mode: mode in vim.keymap.set()
-- options?: options in vim.keymap.set()
M.SetkeysBulder = function( mode, options )
    local options = options or {}
    return function( keymaps )
        setkeys( mode, keymaps, options )
    end
end

--- Set multiple keymaps at once with a set of common keymap modes
---
--- Usage examples:
---
---     BatchSetKeymaps { "n" } { "gc" = ":cmd" }
---     BatchSetKeymaps( { "n" }, { silent = true } ) { "gc" = ":cmd" }
---
--- @param mode string[] Array of modes of what vim.keymap.set() accepts
--- @param options table? Options which vim.keymap.set() accepts
--- @return fun( keymaps: table<string, unknown> ): nil
M.BatchSetKeymaps = function( mode, options )
    --- @param keymaps table<string, unknown> Keymaps to their actions
    local function setter( keymaps )
        for key, action in pairs( keymaps ) do
            vim.keymap.set( mode, key, action, options or {} )
        end
    end
    return setter
end

return M
