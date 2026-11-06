local _tmp = require("_tmp")

local record RosePineWindowFrame
	active_titlebar_bg: string
	inactive_titlebar_bg: string
end

local record RosePinePalette
	ansi: {integer: _enums.PaletteAnsi}
	background: string
	brights: {string: _enums.PaletteBrights}
	cursor_bg: string
	cursor_border: string
	cursor_fg: string
	foreground: string
	selection_bg: string
	selection_fg: string
	tab_bar: _tmp.TabBar
end

local record Variant
	colors:       function():_enums.Palette
	window_frame: function(): RosePineWindowFrame
end

local record RosePine
	dawn: Variant
	main: Variant
	moon: Variant
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
