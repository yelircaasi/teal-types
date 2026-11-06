local _tmp = require("_tmp")

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

local record _Action
	EmitEvent: string
end

local record SyncPanes
	toggle: _Action

	apply_to_config: function(config: _tmp.Config, opts: SyncPanesOpts|nil): _tmp.Config

	is_synced: function(window:_records.Window): boolean
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
