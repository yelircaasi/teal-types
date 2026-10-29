---`Color` objects can be created by calling `wezterm.color.parse()` and may also be returned
---by various WezTerm functions and methods. They represent a color that is internally stored
---in `SRGBA` format.

-- local objects = require("objects.color")
local _shared = require("_shared")

local type NumberTriple = {number, number, number}
local type NumberQuadruple = {number, number, number, number}

local record ImageExtractorParams
	fuzziness: number | nil
	num_colors: number | nil
	max_width: number | nil
	max_height: number | nil
	min_brightness: number | nil
	max_brightness: number | nil
	threshold: number | nil
	min_contrast: number | nil
end


-- FROM  OBJECTS

local record TabBarColor
	---The color of the background area for the tab.
	bg_color: string | nil
	---The color of the text for the tab.
	fg_color: string | nil
	---Specify whether you want `"Half"`, `"Normal"` or `"Bold"`
	---intensity for the label shown for this tab.
	---The default is `"Normal"`.
	intensity: _shared.FormatItemAttribute | nil
	---Specify whether you want the text to be italic for this tab.
	---The default is `false`.
	italic: boolean | nil
	---Specify whether you want the text to be rendered with strikethrough
	---or not for this tab.
	---The default is `false`.
	strikethrough: boolean | nil
	---Specify whether you want `"None"`, `"Single"` or `"Double"`
	---underline for label shown for this tab.
	---The default is `"None"`.
	underline: TabBarColor | Underline | nil
end

local record TabBarColors
	---The text color to use when the attributes are reset to default.
	background: string | nil
	inactive_tab_edge: string | nil
	inactive_tab_edge_hover: string | nil
end

---Configure the color and styling for the tab bar.
local record TabBar --: TabBarColors
	---The text color to use when the attributes are reset to default.
	inactive_tab_edge: string | nil
	inactive_tab_edge_hover: string | nil

	---The active tab is the one that has focus in the window.
	active_tab: TabBarColor | nil
	---The color of the strip that goes along the top of the window
	---(does not apply when fancy tab bar is in use).
	background: string | nil
	---Inactive tabs are the tabs that do not have focus.
	inactive_tab: TabBarColor | nil
	---You can configure some alternate styling when
	---the mouse pointer moves over inactive tabs.
	inactive_tab_hover: TabBarColor | nil
	---The new tab button that let you create new tabs.
	new_tab: TabBarColor | nil
	---You can configure some alternate styling
	---when the mouse pointer moves over the new tab button.
	new_tab_hover: TabBarColor | nil
end

