---@diagnostic disable:unused-local

local record SyncOpts
	gist_id: string | nil
end

local record Sync
local M = {}

---@param config Config
---@param opts? SyncOpts
apply_to_config: function(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
