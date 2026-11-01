local _tmp = require("_tmp")

local enum BatteryCondition
	"Charging"
	"Discharging"
	"Empty"
	"Full"
	"Unknown"
end

--- BatteryComponent class representing battery information.
local record BatteryComponent
	battery: string                 ---The battery icon and percentage (e.g. `"󰂉  100%"`).
	condition: BatteryCondition     ---The battery condition ("Full", "Empty", "Charging", "Discharging", "Unknown").
	icon: string                    ---The icon representing the battery status (e.g. `"󰢜 "`).
	percent: number                 ---The battery percentage (from `0.0` to `1.0`).
	time: integer                   ---The remaining time in minutes.
	remaining: function(): string   ---The remaining time as a string (e.g. `"10:00"`).
end

---The `battery.wez` module.
local record BatteryWez
	invert: boolean
	apply_to_config: function(config: _tmp.Config): nil   ---Apply plugin configuration.
	get_batteries: function(): {BatteryComponent}         ---If no batteries are detected, an empty table is returned.   ---Returns battery components for each battery.
	get_battery_icons: function(): string                 ---If no batteries are detected, an empty string is returned.   ---Returns battery icons for all batteries.
	get_battery_stats: function(): string                 ---If no batteries are detected, an empty string is returned.   ---Returns battery statistics for all batteries.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
