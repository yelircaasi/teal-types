local record SpawnPosition
	---@field origin? "ScreenCoordinateSystem"|"MainScreen"|"ActiveScreen"|{ Named: string }
	x: integer | nil
	y: integer | nil

---The `SpawnCommand` struct specifies information about a new command to be spawned.
---It is a Lua object with the following fields; all of the fields have reasonable defaults and
---can be omitted.
local record SpawnCommand
	---The argument array specifying the command and its arguments.
	---If omitted, the default program for the target domain will be spawned.
	args: string | nil[]
	---The current working directory to set for the command.
	---If omitted, wezterm will infer a value based on the active pane at the time this action
	---is triggered.
	---If the active pane matches the domain specified in this `SpawnCommand` instance then the
	---current working directory of the active pane will be used.
	---If the current working directory cannot be inferred then it will typically fall back to using
	---the `$HOME` directory of the current user.
	cwd: string | nil
	---Specifies that the multiplexer domain
	---of the currently active pane should be used
	---to start this process.
	---@field domain? "DefaultDomain"|"local"|"CurrentPaneDomain"|{ DomainName: string }
	---An optional label.
	---The `label` is only used for `SpawnCommand` instances that are listed in the `launch_menu`
	---configuration section.
	---If `label` is omitted, a default will be produced based on the `args` field.
	label: string | nil
	---Specifies the initial position for a GUI window when this command is used in a context that will
	---create a new window, such as with:
	--- - [`wezterm.mux.spawn_window()`](lua://Wezterm.Mux.spawn_window)
	--- - `SpawnCommandInNewWindow`
	position: SpawnPosition | nil
	---Sets additional environment variables in the environment for this command invocation.
	set_environment_variables: table | nil<string, any>

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
