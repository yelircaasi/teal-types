---@diagnostic disable:unused-local

local record RosePineWindowFrame
	active_titlebar_bg: string
	inactive_titlebar_bg: string
end

local record RosePinePalette
	ansi: table<integer, PaletteAnsi>
	background: string
	brights: table<string, PaletteBrights>
	cursor_bg: string
	cursor_border: string
	cursor_fg: string
	foreground: string
	selection_bg: string
	selection_fg: string
	tab_bar: TabBar

local record RosePine.Variant
local V = {}


function V.colors(): Palette


function V.window_frame(): RosePineWindowFrame

local record RosePine
	dawn: RosePine.Variant
	main: RosePine.Variant
	moon: RosePine.Variant

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
