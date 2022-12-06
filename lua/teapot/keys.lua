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

-- mode: mode in vim.keymap.set()
-- options?: options in vim.keymap.set()
local function SetkeysBulder( mode, options )
  local options = options or {}
  return function( keymaps )
    setkeys( mode, keymaps, options )
  end
end

M.SetkeysBulder = SetkeysBulder



return M
