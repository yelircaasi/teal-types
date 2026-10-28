
local record TabBarColor
	---The color of the background area for the tab.
	bg_color: string | nil
	---The color of the text for the tab.
	fg_color: string | nil
	---Specify whether you want `"Half"`, `"Normal"` or `"Bold"`
	---intensity for the label shown for this tab.
	---The default is `"Normal"`.
	intensity: FormatItemAttribute | nil.Intensity
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
	underline: TabBarColor | nil.Underline
end

local record TabBarColors
	---The text color to use when the attributes are reset to default.
	background: string | nil
	inactive_tab_edge: string | nil
	inactive_tab_edge_hover: string | nil

---Configure the color and styling for the tab bar.
local record TabBar: TabBarColors
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
	ansi: table | nil<integer, PaletteAnsi>
	---The background color to use when the attributes are
	---reset to default.
	background: string | nil
	---A list of 8 colors corresponding to the brights.
	brights: table | nil<integer, PaletteBrights>
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
	indexed: string | nil[]
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
