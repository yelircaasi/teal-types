local _tmp = require("_tmp")

local type WindowOrTabInformation = {string: any} --TODO: should be:_records.Window|TabInformation

local enum HourStrings
	"00"
	"01"
	"02"
	"03"
	"04"
	"05"
	"06"
	"07"
	"08"
	"09"
	"10"
	"11"
	"12"
	"13"
	"14"
	"15"
	"16"
	"17"
	"18"
	"19"
	"20"
	"21"
	"22"
	"23"
end

local enum TablineWezWinComponent
	"battery"
	"cpu"
	"datetime"
	"domain"
	"hostname"
	"mode"
	"ram"
	"window"
	"workspace"
end

local enum TablineWezTabComponent
	"cwd"
	"index"
	"output"
	"parent"
	"process"
	"tab"
	"zoomed"
end

local record _Padding
	left: integer|nil
	right: integer|nil
end

local record TablineWezSeparators 
	left: string|nil
	right: string|nil
end

local record TablineWezSectionOverrides
	fg: string|nil
	bg: string|nil
end

local type TablineWezSectionPadding = integer|_Padding
local type TablineWezSeparators = TablineWezSeparators
local type TablineWezSectionOverrides = TablineWezSectionOverrides

local enum TablineWezExtension
	"presentation"
	"quick_domains"
	"resurrect"
	"smart_workspace_switcher"
end

local enum _LeftRight
	"left"
	"right"
end

local type _ComplexTable = { integer|string: string|table|nil } --TODO: should be { [1]: string, align: LeftRight|nil, color: { fg: string|nil }|nil }

local interface TablineWezComponentSpec
	is {string}
	cond:          nil | function(): boolean
	fmt:           nil | function(str: string, win: {string: any}): string -- TODO: should be:_records.Window|_tmp.TabInformation
	icon:          string|_ComplexTable|nil
	icons_enabled: boolean | nil
	icons_only:    boolean | nil
	padding:       TablineWezSectionPadding | nil
end

-- local enum IconAlign
--    "left"
--    "right"
-- end

-- local record IconColor
--    fg: string
-- end

-- local record TablineWezComponentSpec
-- 	is {string}      -- array part: [1]
-- 	cond: function(): boolean
-- 	fmt: function(str: string, win: WindowOrTabInformation): string
-- 	icon: string | IconSpec
-- 	icons_enabled: boolean | nil
-- 	icons_only:    boolean | nil
-- 	padding:       TablineWezSectionPadding | nil
-- end


-- local record IconSpec
--    is {string}      -- array part: [1] is the icon string
--    align: IconAlign
--    color: IconColor
-- end

local record BatteryToIcon
	empty:          string | nil
	full:           string | nil
	half:           string | nil
	quarter:        string | nil
	three_quarters: string | nil
end

local record DomainToIcon
	default: string | nil
	docker:  string | nil
	ssh:     string | nil
	unix:    string | nil
	wsl:     string | nil
end

local record TablineWezBatteryComponent is TablineWezComponentSpec where self[1] == "battery"
	battery_to_icon: BatteryToIcon | nil
end

local interface TablineWezCPUComponent is TablineWezComponentSpec where self[1] == "cpu"
	throttle: integer | nil   ---How often in seconds the component updates, set to 0 to disable throttling
	use_pwsh: boolean | nil   ---If you want use `powershell`, set to `true`. Default is `false`.
end

local interface TablineWezCWDComponent is TablineWezComponentSpec where self[1] == "cwd"
	max_length: integer | nil
end

local record TablineWezDatetimeComponent is TablineWezComponentSpec where self[1] == "datetime"
	hour_to_icon: {HourStrings: string} | nil
	style:        string                | nil
end

local record TablineWezDomainComponent is TablineWezComponentSpec where self[1] == "domain"
	domain_to_icon: DomainToIcon | nil
end

local record TablineWezHostnameComponent is TablineWezComponentSpec where self[1] == "hostname"
end

local record TablineWezIndexComponent is TablineWezComponentSpec where self[1] == "index"
	zero_indexed: boolean | nil
end

local record TablineWezModeComponent is TablineWezComponentSpec where self[1] == "mode"
end

local record TablineWezOutputComponent is TablineWezComponentSpec where self[1] == "output"
	icon_no_output: string | nil
end

local record TablineWezParentComponent is TablineWezCWDComponent where self[1] == "parent"
end

local record _HasFg
	fg: string|nil
end

local record _AdHoc
	is {string}
	color: _HasFg
end

