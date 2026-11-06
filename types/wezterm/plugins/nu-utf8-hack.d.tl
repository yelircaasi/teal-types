local _tmp = require("_tmp")

local record NuUtf8HackOpts
	char_table: string | nil
	key_tables: {string:_records.SendKeyParams} | nil
end

local record NuUtf8Hack
	apply_to_config: function(config: _tmp.Config, plugin_config: NuUtf8HackOpts|nil): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
