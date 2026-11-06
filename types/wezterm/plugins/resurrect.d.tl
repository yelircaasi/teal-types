local _tmp = require("_tmp")

local record EncryptionOpts
	enable: boolean
	method: string
	private_key: string | nil
	public_key: string | nil

	decrypt: function(file_path: string): string

	encrypt: function(file_path: string, lines: string): nil
end

local record TabSize
	cols: integer
	dpi: integer
	pixel_height: integer
	pixel_width: integer
	rows: integer
end

local record WorkspaceState where self._tl_type == "WorkspaceState"
	_tl_type: string
	window_states: {WindowState}
	workspace: string
end

local record WindowState where self._tl_type == "WorkspaceState"
	_tl_type: string
	size: TabState
	tabs: {TabState}
	title: string
	workspace: string
end

local record PaneTree
	alt_screen_active: boolean
	bottom: PaneTree | nil
	cwd: string
	domain: string | nil
	height: integer
	is_active: boolean
	is_zoomed: boolean
	left: integer
	pane: _tmp.Pane | nil
	process: _tmp.LocalProcessInfo | nil
	right: PaneTree | nil
	text: string
	top: integer
	width: integer
end

local record TabState where self._tl_type == "WorkspaceState"
	_tl_type: string
	is_active: boolean
	is_zoomed: boolean
	pane_tree: PaneTree
	title: string
end

local record RestoreOpts
	absolute: boolean | nil
	close_open_panes: boolean | nil
	close_open_tabs: boolean | nil
	pane: _tmp.Pane | nil
	relative: boolean | nil
	resize_window: boolean | nil
	spawn_in_workspace: boolean | nil
	tab: _tmp.MuxTab | nil
	window: _tmp.MuxWindow

	on_pane_restore: function(pane_tree: PaneTree): nil
end

local record FuzzyLoadOpts
	date_format: string
	description: string
	fuzzy_description: string
	ignore_screen_width: boolean
	ignore_tabs: boolean
	ignore_windows: boolean
	ignore_workspaces: boolean
	is_fuzzy: boolean
	min_filename_size: number
	name_truncature: string
	show_state_with_date: boolean
	title: string

	fmt_date: function(label: string): string

	fmt_tab: function(label: string): string

	fmt_window: function(label: string): string

	fmt_workspace: function (label: string): string
end

local record FuzzyLoader
	default_fuzzy_load_opts: FuzzyLoadOpts

	---A fuzzy finder to restore saved state.
	type _Callback = function(id: string, label: string, save_state_dir: string): nil --?
	fuzzy_load: function(window:_records.Window, pane: _tmp.Pane, callback: _Callback, opts: FuzzyLoadOpts|nil): nil
end

local record PeriodicSaveOpts
	interval_seconds: integer | nil
	save_tabs: boolean | nil
	save_windows: boolean | nil
	save_workspaces: boolean | nil
end

local record StateManager
	save_state_dir: string | nil

	---Changes the directory to save the state to.
	change_state_save_dir: function(directory: string): nil

	delete_state: function(file_path: string): nil

	---Reads a file with the state.
	load_state: function(name: string, type: string): WorkspaceState|WindowState|TabState

	---Saves the stater after interval in seconds.
	---@param opts? StateManager.PeriodicSaveOpts
	periodic_save: function(opts: PeriodicSaveOpts|nil): nil

	---Callback for resurrecting workspaces on startup.
	---@return boolean success
	resurrect_on_gui_startup: function(): string|nil

	---Save state to a file.
	save_state: function(state: WorkspaceState|WindowState|TabState, opt_name: string|nil): nil

	---Merges user-supplied options with default options.
	set_encryption: function(user_opts: EncryptionOpts): nil

	set_max_nlines: function(max_nlines: integer): nil

	---Writes the current state name and type.
	---@param name string
	---@param type string
	write_current_state: function(name: string, type: string): {boolean, string|nil}
end

local record Resurrect
	fuzzy_loader:    FuzzyLoader
	state_manager:   StateManager
	tab_state:       TabState
	window_state:    WindowState
	workspace_state: WorkspaceState
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
