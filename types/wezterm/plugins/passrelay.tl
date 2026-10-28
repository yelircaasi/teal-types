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
	get_userlist: string | nil|fun(): user_list: string[]
	hotkey: PassRelayOpts | nil.Hotkey
	toast_time: integer | nil
end

local record PassRelay
local M = {}

---@param window Window
---@param pane Pane
---@param module_settings PassRelayOpts
---@param bypass_local_echo_check? boolean
function M._continue_password(window, pane, module_settings, bypass_local_echo_check) end

function M.apply_to_config(config: Config, module_settings: PassRelayOpts) end

---@param window Window
function M.exec_password_manager(pane: Pane, pane, module_settings: PassRelayOpts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
