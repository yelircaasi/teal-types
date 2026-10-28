---@diagnostic disable:unused-local

local record Resurrect.EncryptionOpts
	enable: boolean
	method: string
	private_key: string | nil
	public_key: string | nil
local E = {}

function E.decrypt(file_path: string): string

function E.encrypt(file_path: string, lines: string) end

local record Resurrect.TabSize
	cols: integer
	dpi: integer
	pixel_height: integer
	pixel_width: integer
	rows: integer
end

local record Resurrect.WorkspaceState
	window_states: Resurrect.WindowState[]
	workspace: string
end

local record Resurrect.WindowState
	size: Resurrect.TabState
	tabs: Resurrect.TabState[]
	title: string
	workspace: string
end

local record Resurrect.PaneTree
	alt_screen_active: boolean
	bottom: Resurrect | nil.PaneTree
	cwd: string
	domain: string | nil
	height: integer
	is_active: boolean
	is_zoomed: boolean
	left: integer
	pane: Pane | nil
	process: LocalProcessInfo | nil
	right: Resurrect | nil.PaneTree
	text: string
	top: integer
	width: integer
end

local record Resurrect.TabState
	is_active: boolean
	is_zoomed: boolean
	pane_tree: Resurrect.PaneTree
	title: string
end

local record Resurrect.RestoreOpts
	absolute: boolean | nil
	close_open_panes: boolean | nil
	close_open_tabs: boolean | nil
	pane: Pane | nil
	relative: boolean | nil
	resize_window: boolean | nil
	spawn_in_workspace: boolean | nil
	tab: MuxTab | nil
	window: MuxWindow
local restore = {}

function restore.on_pane_restore(pane_tree: Resurrect.PaneTree) end

local record Resurrect.FuzzyLoadOpts
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
local F_OPTS = {}

function F_OPTS.fmt_date(label: string): string

function F_OPTS.fmt_tab(label: string): string

function F_OPTS.fmt_window(label: string): string

function F_OPTS.fmt_workspace(label: string): string

local record Resurrect.FuzzyLoader
	default_fuzzy_load_opts: Resurrect.FuzzyLoadOpts
local F = {}

---A fuzzy finder to restore saved state.
---@param window MuxWindow The `MuxWindow` object.
---@param pane Pane The `Pane` object.
---@param callback fun(id: string, label: string, save_state_dir: string)
---@param opts? Resurrect.FuzzyLoadOpts
function F.fuzzy_load(window, pane, callback, opts) end

local record StateManager.PeriodicSaveOpts
	interval_seconds: integer | nil
	save_tabs: boolean | nil
	save_windows: boolean | nil
	save_workspaces: boolean | nil
end

local record Resurrect.StateManager
	save_state_dir: string | nil
local S = {}

---Changes the directory to save the state to.
function S.change_state_save_dir(directory: string): nil

function S.delete_state(file_path: string) end

---Reads a file with the state.
function S.load_state(name: string, type: string): Resurrect.WorkspaceState|Resurrect.WindowState|Resurrect.TabState

---Saves the stater after interval in seconds.
---@param opts? StateManager.PeriodicSaveOpts
function S.periodic_save(opts) end

---Callback for resurrecting workspaces on startup.
---@return boolean success
function S.resurrect_on_gui_startup(): string|nil|?

---Save state to a file.
---@param state Resurrect.WorkspaceState|Resurrect.WindowState|Resurrect.TabState
---@param opt_name? string
function S.save_state(state, opt_name) end

---Merges user-supplied options with default options.
function S.set_encryption(user_opts: Resurrect.EncryptionOpts): nil

function S.set_max_nlines(max_nlines: integer) end

---Writes the current state name and type.
---@param name string
---@param type string
---@return boolean success
function S.write_current_state(name, type): string|nil|? | nil

local record Resurrect
	fuzzy_loader: Resurrect.FuzzyLoader
	state_manager: Resurrect.StateManager
	tab_state: Resurrect.TabState
	window_state: Resurrect.WindowState
	workspace_state: Resurrect.WorkspaceState

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