local record TablineWezProcessComponent is TablineWezComponentSpec where self[1] == "process"
	process_to_icon: string | _AdHoc | nil
end

local record TablineWezRAMComponent is TablineWezCPUComponent where self[1] == "ram"
end

local record TablineWezWindowComponent is TablineWezComponentSpec where self[1] == "window"
end

local record TablineWezWorkspaceComponent is TablineWezComponentSpec where self[1] == "workspace"
end

local record TablineWezZoomedComponent is TablineWezComponentSpec where self[1] == "zoomed"
end

local type TablineWezWinComponents = TablineWezBatteryComponent|TablineWezCPUComponent|TablineWezDatetimeComponent|TablineWezDomainComponent|TablineWezHostnameComponent|TablineWezModeComponent|TablineWezRAMComponent|TablineWezWindowComponent|TablineWezWorkspaceComponent

local type TablineWezTabComponents = TablineWezCWDComponent|TablineWezIndexComponent|TablineWezOutputComponent|TablineWezParentComponent|TablineWezProcessComponent|TablineWezZoomedComponent

local type TablineWezWin = TablineWezWinComponent|TablineWezWinComponents
local type TablineWezTab = TablineWezTabComponent|TablineWezTabComponents

local record Sections --TablineWezOpts.Sections
	tab_active:   {TablineWezTab|_records.FormatItemSpec|function(): string} | nil
	tab_inactive: {TablineWezTab|_records.FormatItemSpec|function(): string} | nil
	tabline_a:    {TablineWezWin|_records.FormatItemSpec|function(): string} | nil
	tabline_b:    {TablineWezWin|_records.FormatItemSpec|function(): string} | nil
	tabline_c:    {TablineWezWin|_records.FormatItemSpec|function(): string} | nil
	tabline_x:    {TablineWezWin|_records.FormatItemSpec|function(): string} | nil
	tabline_y:    {TablineWezWin|_records.FormatItemSpec|function(): string} | nil
	tabline_z:    {TablineWezWin|_records.FormatItemSpec|function(): string} | nil
end

local record Events --TablineWezExtensionSpec.Events
	callback: function(window:_records.Window): nil
	delay:    integer  | nil
	hide:     {string} | nil
	show:     {string} | nil
end

local record TablineWezExtensionSpec
	is {string}
	colors:   TablineWezThemeColors | nil
	events:   Events
	sections: TablineWezOpts | Sections | nil
end

local enum _EmptyString
	""
end

local record Options --TablineWezOpts.Options
	component_separators: TablineWezSeparators     | _EmptyString | nil
	fmt:                  nil                      | function(str: string, win: WindowOrTabInformation): string
	icons_enabled:        boolean                  | nil
	section_separators:   TablineWezSeparators     | _EmptyString | nil
	tab_separators:       TablineWezSeparators     | _EmptyString | nil
	tabs_enabled:         boolean                  | nil
	theme:                string                   |_enums.Palette | nil
	theme_overrides:      TablineWezThemeOverrides | nil
end

local record TablineWezThemeColors
	a: TablineWezSectionOverrides | nil
	b: TablineWezSectionOverrides | nil
	c: TablineWezSectionOverrides | nil
	x: TablineWezSectionOverrides | nil
	y: TablineWezSectionOverrides | nil
	z: TablineWezSectionOverrides | nil
end

local record TablineWezTabOverrides
	active:         TablineWezSectionOverrides | nil
	inactive:       TablineWezSectionOverrides | nil
	inactive_hover: TablineWezSectionOverrides | nil
end

local record TablineWezThemeOverrides
	colors:     _enums.Palette                | nil
	copy_mode:   TablineWezThemeColors  | nil
	normal_mode: TablineWezThemeColors  | nil
	search_mode: TablineWezThemeColors  | nil
	tab:         TablineWezTabOverrides | nil
	window_mode: TablineWezThemeColors  | nil
end

local record TablineWezOpts
	extensions: {TablineWezExtension|TablineWezExtensionSpec} | nil
	options:    Options                                       | nil
	sections:   Sections                                      | nil
end

local record TablineWez

	apply_to_config: function(config: _tmp.Config): nil

	get_config:      function(): TablineWezOpts

	get_theme:       function(): TablineWezThemeOverrides

	set_theme:       function(theme: string|_tmp.Palette, overrides: TablineWezThemeOverrides|nil): nil

	setup:           function(opts: TablineWezOpts|nil): nil

	window:          function(window:_records.Window, tab: _tmp.TabInformation): nil
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
