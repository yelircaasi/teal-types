---@diagnostic disable:unused-local

local type BatteryCondition =
	"Charging"|"Discharging"|"Empty"|"Full"|"Unknown"

--- BatteryComponent class representing battery information.
local record BatteryComponent
	---The battery icon and percentage (e.g. `"󰂉  100%"`).
	battery: string
	---The battery condition ("Full", "Empty", "Charging", "Discharging", "Unknown").
	condition: BatteryCondition
	---The icon representing the battery status (e.g. `"󰢜 "`).
	icon: string
	---The battery percentage (from `0.0` to `1.0`).
	percent: number
	---The remaining time in minutes.
	time: integer
local B = {}

---The remaining time as a string (e.g. `"10:00"`).
function B.remaining(): string

---The `battery.wez` module.
local record BatteryWez
	invert: boolean Whether to invert colors
local M = {}

---Apply plugin configuration.
function M.apply_to_config(config: Config WezTerm configuration table): nil

---Returns battery components for each battery.
---If no batteries are detected, an empty table is returned.
function M.get_batteries(): BatteryComponent[]

---Returns battery icons for all batteries.
---If no batteries are detected, an empty string is returned.
function M.get_battery_icons(): string

---Returns battery statistics for all batteries.
---If no batteries are detected, an empty string is returned.
function M.get_battery_stats(): string

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
