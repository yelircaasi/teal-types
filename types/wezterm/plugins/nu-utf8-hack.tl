local record NuUtf8HackOpts
	char_table: string | nil
	key_tables: table | nil<string, SendKeyParams>
end

local record NuUtf8Hack
local M = {}

---@param config Config
---@param plugin_config? NuUtf8HackOpts
apply_to_config: function(config, plugin_config) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
