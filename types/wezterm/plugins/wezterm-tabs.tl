local enum ZoomIndicatorType
	"icon"
	"number"
end

local record WeztermTabs.TabConfig
	---Whether to hide the tab bar when only one tab exists.
	hide_tab_bar_if_only_one_tab: boolean | nil
	---Whether to place the tab bar at the bottom of the window.
	tab_bar_at_bottom: boolean | nil
	---Maximum width of a tab in characters.
	tab_max_width: integer | nil
	---Whether to unzoom when switching between panes.
	unzoom_on_switch_pane: boolean | nil
end

local record WeztermTabs.ZoomIndicatorConfig
	---Whether to show zoom indicators.
	enabled: boolean | nil
	---Type of zoom indicator to display.
	type: ZoomIndicatorType | nil
end

local record WeztermTabs.TabUIConfig
	---Configuration for the zoom indicator.
	zoom_indicator: WeztermTabs |ZoomIndicatorConfig | nil
end

local record WeztermTabs.SeparatorConfig
	---Unicode character for solid left arrow.
	arrow_solid_left: string | nil
	---Unicode character for solid right arrow.
	arrow_solid_right: string | nil
	---Unicode character for thin left arrow.
	arrow_thin_left: string | nil
	---Unicode character for thin right arrow.
	arrow_thin_right: string | nil
end

local record WeztermTabs.UIConfig
	---Process-specific icons for tabs.
	icons: table | nil<string, string>
	---Visual separators used in the tab bar.
	separators: WeztermTabs |SeparatorConfig | nil
	---Tab-specific UI configuration.
	tab: WeztermTabs |TabUIConfig | nil
end

local record WeztermTabsOpts
	---Configuration for tab bar behavior.
	tabs: WeztermTabs |TabConfig | nil
	---Configuration for visual elements.
	ui: WeztermTabs |UIConfig | nil
end

local record WeztermTabs
	---Applies configuration to WezTerm.
	apply_to_config: function(wezterm_config: Config, opts: WeztermTabsOpts|nil): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
