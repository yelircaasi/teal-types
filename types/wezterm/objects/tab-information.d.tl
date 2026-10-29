---The `TabInformation` struct describes a tab.
---`TabInformation` is purely a snapshot of some of the key characteristics of the tab, intended
---for use in synchronous, fast event callbacks that format GUI elements such as the window and tab
---title bars.
local record TabInformation
	---The `PaneInformation` object for the active pane in this tab.
	---See
	--- - [`PaneInformation`](lua://PaneInformation)
	active_pane: PaneInformation
	---The `PaneInformation` array for all panes in the tab.
	---See:
	--- - [`PaneInformation`](lua://PaneInformation)
	panes: {PaneInformation}
	---Is `true` if this tab is the active tab.
	is_active: boolean
	---Is `true` if this tab is the previously active tab.
	is_last_active: boolean
	---The identifier for the tab.
	tab_id: integer
	---The logical tab position within its containing window, with `0` indicating the leftmost tab.
	tab_index: integer
	---The title of the tab.
	tab_title: string
	---The ID of the window that contains this tab.
	window_id: integer
	---The title of the window that contains this tab.
	window_title: string
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
