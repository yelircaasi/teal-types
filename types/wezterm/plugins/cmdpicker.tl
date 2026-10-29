---@diagnostic disable:unused-local

local record CmdPickerBinding: Key
	key: string
	mods: string
	action: Action
	desc: string | nil
end

local record CmdPickerOpts
	key: string | nil
	mods: string | nil
	title: string | nil
	include_defaults: boolean | nil
	include_key_tables: boolean | nil
	fuzzy: boolean | nil
	fuzzy_description: string | nil
end

local record CmdPicker
local M = {}

---Inject the trigger keybinding into config.keys.
---Call this AFTER all keybindings are defined.
---@param config Config
---@param opts? CmdPickerOpts
apply_to_config: function(config, opts) end

---Registers bindings for the picker and optionally adds them to `config.keys`.
---Add bindings to `config.keys`:
---```lua
---add_keys(config, bindings)
---```
---Register existing bindings for the picker without modifying config.keys.
---Useful when you define keybindings in a separate file that returns a keys list:
---```lua
---add_keys(bindings)
---```
---Bindings can include an optional `desc` field for human-readable descriptions.
add_keys: function(bindings: {CmdPickerBinding}): nil

---Registers bindings for the picker and optionally adds them to `config.keys`.
---Add bindings to `config.keys`:
---```lua
---add_keys(config, bindings)
---```
---Register existing bindings for the picker without modifying config.keys.
---Useful when you define keybindings in a separate file that returns a keys list:
---```lua
---add_keys(bindings)
---```
---Bindings can include an optional `desc` field for human-readable descriptions.
add_keys: function(config: Config, bindings: {CmdPickerBinding}): nil

register: function(bindings: {CmdPickerBinding}) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
