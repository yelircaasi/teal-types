---@diagnostic disable:unused-local

local type ZoomIndicatorType =
	"icon"|"number"

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
	zoom_indicator: WeztermTabs | nil.ZoomIndicatorConfig
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
	separators: WeztermTabs | nil.SeparatorConfig
	---Tab-specific UI configuration.
	tab: WeztermTabs | nil.TabUIConfig
end

local record WeztermTabsOpts
	---Configuration for tab bar behavior.
	tabs: WeztermTabs | nil.TabConfig
	---Configuration for visual elements.
	ui: WeztermTabs | nil.UIConfig
end

local record WeztermTabs
local M = {}

---Applies configuration to WezTerm.
---@param wezterm_config Config The WezTerm configuration table to modify.
---@param opts? WeztermTabsOpts Optional configuration overrides.
function M.apply_to_config(wezterm_config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
