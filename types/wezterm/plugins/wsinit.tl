---@diagnostic disable:unused-local

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

function M.apply_to_config(config: Config) end

function M.setup(opts: WsInitOpts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
