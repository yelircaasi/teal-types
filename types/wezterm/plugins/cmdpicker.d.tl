local _tmp = require("_tmp")

local record CmdPickerBinding --: Key
	key: string
	mods: string
	action: _tmp.Action
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

	apply_to_config: function(config: _tmp.Config, opts: CmdPickerOpts|nil): nil   ---Inject the trigger keybinding into config.keys. Call this AFTER all keybindings are defined.

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
	add_keys: function(config: _tmp.Config, bindings: {CmdPickerBinding}): nil

	register: function(bindings: {CmdPickerBinding}): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
