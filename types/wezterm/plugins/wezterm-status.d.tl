local _tmp = require("_tmp")

local record UiConfig --WeztermStatus.UiConfig
	separators: WeztermStatus |SeparatorConfig | nil   ---Visual separators used in the status bar.
	theme: _tmp.TabBarColor | nil                           ---Theme for the status bar.
end

local record SeparatorConfig --WeztermStatus.SeparatorConfig
	arrow_solid_left: string | nil    ---Unicode character for solid left arrow.
	arrow_solid_right: string | nil   ---Unicode character for solid right arrow.
	arrow_thin_left: string | nil     ---Unicode character for thin left arrow.
	arrow_thin_right: string | nil    ---Unicode character for thin right arrow.
end

local record CellsConfig --WeztermStatus.CellsConfig
	battery: WeztermStatus |BatteryConfig | nil     ---Battery indicator configuration.
	cwd: WeztermStatus |CwdConfig | nil             ---Current working directory configuration.
	date: WeztermStatus |DateConfig | nil           ---Date and time display configuration.
	hostname: WeztermStatus |HostnameConfig | nil   ---Hostname display configuration.
	---Kubernetes context configuration.
	k8s_context: K8SContextConfig | nil
	mode: WeztermStatus |ModeConfig | nil             ---Mode indicator configuration.
	workspace: WeztermStatus |WorkspaceConfig | nil   ---WezTerm workspace configuration.
end

local record ModeConfig --WeztermStatus.ModeConfig
	enabled: boolean | nil          ---Whether to show mode indicator.
	modes: {string: string} | nil   ---Mapping of mode names to their icons.
end

local record BatteryConfig --WeztermStatus.BatteryConfig
	custom: function(): string   ---Custom callback that will allow to format the battery.
	enabled: boolean | nil       ---Whether to show battery status.
end

local record HostnameConfig --WeztermStatus.HostnameConfig
	enabled: boolean | nil   ---Whether to show hostname.
end

local record CwdConfig --WeztermStatus.CwdConfig
	enabled: boolean | nil                                  ---Whether to show current directory.
	path_aliases: WeztermStatus | {PathAliasConfig} | nil   ---Array of path alias configurations.
	tilde_prefix: boolean | nil                             ---Whether to replace home directory with tilde.
end

local record DateConfig --WeztermStatus.DateConfig
	enabled: boolean | nil  ---Whether to show date/time.
	format: string | nil    ---The `strftime` format string.
	icon: string | nil      ---Icon to show before time.
end

local record PathAliasConfig --WeztermStatus.PathAliasConfig
	pattern: string       ---Pattern to match in the path.
	replacement: string   ---Text to replace the matched pattern with.
end

local record WorkspaceConfig --WeztermStatus.WorkspaceConfig
	enabled: boolean | nil   ---Whether to show workspace or not.
	icon: string | nil       ---Icon to show before time.
end

local record K8SContextConfig --WeztermStatus.K8SContextConfig
	enabled: boolean | nil       ---Whether to show context or not.
	kubectl_path: string | nil   ---The `kubectl` path.
end

local record WeztermStatusConfig
	cells: WeztermStatus |CellsConfig | nil   ---Status cells configuration.
	ui: WeztermStatus |UiConfig | nil         ---UI-related configuration.
end

local record WeztermStatus
	cells: table   ---All cells of the status bar.
	config: WeztermStatusConfig   ---Internal plugin configuration.

	apply_to_config: function(wezterm_config: _tmp.Config, opts: WeztermStatusConfig|nil): nil   ---Applies configuration to Wezterm's status bar.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
