local record WsInitKey: SendKeyParams
	key: string | nil
	mods: string | nil
end

local record WsInitOpts
	init_workspace_keys: WsInitKey | nil
	workspaces_dir: string | nil
end

local record WsInit
local M = {}

apply_to_config: function(config: Config) end

setup: function(opts: WsInitOpts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
