local _tmp = require("_tmp")

local record SyncOpts
	gist_id: string | nil
end

local record Sync
	apply_to_config: function(config: _tmp.Config, opts: SyncOpts|nil): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
