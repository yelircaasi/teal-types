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
	clock: BarWeztermOpts | nil.Clock
	cwd: BarWeztermOpts | nil.Module
	hostname: BarWeztermOpts | nil.Module
	leader: BarWeztermOpts | nil.Module
	pane: BarWeztermOpts | nil.Module
	ssh: BarWeztermOpts | nil.Module
	spotify: BarWeztermOpts | nil.Spotify
	tabs: BarWeztermOpts | nil.Tabs
	username: BarWeztermOpts | nil.Module
	workspace: BarWeztermOpts | nil.Module
	zoom: BarWeztermOpts | nil.Module
end

local record BarWeztermOpts.Padding.Tabs
	left: integer | nil
	right: integer | nil
end

local record BarWeztermOpts.Padding: BarWeztermOpts.Padding.Tabs
	tabs: BarWeztermOpts | nil.Padding.Tabs
end

local record BarWeztermOpts
	max_width: integer | nil
	modules: BarWeztermOpts | nil.Modules
	padding: BarWeztermOpts | nil.Padding
	position: BarWeztermOpts | nil.Position
	separator: BarWeztermOpts | nil.Separator
end

local record BarWezterm
	apply_to_config: function(c: Config, opts: BarWeztermOpts | nil) end
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
