local _tmp = require("_tmp")

local record PivotPaneState
	args: {string}   ---Command arguments.
	command: string   ---Command running in the pane.
	cwd: string   ---Current working directory.
	is_shell: boolean   ---Whether the pane is running a shell.
	priority: integer   ---Process priority for restoration.
	process_name: string   ---Name of the process running in the pane.
	scrollback: string | nil   ---Captured scrollback content if available.
end

local record PivotConfig
	debug: boolean | nil   ---Enable debug logging.
	max_scrollback_lines: integer | nil   ---Maximum number of scrollback lines to preserve. Set it to `0` to disable this.
	priority_apps: {string: number} | nil   ---Table mapping application names to priority values.
	shell_detection: {string} | nil   ---List of shell names to identify shell panes.
end

local record Pivot_ --Pivot.Pivot

	---Determine if a set of panes can be pivoted.
	can_pivot: function (panes: {_tmp.Pane}): {boolean, string|nil}

	---Capture state of a pane.
	capture_pane_state: function (pane: _tmp.Pane): PivotPaneState

	enum _HV
		"horizontal"
		"vertical"
	end
	---Pivot two panes, toggling their orientation.
	pivot_panes: function (panes: {_tmp.Pane}, current_orientation: _HV): boolean

	---Restore pane state.
	restore_pane_state: function (pane: _tmp.Pane, state: PivotPaneState): nil

	---Initialize the module.
	setup: function (module_config: PivotConfig): Pivot_

	type _Table = {string: any} -- TODO: should be: _tmp.Pane|_tmp.PaneInformation|_tmp.MuxTab
	toggle_orientation: function (tab_or_pane: _Table): boolean
end

local record Pivot
	config: PivotConfig
	pivot: Pivot_

	setup: function(user_config: PivotConfig): Pivot_ ---Configure the plugin with custom settings.

	type _Table = {string: any} --TODO: should be: _tmp.Pane|_tmp.MuxTab
	toggle_orientation: function(tab_or_pane: _Table|nil): boolean ---Directly toggle pane orientation.

	toggle_orientation_callback: function(window: _tmp.Window, pane: _tmp.Pane): boolean   ---Callback function for keybindings.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
