local _tmp = require("_tmp")

local record WidgetOpts
	color:    string  | nil
	icon:     string  | boolean | nil
	throttle: integer | nil
end

local record _Separator
	color: string | nil
	text:  string | nil
end

local record WidgetsOpts
	left:      {Widget}   | nil
	right:     {Widget}   | nil
	separator: _Separator | nil
end

local record Battery
	charge: Charge
end

local record CPU
	utilization: Utilization
end

local record Disk
	read:  Read
	space: Space
	write: Write
end

local record Network
	download: Download
	upload:   Upload
end

local record RAM
	utilization: Utilization
end

local record Utilization
	widget: function(opts: WidgetsOpts|nil): Widget
end

local record Charge
	widget: function(opts: WidgetsOpts|nil): Widget
end

local record Read
	widget: function(opts: WidgetsOpts|nil): Widget
end
local record Space
	widget: function(opts: WidgetsOpts|nil): Widget
end

local record Write
	widget: function(opts: WidgetsOpts|nil): Widget
end

local record Download
	widget: function(opts: WidgetsOpts|nil): Widget
end

local record Utilization

	widget: function(opts: WidgetsOpts|nil): Widget
end

local record Upload
	widget: function(opts: WidgetsOpts|nil): Widget
end

local record Widget
	opts: WidgetOpts

	get_text: function (): string

	get_formatted: function(): {integer: {string: string}} --{ [1]: { Foreground: string }, [2]: { Text: string } }
end

local record Widgets
	battery: Battery
	cpu:     CPU
	disk:    Disk
	network: Network
	ram:     RAM

	apply_to_config: function(config: _tmp.Config, opts: WidgetsOpts|nil): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
