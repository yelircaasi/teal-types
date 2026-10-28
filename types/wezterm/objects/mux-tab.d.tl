local record MuxSize
	rows: integer
	cols: integer
	pixel_width: integer
	pixel_height: integer
	dpi: number

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

---`MuxTab` represents a tab that is managed by the multiplexer.
local record MuxTab
local M = {}

---Activates (focuses) the tab.
function M:activate(): nil

---A convenience accessor for returning the active pane in the tab.
function M:active_pane(): Pane

---Returns the pane adjacent to the active pane of the current tab, in the `direction` direction.
---See:
--- - [`ActivatePaneDirection`](https://wezterm.org/config/lua/keyassignment/ActivatePaneDirection.html)
function M:get_pane_direction(direction: "Down"|"Left"|"Next"|"Prev"|"Right"|"Up"): Pane

---Returns the overall size of the tab, taking into account all of the contained panes.
---See:
--- - [`MuxSize`](lua://MuxSize)
function M:get_size(): MuxSize

---Returns the tab title as set by `MuxTab:set_title()`.
---See:
--- - [`MuxTab:set_title()`](lua://MuxTab.set_title)
function M:get_title(): string

---Returns an array table containing the set of `Pane` objects contained by this tab.
---See:
--- - [`Pane`](lua://Pane)
function M:panes(): Pane[]

---Returns an array table containing an extended info entry for each of the panes contained
---by this tab.
---See:
--- - [`MuxTab.PaneInfo`](lua://MuxTab.PaneInfo)
function M:panes_with_info(): MuxTab.PaneInfo[]

---Rotates the panes in the clockwise direction.
function M:rotate_clockwise(): nil

---Rotates the panes in the counter-clockwise direction.
function M:rotate_counter_clockwise(): nil

---Sets the tab title to the provided string.
function M:set_title(title: string): nil

---Sets the zoomed state for the active pane within the current tab.
---A zoomed pane takes up all available space in the tab, hiding all other panes while it is zoomed.
--- - Switching its zoom state off will restore the prior split arrangement
--- - Setting the zoom state to `true` zooms the pane if it wasn't already zoomed
--- - Setting the zoom state to `false` un-zooms the pane if it was zoomed
---Returns the prior zoom state.
function M:set_zoomed(state: boolean): boolean

---Returns the tab ID.
function M:tab_id(): integer

---Returns the `MuxWindow` bject that contains this tab.
function M:window(): MuxWindow

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
