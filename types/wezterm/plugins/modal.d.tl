local _tmp = require("_tmp")

local record ModalWeztermSeparator
	text: string
	bg: string
	fg: string
end

local record ModalWeztermMode
	key_table_name: string
	name: string
	status_text: string
end

local record ModalWezterm
	key_tables: {_tmp.Key}
	modes: {string: ModalWeztermMode}

	---Activates mode.
	activate_mode: function(name: string, activate_key_table_params: _tmp.ActivateKeyTableParams|nil): _tmp.Action

	add_mode: function(name: string, key_table: {_tmp.Key}, status_text: string|nil, key_table_name: string|nil): nil

	apply_to_config: function(config: _tmp.Config): nil

	---Wrapper for creating a simple status text.
	create_status_text: function(key_hints: ModalWeztermSeparator, key_hints: ModalWeztermSeparator, mode: ModalWeztermSeparator): string

	enable_defaults: function(url: string): nil

	exit_all_modes: function(name: string): _tmp.Action   ---Exits all active modes.

	exit_mode: function(name: string): _tmp.Action   ---Exits active mode.

	get_mode: function(window: _tmp.Window): nil

	reset_window_title: function(pane: _tmp.Pane): nil   ---Resets the window title to the foreground process by emitting a OSC 2 escape sequence.

	set_default_keys: function(config: _tmp.Config): nil

	set_right_status: function(window: _tmp.Window): nil   ---Sets the current modal status to the right status.

	---@param pane Pane The `Pane` object.
	---@param name? string
	set_window_title: function(pane: _tmp.Pane, name: string|nil): nil   ---Sets the window title by emitting a OSC 2 escape sequence.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
