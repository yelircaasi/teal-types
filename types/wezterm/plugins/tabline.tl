---@diagnostic disable:unused-local

local type HourStrings =
	"00"
	| "01"
	| "02"
	| "03"
	| "04"
	| "05"
	| "06"
	| "07"
	| "08"
	| "09"
	| "10"
	| "11"
	| "12"
	| "13"
	| "14"
	| "15"
	| "16"
	| "17"
	| "18"
	| "19"
	| "20"
	| "21"
	| "22"
	| "23"

local type TablineWezWinComponent =
	"battery"
	| "cpu"
	| "datetime"
	| "domain"
	| "hostname"
	| "mode"
	| "ram"
	| "window"
	| "workspace"

local type TablineWezTabComponent =
	"cwd"
	| "index"
	| "output"
	| "parent"
	| "process"
	| "tab"
	| "zoomed"

local type TablineWezSectionPadding integer|{ left?: integer, right?: integer }
local type TablineWezSeparators =
	{ left?: string, right?: string }
local type TablineWezSectionOverrides =
	{ fg?: string, bg?: string }
local type TablineWezExtension =
	"presentation"|"quick_domains"|"resurrect"|"smart_workspace_switcher"

local record TablineWezComponentSpec
	---@field [1] string
	cond: nil | nil|fun(): boolean
	fmt: fun | nil(str: string, win: Window|TabInformation): string
	icon: nil | nil|string|{ [1]: string, align?: 'left'|'right', color?: { fg?: string } }
	icons_enabled: boolean | nil
	icons_only: boolean | nil
	padding: TablineWezSectionPadding | nil
end

local record BatteryToIcon
	empty: string | nil
	full: string | nil
	half: string | nil
	quarter: string | nil
	three_quarters: string | nil
end

local record DomainToIcon
	default: string | nil
	docker: string | nil
	ssh: string | nil
	unix: string | nil
	wsl: string | nil
end

local record TablineWezBatteryComponent: TablineWezComponentSpec
	---@field [1] 'battery'
	battery_to_icon: BatteryToIcon | nil
end

local record TablineWezCPUComponent: TablineWezComponentSpec
	---@field [1] 'cpu'
	---How often in seconds the component updates, set to 0 to disable throttling
	throttle: integer | nil
	---If you want use `powershell`, set to `true`.
	---Default is `false`.
	use_pwsh: boolean | nil
end

local record TablineWezCWDComponent: TablineWezComponentSpec
	---@field [1] 'cwd'
	max_length: integer | nil
end

local record TablineWezDatetimeComponent: TablineWezComponentSpec
	---@field [1] 'datetime'
	hour_to_icon: nil | nil|table<HourStrings, string>
	style: string | nil
end

local record TablineWezDomainComponent: TablineWezComponentSpec
	---@field [1] 'domain'
	domain_to_icon: DomainToIcon | nil
end

local record TablineWezHostnameComponent: TablineWezComponentSpec
---@field [1] 'hostname'

local record TablineWezIndexComponent: TablineWezComponentSpec
	---@field [1] 'index'
	zero_indexed: boolean | nil
end

local record TablineWezModeComponent: TablineWezComponentSpec
---@field [1] 'mode'

local record TablineWezOutputComponent: TablineWezComponentSpec
	---@field [1] 'output'
	icon_no_output: string | nil
end

local record TablineWezParentComponent: TablineWezCWDComponent
---@field [1] 'parent'

local record TablineWezProcessComponent: TablineWezComponentSpec
	---@field [1] 'process'
	process_to_icon: string | nil|table<string, { [1]: string, color?: { fg?: string } }>
end

local record TablineWezRAMComponent: TablineWezCPUComponent
---@field [1] 'ram'

local record TablineWezWindowComponent: TablineWezComponentSpec
---@field [1] 'window'

local record TablineWezWorkspaceComponent: TablineWezComponentSpec
---@field [1] 'workspace'

local record TablineWezZoomedComponent: TablineWezComponentSpec
---@field [1] 'zoomed'

local type TablineWezWinComponents =
	TablineWezBatteryComponent
	|TablineWezCPUComponent
	|TablineWezDatetimeComponent
	|TablineWezDomainComponent
	|TablineWezHostnameComponent
	|TablineWezModeComponent
	|TablineWezRAMComponent
	|TablineWezWindowComponent
	|TablineWezWorkspaceComponent
end

local type TablineWezTabComponents =
	TablineWezCWDComponent
	|TablineWezIndexComponent
	|TablineWezOutputComponent
	|TablineWezParentComponent
	|TablineWezProcessComponent
	|TablineWezZoomedComponent
end

local type TablineWezWin (string|TablineWezWinComponent|TablineWezWinComponents)
local type TablineWezTab (string|TablineWezTabComponent|TablineWezTabComponents)

local record TablineWezOpts.Sections
---@field tab_active?   (TablineWezTab|FormatItemSpec|fun(): string)[]
---@field tab_inactive? (TablineWezTab|FormatItemSpec|fun(): string)[]
---@field tabline_a?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_b?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_c?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_x?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_y?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_z?    (TablineWezWin|FormatItemSpec|fun(): string)[]

local record TablineWezExtensionSpec.Events
	callback: fun | nil(window: Window)
	delay: integer | nil
	hide: string | nil[]|string
	show: string | nil[]|string
end

local record TablineWezExtensionSpec
	---@field [1] string
	colors: TablineWezThemeColors | nil
	events: TablineWezExtensionSpec.Events
	sections: TablineWezOpts | nil.Sections
end

local record TablineWezOpts.Options
	component_separators: TablineWezSeparators | nil|''
	fmt: fun | nil(str: string, win: Window|TabInformation): string
	icons_enabled: boolean | nil
	section_separators: TablineWezSeparators | nil|''
	tab_separators: TablineWezSeparators | nil|''
	tabs_enabled: boolean | nil
	theme: string | nil|Colorschemes|Palette
	theme_overrides: TablineWezThemeOverrides | nil
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
	active: TablineWezSectionOverrides | nil
	inactive: TablineWezSectionOverrides | nil
	inactive_hover: TablineWezSectionOverrides | nil
end

local record TablineWezThemeOverrides
	colors: Palette | nil
	copy_mode: TablineWezThemeColors | nil
	normal_mode: TablineWezThemeColors | nil
	search_mode: TablineWezThemeColors | nil
	tab: TablineWezTabOverrides | nil
	window_mode: TablineWezThemeColors | nil
end

local record TablineWezOpts
	---@field extensions? (TablineWezExtension|TablineWezExtensionSpec)[]
	options: TablineWezOpts | nil.Options
	sections: TablineWezOpts | nil.Sections
end

local record TablineWez
local M = {}

function M.apply_to_config(config: Config) end


function M.get_config(): TablineWezOpts


function M.get_theme(): TablineWezThemeOverrides

---@param theme string|Colorschemes|Palette
---@param overrides? TablineWezThemeOverrides
function M.set_theme(theme, overrides) end

---@param opts? TablineWezOpts
function M.setup(opts) end

function M.window(window: Window The `Window` object., tab: TabInformation) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
