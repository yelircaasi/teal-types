local _tmp = require("_tmp")

local record Action
	filter: string

	action: function(window:_records.Window, pane: _tmp.Pane, selection: string, opts: Quick_SelectOpts): nil
end

local record Quick_SelectOpts
	actions:         {Action}           | nil
	direction:      _enums.PaneDirection | nil
	key:             string             | nil
	mods:            string             | nil
	patterns:        {string}           | nil
	text_extensions: {string: boolean}  | nil
end

local record Filters
	match: function(str: string): any
	startswith: function(str: string): boolean
end

local record Quick_Select
	filters: Filters

	apply_to_config: function(config: _tmp.Config, opts: Quick_SelectOpts|nil): nil

	open_with_hx: function(window:_records.Window, pane: _tmp.Pane, url: string, opts: Quick_SelectOpts): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
