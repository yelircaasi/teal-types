---@diagnostic disable:unused-local

local type BarWeztermOpts.Position =
	"bottom"|"top"

local record BarWeztermOpts.Separator
	field_icon: string | nil
	left_icon: string | nil
	right_icon: string | nil
	space: integer | nil
end

local record BarWeztermOpts.Tabs
	active_tab_bg: number | nil|string
	active_tab_fg: number | nil|string
	inactive_tab_bg: number | nil|string
	inactive_tab_fg: number | nil|string
	new_tab_bg: number | nil|string
	new_tab_fg: number | nil|string
end

local record BarWeztermOpts.Module
	color: integer | nil
	enabled: boolean | nil
	icon: string | nil
end

local record BarWeztermOpts.Spotify: BarWeztermOpts.Module
	max_width: integer | nil
	throttle: integer | nil
end

local record BarWeztermOpts.Clock: BarWeztermOpts.Module
	format: string | nil
end

local record BarWeztermOpts.Modules
	clock: BarWeztermOpts |Clock | nil
	cwd: BarWeztermOpts |Module | nil
	hostname: BarWeztermOpts |Module | nil
	leader: BarWeztermOpts |Module | nil
	pane: BarWeztermOpts |Module | nil
	ssh: BarWeztermOpts |Module | nil
	spotify: BarWeztermOpts |Spotify | nil
	tabs: BarWeztermOpts |Tabs | nil
	username: BarWeztermOpts |Module | nil
	workspace: BarWeztermOpts |Module | nil
	zoom: BarWeztermOpts |Module | nil
end

local record BarWeztermOpts.Padding.Tabs
	left: integer | nil
	right: integer | nil
end

local record BarWeztermOpts.Padding: BarWeztermOpts.Padding.Tabs
	tabs: BarWeztermOpts |Padding.Tabs | nil
end

local record BarWeztermOpts
	max_width: integer | nil
	modules: BarWeztermOpts |Modules | nil
	padding: BarWeztermOpts |Padding | nil
	position: BarWeztermOpts |Position | nil
	separator: BarWeztermOpts |Separator | nil
end

local record BarWezterm
	apply_to_config: function(c: Config, opts: BarWeztermOpts | nil) end
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
