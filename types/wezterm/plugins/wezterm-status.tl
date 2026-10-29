local record WeztermStatus.UiConfig
	---Visual separators used in the status bar.
	separators: WeztermStatus |SeparatorConfig | nil
	---Theme for the status bar.
	theme: TabBarColor | nil
end

local record WeztermStatus.SeparatorConfig
	---Unicode character for solid left arrow.
	arrow_solid_left: string | nil
	---Unicode character for solid right arrow.
	arrow_solid_right: string | nil
	---Unicode character for thin left arrow.
	arrow_thin_left: string | nil
	---Unicode character for thin right arrow.
	arrow_thin_right: string | nil
end

local record WeztermStatus.CellsConfig
	---Battery indicator configuration.
	battery: WeztermStatus |BatteryConfig | nil
	---Current working directory configuration.
	cwd: WeztermStatus |CwdConfig | nil
	---Date and time display configuration.
	date: WeztermStatus |DateConfig | nil
	---Hostname display configuration.
	hostname: WeztermStatus |HostnameConfig | nil
	---Kubernetes context configuration.
	k8s_context: WeztermStatus.K8SContextConfig | nil
	---Mode indicator configuration.
	mode: WeztermStatus |ModeConfig | nil
	---WezTerm workspace configuration.
	workspace: WeztermStatus |WorkspaceConfig | nil
end

local record WeztermStatus.ModeConfig
	---Whether to show mode indicator.
	enabled: boolean | nil
	---Mapping of mode names to their icons.
	modes: table | nil<string, string>
end

local record WeztermStatus.BatteryConfig
	---Custom callback that will allow to format the battery.
	custom: fun | nil(): string
	---Whether to show battery status.
	enabled: boolean | nil
end

local record WeztermStatus.HostnameConfig
	---Whether to show hostname.
	enabled: boolean | nil
end

local record WeztermStatus.CwdConfig
	---Whether to show current directory.
	enabled: boolean | nil
	---Array of path alias configurations.
	path_aliases: WeztermStatus |{PathAliasConfig} | nil
	---Whether to replace home directory with tilde.
	tilde_prefix: boolean | nil
end

local record WeztermStatus.DateConfig
	---Whether to show date/time.
	enabled: boolean | nil
	---The `strftime` format string.
	format: string | nil
	---Icon to show before time.
	icon: string | nil
end

local record WeztermStatus.PathAliasConfig
	---Pattern to match in the path.
	pattern: string
	---Text to replace the matched pattern with.
	replacement: string
end

local record WeztermStatus.WorkspaceConfig
	---Whether to show workspace or not.
	enabled: boolean | nil
	---Icon to show before time.
	icon: string | nil
end

local record WeztermStatus.K8SContextConfig
	---Whether to show context or not.
	enabled: boolean | nil
	---The `kubectl` path.
	kubectl_path: string | nil
end

local record WeztermStatusConfig
	---Status cells configuration.
	cells: WeztermStatus |CellsConfig | nil
	---UI-related configuration.
	ui: WeztermStatus |UiConfig | nil
end

local record WeztermStatus
	---All cells of the status bar.
	cells: table
	---Internal plugin configuration.
	-- PROTECTED:
	config: WeztermStatusConfig

	---Applies configuration to Wezterm's status bar.
	apply_to_config: function(wezterm_config: Config, opts: WeztermStatusConfig|nil): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
