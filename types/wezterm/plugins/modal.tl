---@diagnostic disable:unused-local

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
	key_tables: {Key}
	modes: {string: ModalWeztermMode}
local M = {}

---Activates mode.
---@param name string
---@param activate_key_table_params? ActivateKeyTableParams
activate_mode: function(name, activate_key_table_params): Action

---@param name string
---@param key_table {Key}
---@param key_table_name? string
---@param status_text? string
add_mode: function(name, key_table, status_text, key_table_name) end

apply_to_config: function(config: Config) end

---Wrapper for creating a simple status text.
---@param left_seperator ModalWeztermSeparator
create_status_text: function(key_hints: ModalWeztermSeparator, key_hints, mode: ModalWeztermSeparator): string

enable_defaults: function(url: string) end

---Exits all active modes.
exit_all_modes: function(name: string): Action

---Exits active mode.
exit_mode: function(name: string): Action

get_mode: function(window: Window The `Window` object.) end

---Resets the window title to the foreground process by emitting a OSC 2 escape sequence.
reset_window_title: function(pane: Pane The `Pane` object.): nil

set_default_keys: function(config: Config) end

---Sets the current modal status to the right status.
set_right_status: function(window: Window The `Window` object.): nil

---Sets the window title by emitting a OSC 2 escape sequence.
---@param pane Pane The `Pane` object.
---@param name? string
set_window_title: function(pane, name) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
