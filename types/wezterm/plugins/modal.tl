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
	key_tables: Key[]
	modes: table<string, ModalWeztermMode>
local M = {}

---Activates mode.
---@param name string
---@param activate_key_table_params? ActivateKeyTableParams
function M.activate_mode(name, activate_key_table_params): Action

---@param name string
---@param key_table Key[]
---@param key_table_name? string
---@param status_text? string
function M.add_mode(name, key_table, status_text, key_table_name) end

function M.apply_to_config(config: Config) end

---Wrapper for creating a simple status text.
---@param left_seperator ModalWeztermSeparator
function M.create_status_text(key_hints: ModalWeztermSeparator, key_hints, mode: ModalWeztermSeparator): string

function M.enable_defaults(url: string) end

---Exits all active modes.
function M.exit_all_modes(name: string): Action

---Exits active mode.
function M.exit_mode(name: string): Action

function M.get_mode(window: Window The `Window` object.) end

---Resets the window title to the foreground process by emitting a OSC 2 escape sequence.
function M.reset_window_title(pane: Pane The `Pane` object.): nil

function M.set_default_keys(config: Config) end

---Sets the current modal status to the right status.
function M.set_right_status(window: Window The `Window` object.): nil

---Sets the window title by emitting a OSC 2 escape sequence.
---@param pane Pane The `Pane` object.
---@param name? string
function M.set_window_title(pane, name) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
