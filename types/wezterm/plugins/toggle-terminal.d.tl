local _tmp = require("_tmp")

local enum Direction
	"Down"
	"Left"
	"Right"
	"Up"
end

local record _Percentage
	Percent: integer
end

local record Zoom --ToggleTerminalOpts.Zoom
	auto_zoom_invoker_pane: boolean | nil   ---Automatically zoom invoker pane.
	auto_zoom_toggle_terminal: boolean | nil   ---Automatically zoom toggle terminal pane.
	remember_zoomed: boolean | nil   ---Automatically re-zoom the toggle pane if it was zoomed before switching away.
end

---User overrides for the toggle terminal options.
local record ToggleTerminalOpts
	change_invoker_id_everytime: boolean | nil   ---Change invoker pane on every toggle.
	direction: Direction | nil   ---Direction to split the pane.
	key: string | nil   ---Key for the toggle action.
	mods: string | nil   ---Modifier keys for the toggle action.
	size: _Percentage | nil   ---Size of the split pane.
	zoom: Zoom | nil
end

local record ToggleTerminal

	---@param user_opts? ToggleTerminalOpts
	apply_to_config: function(config: _tmp.Config, user_opts: ToggleTerminalOpts|nil): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
