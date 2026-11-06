local _tmp = require("_tmp")

local enum UserListFormat
	"json"
	"text"
end
local record UserListSpec --PassRelay.UserListSpec
	command:    string | nil
	format:     UserListFormat | nil
	id_path:    string | nil
	label_path: string | nil
end

local record Hotkey --: SendKeyParams
	key:  string
	mods: string
end

local record PassRelayOpts
	debug:        integer | nil
	get_password: string|function(user: string): string
	get_userlist: string | nil|function(): {string}
	hotkey:       Hotkey | nil
	toast_time:   integer | nil
end

local record PassRelay
	_continue_password: function(window:_records.Window, pane: _tmp.Pane, module_settings: PassRelayOpts, bypass_local_echo_check: boolean|nil): nil

	apply_to_config: function(config: _tmp.Config, module_settings: PassRelayOpts): nil

	exec_password_manager: function(window:_records.Window, pane: _tmp.Pane, module_settings: PassRelayOpts): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
