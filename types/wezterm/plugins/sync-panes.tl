---@diagnostic disable:unused-local

local record SyncPanesOpts
	backspace: string | nil
	border: boolean | nil
	border_color: string | nil
	indicator: boolean | nil
	indicator_color: string | nil
	key_table_name: string | nil
	status_text: string | nil
	toggle_key: string | nil
	toggle_mods: string | nil
end

local record SyncPanes
toggle: { EmitEvent: string }
local M = {}

---@param config Config
---@param opts? SyncPanesOpts
apply_to_config: function(config, opts): Config

is_synced: function(window: Window): boolean

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
