local _tmp = require("_tmp")

local enum SpawnDirection
	"Bottom"
	"Left"
	"Right"
	"Top"
end

local record _ActionCallback
	EmitEvent: string
end

local record StackWezAction
	SpawnPane: { _tmp.EmitEvent: string }

	ActivatePaneRelative: function(direction: integer): _ActionCallback
end

local record StackWezTabInfo
	count: integer
	index: integer
end

local enum _CurrentPaneDomain
	"CurrentPaneDomain"
end

local record StackWezOpts
	enrich_tab_title: boolean | nil
	spawn_direction: SpawnDirection
	spawn_domain: _CurrentPaneDomain | nil
end

local record StackWez
	action: StackWezAction

	apply_to_config: function(config: _tmp.Config, user_config: StackWezOpts): nil

	tab_info: function(tab_id: integer): StackWezTabInfo | nil

	tab_title: function(tab_info: _tmp.TabInformation): string
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
