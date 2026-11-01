local _tmp = require("_tmp")

local record TabsetsData
	colors:        table
	tabs:          {TabData}
	window_height: integer
	window_width:  integer
end

local record TabData --Tabsets.TabData
	panes: {TabsetPaneData}
	title: string
end

local record TabsetPaneData
	cwd:  string
	exe:  string
	left: integer
end

local record TabsetsOpts
	fuzzy_selector:     boolean | nil ---Fuzzy match tabset name selection.
	restore_colors:     boolean | nil ---Restore custom colors when loading empty window.
	restore_dimensions: boolean | nil ---Restore window dimensions when loading empty window.
	tabsets_dir:        string  | nil ---Path to the directory containing tabset JSON files.
end

local record Tabsets
	options: TabsetsOpts

	delete_tabset: function(window: _tmp.Window): nil   ---Interactively delete a saved tabset. Prompts for a tabset, deletes the corresponding JSON file and notifies the user.

	load_tabset: function(window: _tmp.Window): nil   ---Interactively load a saved tabset. Shows a selector of available tabsets, then calls @{load_tabset_by_name} on the chosen entry.

	load_tabset_by_name: function(window: _tmp.Window, tabset_name: string): nil   ---Load and restore a tabset by its logical name. If loading or recreation fails, a notification is shown to the user.

	rename_tabset: function(window: _tmp.Window): nil   ---Rename a tabset.

	save_tabset: function(window: _tmp.Window): nil   ---Interactively save the current window layout as a tabset. Prompts for a tabset name, validates it and writes a JSON description to disk.

	setup: function(opts: TabsetsOpts|nil): nil   ---Initialize plugin and set configuration options.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
