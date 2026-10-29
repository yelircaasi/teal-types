---@diagnostic disable:unused-local

local record TabsetsData
	colors: table
	tabs: Tabsets.TabData[]
	window_height: integer
	window_width: integer
end

local record Tabsets.TabData
	panes: TabsetPaneData[]
	title: string
end

local record TabsetPaneData
	cwd: string
	exe: string
	left: integer
end

local record TabsetsOpts
	---Fuzzy match tabset name selection.
	fuzzy_selector: boolean | nil
	---Restore custom colors when loading empty window.
	restore_colors: boolean | nil
	---Restore window dimensions when loading empty window.
	restore_dimensions: boolean | nil
	---Path to the directory containing tabset JSON files.
	tabsets_dir: string | nil
end

local record Tabsets
	options: TabsetsOpts
local M = {}

---Interactively delete a saved tabset.
---Prompts for a tabset, deletes the corresponding JSON file and notifies the user.
delete_tabset: function(window: Window Active WezTerm window.): nil

---Interactively load a saved tabset.
---Shows a selector of available tabsets, then calls @{load_tabset_by_name} on the chosen entry.
load_tabset: function(window: Window Active WezTerm window.): nil

---Load and restore a tabset by its logical name.
---If loading or recreation fails, a notification is shown to the user.
load_tabset_by_name: function(window: Window Active WezTerm window., tabset_name: string Tabset name (without extension), defaults to `"default"`.): nil

---Rename a tabset.
rename_tabset: function(window: Window Active WezTerm window.): nil

---Interactively save the current window layout as a tabset.
---Prompts for a tabset name, validates it and writes a JSON description to disk.
save_tabset: function(window: Window Active WezTerm window.): nil

---Initialize plugin and set configuration options.
---@param opts? TabsetsOpts Options table.
setup: function(opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
