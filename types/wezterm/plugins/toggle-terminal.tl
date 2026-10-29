---@diagnostic disable:unused-local

local type ToggleTerminalOpts.Direction =
	"Down"|"Left"|"Right"|"Up"

local record ToggleTerminalOpts.Zoom
	---Automatically zoom invoker pane.
	auto_zoom_invoker_pane: boolean | nil
	---Automatically zoom toggle terminal pane.
	auto_zoom_toggle_terminal: boolean | nil
	---Automatically re-zoom the toggle pane if it was zoomed before switching away.
	remember_zoomed: boolean | nil

---User overrides for the toggle terminal options.
local record ToggleTerminalOpts
	---Change invoker pane on every toggle.
	change_invoker_id_everytime: boolean | nil
	---Direction to split the pane.
	direction: ToggleTerminalOpts |Direction | nil
	---Key for the toggle action.
	key: string | nil
	---Modifier keys for the toggle action.
	mods: string | nil
	---Size of the split pane.
	size: { Percent: integer } | nil
	zoom: ToggleTerminalOpts |Zoom | nil
end

local record ToggleTerminal
local M = {}

---@param config Config
---@param user_opts? ToggleTerminalOpts
apply_to_config: function(config, user_opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
