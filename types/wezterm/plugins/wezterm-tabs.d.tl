local _tmp = require("_tmp")

local enum ZoomIndicatorType
	"icon"
	"number"
end

local record TabConfig --WeztermTabs.TabConfig
	hide_tab_bar_if_only_one_tab: boolean | nil   ---Whether to hide the tab bar when only one tab exists.
	tab_bar_at_bottom: boolean | nil   ---Whether to place the tab bar at the bottom of the window.
	tab_max_width: integer | nil   ---Maximum width of a tab in characters.
	unzoom_on_switch_pane: boolean | nil   ---Whether to unzoom when switching between panes.
end

local record ZoomIndicatorConfig --WeztermTabs.ZoomIndicatorConfig
	enabled: boolean | nil   ---Whether to show zoom indicators.
	type: ZoomIndicatorType | nil   ---Type of zoom indicator to display.
end

local record TabUIConfig --WeztermTabs.TabUIConfig
	zoom_indicator: WeztermTabs |ZoomIndicatorConfig | nil   ---Configuration for the zoom indicator.
end

local record SeparatorConfig --WeztermTabs.SeparatorConfig
	arrow_solid_left: string | nil   ---Unicode character for solid left arrow.
	arrow_solid_right: string | nil   ---Unicode character for solid right arrow.
	arrow_thin_left: string | nil   ---Unicode character for thin left arrow.
	arrow_thin_right: string | nil   ---Unicode character for thin right arrow.
end

local record UIConfig --WeztermTabs.UIConfig
	icons: {string, string} | nil   ---Process-specific icons for tabs.
	separators: WeztermTabs |SeparatorConfig | nil   ---Visual separators used in the tab bar.
	tab: WeztermTabs |TabUIConfig | nil   ---Tab-specific UI configuration.
end

local record WeztermTabsOpts
	tabs: WeztermTabs |TabConfig | nil   ---Configuration for tab bar behavior.
	ui: WeztermTabs |UIConfig | nil   ---Configuration for visual elements.
end

local record WeztermTabs
	apply_to_config: function(wezterm_config: _tmp.Config, opts: WeztermTabsOpts|nil): nil   ---Applies configuration to WezTerm.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
