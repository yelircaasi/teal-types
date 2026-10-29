---@diagnostic disable:unused-local

local record PivotPaneState
	---Command arguments.
	args: {string}
	---Command running in the pane.
	command: string
	---Current working directory.
	cwd: string
	---Whether the pane is running a shell.
	is_shell: boolean
	---Process priority for restoration.
	priority: integer
	---Name of the process running in the pane.
	process_name: string
	---Captured scrollback content if available.
	scrollback: string | nil
end

local record PivotConfig
	---Enable debug logging.
	debug: boolean | nil
	---Maximum number of scrollback lines to preserve
	---Set it to `0` to disable this.
	max_scrollback_lines: integer | nil
	---Table mapping application names to priority values.
	priority_apps: table | nil<string, number>
	---List of shell names to identify shell panes.
	shell_detection: string | {nil}
end

local record Pivot.Pivot
local Pivot = {}

---Determine if a set of panes can be pivoted.
---@param panes {Pane} Array of panes to check
---@return boolean can_pivot
function Pivot.can_pivot(panes): string|nil|? | nil

---Capture state of a pane.
function Pivot.capture_pane_state(pane: Pane The `Pane` object.): PivotPaneState

---Pivot two panes, toggling their orientation.
function Pivot.pivot_panes(panes: {Pane} Array of panes to pivot, current_orientation: "horizontal"|"vertical" Current orientation.): boolean

---Restore pane state.
function Pivot.restore_pane_state(pane: Pane The `Pane` object., state: PivotPaneState): nil

---Initialize the module.
function Pivot.setup(module_config: PivotConfig): Pivot.Pivot

function Pivot.toggle_orientation(tab_or_pane: Pane|PaneInformation|MuxTab): boolean

local record Pivot
	config: PivotConfig
	pivot: Pivot.Pivot
local M = {}

---Configure the plugin with custom settings.
--
setup: function(user_config: PivotConfig): Pivot

---Directly toggle pane orientation.
---@param tab_or_pane? Pane|MuxTab Optional `MuxTab` or `Pane` to use (defaults to current).
toggle_orientation: function(tab_or_pane): boolean

---Callback function for keybindings.
toggle_orientation_callback: function(window: Window `Window` object., pane: Pane `Pane` object.): boolean

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