local record Palette
	---A list of 8 colors corresponding to the basic ANSI palette.
	ansi: {integer, PaletteAnsi} | nil
	---The background color to use when the attributes are
	---reset to default.
	background: string | nil
	---A list of 8 colors corresponding to the brights.
	brights: {integer: PaletteBrights} | nil
	---The color to use for the cursor when a dead key
	---or leader state is active.
	compose_cursor: string | nil
	---Colors for `copy_mode` and `quick_select`.
	---In `copy_mode`, the color of the active text is:
	--- 1. `copy_mode_active_highlight` if additional text was selected
	---                               using the mouse
	--- 2. `selection` otherwise
	copy_mode_active_highlight_bg: ColorSpec | nil
	---Use `AnsiColor` to specify one of the ANSI color palette values
	---(index 0-15), using one of the following values:
	--- - `"Black"`
	--- - `"Maroon"`
	--- - `"Green"`
	--- - `"Olive"`
	--- - `"Navy"`
	--- - `"Purple"`
	--- - `"Teal"`
	--- - `"Silver"`
	--- - `"Grey"`
	--- - `"Red"`
	--- - `"Lime"`
	--- - `"Yellow"`
	--- - `"Blue"`
	--- - `"Fuchsia"`
	--- - `"Aqua"`
	--- - `"White"`
	---For more information, see:
	--- - [`AnsiColor`](lua://AnsiColor)
	copy_mode_active_highlight_fg: ColorSpec | nil
	---Colors for `copy_mode` and `quick_select`.
	---In `copy_mode`, the color of the active text is:
	--- - `copy_mode_active_highlight` if additional text
	---   was selected using the mouse
	--- - `selection` otherwise
	copy_mode_inactive_highlight_bg: ColorSpec | nil
	---Use `AnsiColor` to specify one of the ANSI color palette values
	---(index 0-15), using one of the following values:
	--- - `"Black"`
	--- - `"Maroon"`
	--- - `"Green"`
	--- - `"Olive"`
	--- - `"Navy"`
	--- - `"Purple"`
	--- - `"Teal"`
	--- - `"Silver"`
	--- - `"Grey"`
	--- - `"Red"`
	--- - `"Lime"`
	--- - `"Yellow"`
	--- - `"Blue"`
	--- - `"Fuchsia"`
	--- - `"Aqua"`
	--- - `"White"`
	---For more information, see:
	--- - [`AnsiColor`](lua://AnsiColor)
	copy_mode_inactive_highlight_fg: ColorSpec | nil
	---The background color of the cursor.
	cursor_bg: string | nil
	---The border of the cursor.
	cursor_border: string | nil
	---The foreground color of the cursor.
	cursor_fg: string | nil
	---The text color to use when the attributes are
	---reset to default.
	foreground: string | nil
	---A map for setting arbitrary colors ranging from `16`
	---to `256` in the color palette.
	indexed: string | {nil}
	input_selector_label_bg: ColorSpec | nil
	input_selector_label_fg: ColorSpec | nil
	launcher_label_bg: ColorSpec | nil
	launcher_label_fg: ColorSpec | nil
	quick_select_label_bg: ColorSpec | nil
	quick_select_label_fg: ColorSpec | nil
	quick_select_match_bg: ColorSpec | nil
	quick_select_match_fg: ColorSpec | nil
	---The color of the "thumb" of the scrollbar;
	---the segment that represents the current viewable area.
	scrollbar_thumb: string | nil
	---The background color of selected text.
	selection_bg: string | nil
	---The foreground color of selected text.
	selection_fg: string | nil
	---The color of the split line between panes.
	split: string | nil
	tab_bar: TabBar | nil
	---The color of the visual bell.
	---If unspecified, the foreground color is used instead.
	visual_bell: string | nil
end

local record Color

	---Adjust the hue angle by the specified number of degrees.
	---180 degrees gives the complementary color. Three colors separated by 120 degrees form the triad.
	---Four colors separated by 90 degrees form the square.
	adjust_hue_fixed: function(self: Color, degrees: number): Color

	---Adjust the hue angle by the specified number of degrees.
	---This method uses the `RYB` color model, which more closely matches how artists think of mixing
	---colors and which is sometimes referred to as the _"artist's color wheel"_.
	---180 degrees gives the complementary color. Three colors separated by 120 degrees form the triad.
	---Four colors separated by 90 degrees form the square.
	adjust_hue_fixed_ryb: function(self: Color, degrees: number): Color

	---Returns the complement of the color.
	---The complement is computed by converting to `HSL`, rotating by 180 degrees and converting back
	---to `RGBA`.
	complement: function(self: Color): Color

	---Returns the complement of the color using the `RYB` color model, which more closely matches
	---how artists think of mixing colors.
	---The complement is computed by converting to `HSL`, converting the hue angle to the
	---equivalent `RYB` angle, rotating by 180 degrees and and then converting back to `RGBA`.
	complement_ryb: function(self: Color): Color

	---Computes the contrast ratio between the two colors.
	---The contrast ratio is computed by first converting to `HSL`, taking the `L` components,
	---and dividing the lighter one by the darker one.
	---A contrast ratio of `1` means _no contrast_.
	---Note: The maximum possible contrast ratio is `21`.
	contrast_ratio: function(self: Color, other: Color): number

	---Scales the color towards the minimum lightness by the provided factor, which should be
	---in the range `0.0` through `1.0`.
	darken: function(self: Color, amount: number): Color

	---Decrease the lightness by `amount`, a value ranging from `0.0` to `1.0`.
	darken_fixed: function(self: Color, amount: number): Color

	---Computes the `CIEDE2000` `DeltaE` value representing the difference between the two colors.
	delta_e: function(self: Color, other: Color): number

	---Scales the color towards the minimum saturation by the provided factor, which should be
	---in the range `0.0` through `1.0`.
	desaturate: function(self: Color, amount: number): Color

	---Decrease the saturation by `amount`, a value ranging from `0.0` to `1.0`.
	desaturate_fixed: function(self: Color, amount: number): Color

	---Converts the color to the `HSL` colorspace and returns those values + `alpha`.
	hsla: function(self: Color): NumberQuadruple

	---Converts the color to the `LAB` colorspace and returns those values + `alpha`.
	laba: function(self: Color): NumberQuadruple

	---Scales the color towards the maximum lightness by the provided factor, which should be
	---in the range `0.0` through `1.0`.
	lighten: function(self: Color, amount: number): Color

	---Increase the lightness by `amount`, a value ranging from `0.0` to `1.0`.
	lighten_fixed: function(self: Color, amount: number): Color

	---Returns a tuple of the colors converted to linear `RGBA` and expressed as floating point numbers
	---in the range of `0.0` and `1.0`.
	linear_rgba: function(self: Color): NumberQuadruple

	---Scales the color towards the maximum saturation by the provided factor, which should be
	---in the range `0.0` through `1.0`.
	saturate: function(self: Color, amount: number): Color

	---Increase the saturation by amount, a value ranging from `0.0` to `1.0`.
	saturate_fixed: function(self: Color, amount: number): Color

	---Returns the other three colors that form a square. The other colors are `90` degrees apart
	---on the `HSL` color wheel.
	square: function(self: Color): {Color, Color, Color}

	---Returns a tuple of the internal `SRGBA` colors expressed as unsigned 8-bit integers
	---in the range of `0` and `255`.
	srgb_u8: function(self: Color): {integer, integer, integer, integer}

	---Returns the other two colors that form a triad.
	---The other colors are at +/- 120 degrees in the `HSL` color wheel.
	triad: function(self: Color): {Color, Color}
end


-- vim: set ts=2 sts=2 sw=2 et ai si sta:
