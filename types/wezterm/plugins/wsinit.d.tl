local _tmp = require("_tmp")

local record WsInitKey --: SendKeyParams
	key:  string | nil
	mods: string | nil
end

local record WsInitOpts
	init_workspace_keys: WsInitKey | nil
	workspaces_dir:      string    | nil
end

local record WsInit
	apply_to_config: function(config: _tmp.Config): nil

	setup: function(opts: WsInitOpts): nil
end
-- vim: set ts=2 sts=2 sw=2 et ai si sta:
