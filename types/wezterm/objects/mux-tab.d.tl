local record MuxSize
	rows: integer
	cols: integer
	pixel_width: integer
	pixel_height: integer
	dpi: number
end
---Mirrors `MuxPaneInfo` in WezTerm upstream:
---https://github.com/wezterm/wezterm/blob/main/lua-api-crates/mux/src/lib.rs
local record MuxTab.PaneInfo
	---The topological pane index.
	index: integer
	---If `true` then this is the active pane within this tab.
	is_active: boolean
	---Is `true` if the pane is in the zoomed state.
	is_zoomed: boolean
	---The offset from the top left corner of the containing tab to the top left corner of this pane,
	---in cells.
	left: integer
	---The offset from the top left corner of the containing tab to the top left corner of this pane,
	---in cells.
	top: integer
	---The width of the pane in cells.
	width: integer
	---The height of the pane in cells.
	height: integer
	---The width of the pane in pixels.
	pixel_width: integer
	---The height of the pane in pixels.
	pixel_height: integer
	---A `Pane` object.
	pane: Pane
end

---`MuxTab` represents a tab that is managed by the multiplexer.
local record MuxTab

	---Activates (focuses) the tab.
	activate: function(self: MuxTab): nil

	---A convenience accessor for returning the active pane in the tab.
	active_pane: function(self: MuxTab): Pane

	---Returns the pane adjacent to the active pane of the current tab, in the `direction` direction.
	---See:
	--- - [`ActivatePaneDirection`](https://wezterm.org/config/lua/keyassignment/ActivatePaneDirection.html)
	get_pane_direction: function(self: MuxTab, direction: "Down"|"Left"|"Next"|"Prev"|"Right"|"Up"): Pane

	---Returns the overall size of the tab, taking into account all of the contained panes.
	---See:
	--- - [`MuxSize`](lua://MuxSize)
	get_size: function(self: MuxTab): MuxSize

	---Returns the tab title as set by `MuxTab:set_title()`.
	---See:
	--- - [`MuxTab:set_title()`](lua://MuxTab.set_title)
	get_title: function(self: MuxTab): string

	---Returns an array table containing the set of `Pane` objects contained by this tab.
	---See:
	--- - [`Pane`](lua://Pane)
	panes: function(self: MuxTab): Pane[]

	---Returns an array table containing an extended info entry for each of the panes contained
	---by this tab.
	---See:
	--- - [`MuxTab.PaneInfo`](lua://MuxTab.PaneInfo)
	panes_with_info: function(self: MuxTab): MuxTab.PaneInfo[]

	---Rotates the panes in the clockwise direction.
	rotate_clockwise: function(self: MuxTab): nil

	---Rotates the panes in the counter-clockwise direction.
	rotate_counter_clockwise: function(self: MuxTab): nil

	---Sets the tab title to the provided string.
	set_title: function(self: MuxTab, title: string): nil

	---Sets the zoomed state for the active pane within the current tab.
	---A zoomed pane takes up all available space in the tab, hiding all other panes while it is zoomed.
	--- - Switching its zoom state off will restore the prior split arrangement
	--- - Setting the zoom state to `true` zooms the pane if it wasn't already zoomed
	--- - Setting the zoom state to `false` un-zooms the pane if it was zoomed
	---Returns the prior zoom state.
	set_zoomed: function(self: MuxTab, state: boolean): boolean

	---Returns the tab ID.
	tab_id: function(self: MuxTab): integer

	---Returns the `MuxWindow` bject that contains this tab.
	window: function(self: MuxTab): MuxWindow
end
-- vim: set ts=2 sts=2 sw=2 et ai si sta:
