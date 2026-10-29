---@diagnostic disable:unused-local

local type UserListFormat =
	"json"|"text"

local record PassRelay.UserListSpec
	command: string | nil
	format: UserListFormat | nil
	id_path: string | nil
	label_path: string | nil
end

local record PassRelayOpts.Hotkey: SendKeyParams
	key: string
	mods: string
end

local record PassRelayOpts
	debug: integer | nil
	get_password: string|fun(user: string): password: string
	get_userlist: string | nil|fun(): user_list: {string}
	hotkey: PassRelayOpts |Hotkey | nil
	toast_time: integer | nil
end

local record PassRelay
local M = {}

---@param window Window
---@param pane Pane
---@param module_settings PassRelayOpts
---@param bypass_local_echo_check? boolean
_continue_password: function(window, pane, module_settings, bypass_local_echo_check) end

apply_to_config: function(config: Config, module_settings: PassRelayOpts) end

---@param window Window
exec_password_manager: function(pane: Pane, pane, module_settings: PassRelayOpts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
