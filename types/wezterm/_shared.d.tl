-- local _enums = require("_enums")
local _tmp = require("_tmp")

-- FROM ACTIONS --


local type Action = string|number
-- CORRECT VALUE: Actions|KeyAssignmentLiterals|CharSelect|Multiple|PaneSelect|QuickSelectArgs|SpawnCommandInNewTab|SpawnCommandInNewWindow|SplitHorizontal|SplitVertical|SwitchToWorkspace


------------------

local record _Shared
	-- MOVED HERE =============================================================
	record SwitchToWorkspaceParams
		---The name of the workspace.
		---If omitted, a randomly generated name will be chosen.
		name: string | nil
		---A `SpawnCommand` describing the command that should be started in the workspace
		---if it doesn't already exist.
		---If omitted, the default program will be spawned in the newly created workspace.
		---For more information, see:
		--- - [`SpawnCommand`](lua://SpawnCommand)
		spawn: _tmp.SpawnCommand | nil
	end
	--=========================================================================
	
	record FormatItemAttribute
		Intensity: _tmp.Intensity | nil
		Italic: boolean | nil
		Underline: _tmp.Underline
	end

	record FormatItemSpec
		Attribute: FormatItemAttribute | nil
		Background: _tmp.ColorSpec | nil
		Foreground: _tmp.ColorSpec | nil
		Text: string | nil
	end

	record FontAttributesBase
		---To control whether a font is considered to have emoji (rather than text)
		---presentation glyphs for emoji.
		assume_emoji_presentation: boolean | nil
		family: string
		---you can combine the flags like `"NO_HINTING|MONOCHROME"`
		---**(you probably wouldn't want to do this)**.
		freetype_load_flags: _tmp.FreeTypeLoadFlags | nil
		freetype_load_target: _tmp.FreeTypeTarget | nil
		freetype_render_target: _tmp.FreeTypeTarget | nil
		---When `config.font_shaper` is
		---set to `"Harfbuzz"`, this setting affects
		---how font shaping takes place.
		---The _OpenType_ spec lists a number of features
		---[here](https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist).
		---For more information and examples, see:
		--- - [Font Shaping](https://wezterm.org/config/font-shaping.html)
		--- - [`config.font_shaper`](lua://Config.font_shaper)
		harfbuzz_features: {_tmp.HarfbuzzFeatures} | nil
		scale: number | nil
		stretch: _tmp.FontStretch | nil
		---This option will only be respected if the `italic` option is `nil`.
		style: _tmp.FontStyle | nil
		weight: _tmp.FontWeight | nil
	end

	---Argument type for `Wezterm.font()` and `Wezterm.font_with_fallback()`.
	record FontFamilyAttributes
		--: FontAttributesBase
		---Setting this option to `true` will overwrite the `style` option to `Italic`.
		---Otherwise it will overwrite the `style` option to `Normal`.
		italic: boolean | nil
	end

	---Corresponds to the internal `FontAttributes` struct that is used to
	---select a single named font.
	record FontAttributes --: FontAttributesBase
		is_fallback: boolean | nil
		is_synthetic: boolean | nil
	end

	record TextStyleAttributes
		bold: boolean | nil
		---If set, when rendering text that is set to the default
		---foreground color, use this color instead.  This is most
		---useful in a `Config.font_rules` section to implement changing
		---the text color for eg: bold text.
		---For more information and examples, see:
		--- - [Font Rules](ttps://wezterm.org/config/lua/config/font_rules.html)
		--- - [`config.font_rules`](lua://Config.font_rules)
		foreground: string | nil
		italic: boolean | nil
		stretch: _tmp.FontStretch | nil
		style: _tmp.FontStyle | nil
		weight: _tmp.FontWeight | nil
	end

	record TextStyle
		fonts: {FontAttributes}
		foreground: string | nil
	end

	record WindowFrameConfig
		active_titlebar_bg: string | nil
		active_titlebar_border_bottom: string | nil
		active_titlebar_fg: string | nil
		border_bottom_color: string | nil
		border_bottom_height: string | nil|integer
		border_left_color: string | nil
		border_left_width: string | nil|integer
		border_right_color: string | nil
		border_right_width: string | nil|integer
		border_top_color: string | nil
		border_top_height: string | nil|integer
		button_bg: string | nil
		button_fg: string | nil
		button_hover_bg: string | nil
		button_hover_fg: string | nil
		font: TextStyle | nil
		font_size: number | nil
		inactive_titlebar_bg: string | nil
		inactive_titlebar_border_bottom: string | nil
		inactive_titlebar_fg: string | nil
	end

	record TabBarStyle
		new_tab: string | nil
		new_tab_hover: string | nil
		window_close: string | nil
		window_close_hover: string | nil
		window_hide: string | nil
		window_hide_hover: string | nil
		window_maximize: string | nil
		window_maximize_hover: string | nil
	end

	record HyperlinkRule
		format: string
		highlight: integer | nil
		regex: string
	end

	record SerialDomain
		---Set the baud rate.
		---The default is `9600` baud.
		baud: integer
		---The name of this specific domain.
		---Must be unique amongst all types of domain
		---in the configuration file.
		name: string
		---Specifies the serial device name.
		--- - On Windows systems this can be a name like `COM0`
		--- - On POSIX systems this will be something like `/dev/ttyUSB0`
		--- - If omitted, the name will be interpreted as the port
		port: string
	end

	---Corresponds to [`wgpu::AdapterInfo`](https://docs.rs/wgpu/latest/wgpu/struct.AdapterInfo.html).
	record GpuInfo
		backend: _tmp.GpuInfo__Backend
		device: integer
		device_type: _tmp.GpuInfo__DeviceType
		driver: string | nil
		driver_info: string | nil
		name: string
		vendor: integer
	end

	record UnixDomain
		---If `true`, connect to this domain on startup.
		connect_automatically: boolean
		---Show time since last response when waiting for a response.
		---[Recommended Source](https://wezterm.org/config/lua/pane/get_metadata.html#since_last_response_ms).
		local_echo_threshold_ms: integer
		---The name of this specific domain.
		---Must be unique amongst all types of domain
		---in the configuration file.
		name: string
		---If `true`, do not attempt to start this server
		---if we try and fail to connect to it.
		no_serve_automatically: boolean
		overlay_lag_indicator: boolean
		---Instead of directly connecting to `socket_path`
		---spawn this command and use its stdin/stdout
		---in place of the socket.
		proxy_command: {string}
		read_timeout: integer
		---If we decide that we need to start the server, the command to run to set that up.
		---The default is to spawn:
		---```sh
		---wezterm-mux-server --daemonize
		---```
		---To start up a UNIX domain inside a WSL container:
		---```sh
		---wsl -e wezterm-mux-server --daemonize
		---```
		serve_command: {string}
		---If `true`, bypass checking for secure ownership of `socket_path`.
		---This is not recommended on a multi-user system, but is useful, for example,
		---when running the server inside a WSL container but with the socket on
		---the host NTFS volume.
		skip_permissions_check: boolean
		socket_path: string
		write_timeout: integer
	end

	record LeaderKey --: Key
		---Maximum time to wait for next key.
		---Default is `1000` ms.
		timeout_milliseconds: integer | nil
	end

	record HyperLinkRule
		---Controls which parts of the regex match will be used to form the link.
		---Must have a prefix: signaling the protocol type (e.g. `https:/mailto:`),
		---which can either come from the regex match or needs to be explicitly added.
		---The format string can use placeholders like `$0`, `$1`, `$2` etc., that will be replaced
		---with that numbered capture group. So, `$0` will take the entire region of text matched
		---by the whole regex, while `$1` matches out the first capture group.
		format: string
		---Specifies the range of the matched text that should be highlighted/underlined
		---when the mouse hovers over the link.
		---The value is a number that corresponds to a capture group in the regex.
		---The default is `0`, highlighting the entire region of text matched by the regex.
		---`1` would be the first capture group, and so on...
		highlight: number | nil
		---The regular expression to match.
		regex: string
	end

	record BatteryInfo
		---If known, shows the battery model string or `"unknown"` otherwise.
		model: string
		---If known, shows the battery serial number or `"unknown"` otherwise.
		serial: string
		state: _tmp.BatteryInfo__State
		---The battery level expressed as a number between `0.0` (empty) and `1.0` (full).
		state_of_charge: number
		---If discharing, how long until the battery is empty (in seconds).
		time_to_empty: integer | nil
		---If charging, how long until the battery is full (in seconds).
		time_to_full: integer | nil
		---If known, shows battery manufacturer name or `"unknown"` otherwise.
		vendor: string
	end

	record AugmentCommandPaletteReturn
		---The action to take when the item is activated.
		---Can be any key assignment action.
		---For more information, see:
		--- - [`Action`](lua://Action)
		action: Action
		---The brief description for the entry.
		brief: string
		---A long description that may be shown after the entry, or that may be used
		---in future versions of WezTerm to provide more information about the command.
		doc: string | nil
		---**(OPTIONAL)** Nerd Fonts glyph name to use for the icon for the entry.
		---For a list of icon names, see:
		--- - [`Wezterm.NerdFont`](lua://Wezterm.NerdFont)
		icon: _tmp.NerdFont | nil -- Wezterm | ...?
	end

	enum _Visibility
		"Visible"
		"Hidden"
	end

	---Mirrors `StableCursorPosition` in wezterm upstream:
	---https://github.com/wezterm/wezterm/blob/main/mux/src/renderable.rs
	record StableCursorPosition
		shape: _tmp.StableCursorPosition__Shape
		visibility: _Shared._Visibility
		---The horizontal cell index.
		x: integer
		---The vertical stable row index.
		y: integer
	end

	record LinearGradientOrientation
		angle: number
	end

	record RadialGradientOrientation
		cx: number | nil
		cy: number | nil
		radius: number | nil
	end

	record Gradient
		blend: _tmp.Blend | nil -- Gradient | ...?
		colors: {string}
		interpolation: _tmp.Interpolation | nil -- Gradient | ...?
		noise: number | nil
		orientation: _tmp.GradientOrientation | nil
		segment_size: number | nil
		segment_smoothness: number | nil
	end

	record ColorSchemeMetaData
		aliases: {string} | nil
		author: string | nil
		name: string | nil
		origin_url: string | nil
		wezterm_version: string | nil
	end

	record ScreenInformation
		height: number
		max_fps: number | nil
		name: string
		width: number
		x: number
		y: number
	end

	record GuiScreensInfo
		active: ScreenInformation
		byName: {string: ScreenInformation}
		main: ScreenInformation
		origin_x: number
		origin_y: number
		virtual_height: number
		virtual_width: number
	end

	record KeyBinding --: Key
		action: Action
		key: string
		mods: string | nil
	end

	enum _Button
		"Left"
		"Right"
		"Middle"
	end

	enum _WheelDirection
		"WheelUp"
		"WheelDown"
	end

	record MouseEventInfo
		button: _Button | { _WheelDirection: number }
		streak: number
	end

	enum _AltScreen
		"Any"
	end

	record MouseBindingBase
		action: Action
		alt_screen: _AltScreen | boolean | nil
		event: _tmp.MouseEvent
		mouse_reporting: boolean | nil
	end

	record MouseBinding --: MouseBindingBase
		mods: string
	end

	---The `wezterm` module is the primary module that exposes
	---WezTerm configuration and control to your config file.
	---You will typically place:
	---```lua
	---local wezterm = require("wezterm")
	---```
	---at the top of your configuration file to enable it.
	record Wezterm --: ExecDomain
	---`wezterm.GLOBAL` is a special `userdata` value that acts like a table.
	---Writing to keys will copy the data that you assign into a global in-memory table
	---and allow it to be read back later.
	---Provides global, in-process, in-memory, data storage for JSON-like variables
	---that persist across config reloads.
		---WezTerm's Lua files may be re-loaded and re-evaluated multiple times in
		---different contexts or in different threads.
		---If you'd like to keep track of state that lasts for the lifetime of your wezterm process,
		---then you cannot simply use global variables in the Lua script.
		---Reads and writes from/to `wezterm.GLOBAL` are thread-safe but can't currently provide
		---synchronization primitives for managing read-modify-write operations.
		---You may store values with the following types:
		--- -  `string`
		--- -  `number`
		--- -  `table`
		--- -  `boolean`
		---**Attempting to assign other types will raise an error.**
		GLOBAL: {string: string|number|table|boolean}
		---Helper for defining key assignment actions in your configuration file.
		---This is really just sugar for the underlying `Lua ==> Rust` deserialation mapping
		---that makes it a bit easier to identify where syntax errors may exist in your configuration.
		---For more information, see:
		--- - [`Action`](lua://Action)
		--- - [`KeyAssignment`](lua://KeyAssignment)
		action: _tmp.KeyAssignment
		---The `wezterm.color` module exposes functions that work with colors.
		---For more information, see:
		--- - [`Wezterm.Color`](lua://Wezterm.Color)
		color: _tmp.Wezterm__Color
		---This constant is set to the path to the directory in which your `wezterm.lua`
		---configuration file was found.
		config_dir: string
		---This constant is set to the path to the `wezterm.lua` that is in use.
		config_file: string
		---This constant is set to the directory containing the WezTerm executable file.
		executable_dir: string
		---The `wezterm.gui` module exposes functions that operate on the GUI layer.
		---The multiplexer may not be connected to a GUI, so attempting to resolve this module
		---from the mux server will return `nil`.
		---For more information, see:
		--- - [`Wezterm.Gui`](lua://Wezterm.Gui)
		gui: _tmp.Wezterm__Gui
		home_dir: string
		---For more information, see:
		--- - [`Wezterm.Mux`](lua://Wezterm.Mux)
		mux: _tmp.Wezterm__Mux
		---For more information, see:
		--- - [`Wezterm.NerdFont`](lua://Wezterm.NerdFont)
		nerdfonts: _tmp.Wezterm__NerdFont
		---The `wezterm.plugin` module provides functions to manage WezTerm plugins.
		---For more information, see:
		--- - [`Wezterm.Plugin`](lua://Wezterm.Plugin)
		plugin: _tmp.Wezterm__Plugin
		---The `wezterm.procinfo` module exposes functions that allow querying information about
		---processes that are running on the local system.
		---For more information, see:
		--- - [`Wezterm.ProcInfo`](lua://Wezterm.ProcInfo)
		procinfo: _tmp.Wezterm__ProcInfo
		---The `wezterm.serde` module provides functions for parsing the given string
		---as JSON, YAML, or TOML, returning the corresponding Lua values, and vice-versa.
		---For more information, see:
		--- - [`Wezterm.Serde`](lua://Wezterm.Serde)
		serde: _tmp.Wezterm__Serde
		---This constant is set to the Rust target triple for the platform on which
		---WezTerm was built.
		---This can be useful when you wish to conditionally adjust your configuration
		---based on the platform.
		target_triple: string
		---The `wezterm.time` module exposes functions that allow working with time.
		---For more information, see:
		--- - [`Wezterm.Time`](lua://Wezterm.Time)
		time: _tmp.Wezterm__Time
		---The `wezterm.url` module exposes functions that allow working with URLs.
		---For more information, see:
		--- - [`Wezterm.Url`](lua://Wezterm.Url)
		url: _tmp.Wezterm__Url
		---This constant is set to the WezTerm version string that is also reported
		---by running `wezterm -V`.
		---This can potentially be used to adjust configuration according to the installed version.
		version: string
	end
end



local record _Choice
	label: string
	id: string
end

local record InputSelectorParams
	---The title that will be set for the overlay pane.
	title: string
	---A table consisting of the potential choices.
	---Each entry is itself a table with a label field and an optional id field.
	---The label will be shown in the list, while the id can be a different string
	---that is meaningful to your action.
	---The label can be used together with `wezterm.format()` to produce styled text.
	choices: {_Choice}
	---An event callback registered via `wezterm.action_callback()`.
	---The callback's function signature is `(window, pane, id, label)`
	---where `window` and `pane` are the `Window` and `Pane` objects
	---from the current pane and window, and `id` and `label` hold
	---the corresponding fields from the selected choice.
	---Both will be `nil` if the overlay is cancelled without selecting anything.
	---```lua
	---wezterm.action.InputSelector({
	---  action = wezterm.action_callback(function(window, pane, id, label)
	---    --- ...
	---  end),
	---})
	---```
	action: { _tmp.EmitEvent: string }
	---A boolean that defaults to `false`.
	---If `true`, `InputSelector` will start in its fuzzy finding mode,
	---equivalent to starting the `InputSelector` and pressing `/` in the default mode.
	fuzzy: boolean | nil
	---A string of unique characters.
	alphabet: _tmp.QuickSelectAlphabet | nil|string
	---A string to display when in the default mode.
	description: string | nil
	---A string to display when in fuzzy finding mode.
	fuzzy_description: string | nil
end

local record CharSelectParams
	copy_on_select: boolean
	copy_to: _tmp.ClipboardCopyDestination
	group: _tmp.CharGroup | nil
end

local record SendKeyParams
---A single unicode character, like 'A' or 'a'. Pay attention to the case of the text that you use
---and the state of the SHIFT modifier, as this matters whether 'A' or 'a' is matched.
---Alternatively you can use on the following keycode identifiers, although note that not all of
---these are meaningful on all platforms:
--- - `Add`
--- - `Alt`
--- - `ApplicationDownArrow`
--- - `ApplicationLeftArrow`
--- - `ApplicationRightArrow`
--- - `ApplicationUpArrow`
--- - `Applications`
--- - `Backspace`
--- - `BrowserBack`
--- - `BrowserFavorites`
--- - `BrowserForward`
--- - `BrowserHome`
--- - `BrowserRefresh`
--- - `BrowserSearch`
--- - `BrowserStop`
--- - `Cancel`
--- - `CapsLock`
--- - `Clear`
--- - `Control`
--- - `Decimal`
--- - `Delete`
--- - `Divide`
--- - `DownArrow`
--- - `End`
--- - `Enter`
--- - `Escape`
--- - `Execute`
--- - `F1`
--- - `F2`
--- - `F3`
--- - `F4`
--- - `F5`
--- - `F6`
--- - `F7`
--- - `F8`
--- - `F9`
--- - `F10`
--- - `F11`
--- - `F12`
--- - `F13`
--- - `F14`
--- - `F15`
--- - `F16`
--- - `F17`
--- - `F18`
--- - `F19`
--- - `F20`
--- - `F21`
--- - `F22`
--- - `F23`
--- - `F24`
--- - `Help`
--- - `Home`
--- - `Hyper`
--- - `Insert`
--- - `LeftAlt`
--- - `LeftArrow`
--- - `LeftControl`
--- - `LeftMenu`
--- - `LeftShift`
--- - `LeftWindows`
--- - `MediaNextTrack`
--- - `MediaPlayPause`
--- - `MediaPrevTrack`
--- - `MediaStop`
--- - `Menu`
--- - `Meta`
--- - `Multiply`
--- - `NumLock`
--- - `Numpad0`
--- - `Numpad1`
--- - `Numpad2`
--- - `Numpad3`
--- - `Numpad4`
--- - `Numpad5`
--- - `Numpad6`
--- - `Numpad7`
--- - `Numpad8`
--- - `Numpad9`
--- - `PageDown`
--- - `PageUp`
--- - `Pause`
--- - `Print`
--- - `PrintScreen`
--- - `RightAlt`
--- - `RightArrow`
--- - `RightControl`
--- - `RightMenu`
--- - `RightShift`
--- - `RightWindows`
--- - `ScrollLock`
--- - `Select`
--- - `Separator`
--- - `Shift`
--- - `Sleep`
--- - `Subtract`
--- - `Super`
--- - `Tab`
--- - `UpArrow`
--- - `VoidSymbol`
--- - `VolumeDown`
--- - `VolumeMute`
--- - `VolumeUp`
---The key value can refer either to the physical position of a key on an ANSI US keyboard or to the
---post-keyboard-layout-mapped value produced by a key press.
---You can explicitly assign using the physical position by adding a phys: prefix to the value, for
---example: `key="phys:A"`. This will match key presses for the key that would be in the position of
---the A key on an ANSI US keyboard.
---You can explicitly assign the mapped key by adding a mapped:
---prefix to the value, for example: key="mapped:a" will match a
---key press where the OS keyboard layout produces a, regardless of
---its physical position.
---If you omit an explicit prefix, wezterm will assume phys: and use the physical position of the
---specified key.
---The default key assignments listed above use `phys:`. In previous releases there was no physical
---position support and those assignments were all `mapped:`.
---When upgrading from earlier releases, if you had `{key="N", mods="CMD", ..}` in your config, you
---will need to change it to either `{key="N", mods="CMD|SHIFT", ..}` or `{ key="mapped:N",
---mods="CMD", ..}` in order to continue to respect the SHIFT modifier.
---The `key_map_preference` option controls how keys without an explicit `phys:` or `mapped:` prefix
---are treated. If `key_map_preference = "Mapped"` (the default), then `mapped:` is assumed. If
	---`key_map_preference = "Physical"` then `phys:` is assumed.
	---The default key assignments will respect `key_map_preference`.
	---In some cases, wezterm may not know how to represent a key event in either its phys: or mapped:
	---forms. In that case, you may wish to define an assignment in terms of the underlying operating
	---system key code, using a `raw: prefix`.
	---Similar in concept to the `phys:` mapping described above, the `raw:` mapping is independent of
	---the OS keyboard layout. Raw codes are hardware and windowing system dependent, so there is no
	---portable way to list which key does what.
	---To discover these values, you can set `debug_key_events = true` and press the keys of interest.
	---You can specify a raw key value of 123 by using `key="raw:123"` in your config rather than one of
	---the other key values.
	key: string
---Possible Modifier labels are:
--- - `SUPER`, `CMD`, `WIN`: These are all equivalent: on macOS the `Command` key,
---                  on Windows the `WIN`,
---                  on Linux this can also be the `Super` or `Hyper` key.
	---                  Left and right are equivalent
	--- - `CTRL`: The control key.
	---         Left and right are equivalent
	--- - `SHIFT`: The shift key.
	---          Left and right are equivalent
	--- - `ALT`, `OPT`, `META`: These are all equivalent.
	---                  on macOS the Option key, on
	---                  other systems the Alt or Meta key.
	---                  Left and right are equivalent
	--- - `LEADER`: A special modal modifier state managed by WezTerm
	--- - `VoidSymbol`: This keycode is emitted in special cases where
	---               the original function of the key has been removed.
	---               Such as in Linux and using `setxkbmap -option caps:none`.
	---The `CapsLock` will no longer function as before in all applications,
	---instead emitting `VoidSymbol`.
	---You can also combine modifiers using the `|` symbol, like `"CMD|CTRL"`.
	mods: string | nil
end

local record Key --: SendKeyParams
	action: Action | nil
end

-- HELPERS ====================================================================
local record _ActivateKeyTable
	ActivateKeyTable: _tmp.ActivateKeyTableParams
end

local record _ActivatePaneByIndex
	ActivatePaneByIndex: integer
end

local record _ActivatePaneDirection
	ActivatePaneDirection: _tmp.PaneDirection
end

local record _ActivateTab
	ActivateTab: integer
end

local record _ActivateTabRelative
	ActivateTabRelative: integer
end

local record _ActivateTabRelativeNoWrap
	ActivateTabRelativeNoWrap: integer
end

local record _ActivateWindow
	ActivateWindow: integer
end

local record _ActivateWindowRelative
	ActivateWindowRelative: integer
end

local record _ActivateWindowRelativeNoWrap
	ActivateWindowRelativeNoWrap: integer
end

local type _AdjustPaneSizeValue = {_tmp.PaneDirection, integer} --TODO: does this work?

local record _AdjustPaneSize
	AdjustPaneSize: _AdjustPaneSizeValue
end

local record _AttachDomain
	AttachDomain: string
end

local record _CharSelect
	CharSelect: _tmp.CharSelectParams
end

local record _ClearScrollback
	ClearScrollback: _tmp.ScrollbackEraseMode
end

local record _Confirm
	confirm: boolean
end

local record _CloseCurrentPane
	CloseCurrentPane: _Confirm 
end

local record _CloseCurrentTab
	CloseCurrentTab: _Confirm
end

local record _CompleteSelection
	CompleteSelection: _tmp.ClipboardCopyDestination
end

local record _CompleteSelectionOrOpenLinkAtMouseCursor
	CompleteSelectionOrOpenLinkAtMouseCursor: _tmp.ClipboardCopyDestination
end

local record _Confirmation
	Confirmation: _tmp.ConfirmationParams
end

local record _CopyMode
	CopyMode: _tmp.CopyModeParams
end

local record _CopyTo
	CopyTo: _tmp.ClipboardCopyDestination
end

local record _CopyTextTo
	CopyTextTo: _tmp.CopyTextToParams
end

local record _DetachDomain
	DetachDomain: _tmp.SpawnTabDomain
end

local record _EmitEvent
	EmitEvent: string
end

local record _ExtendSelectionToMouseCursor
	ExtendSelectionToMouseCursor: _tmp.SelectionMode
end

local record _InputSelector
	InputSelector: _tmp.InputSelectorParams
end

local record _MoveTab
	MoveTab: integer
end

local record _MoveTabRelative
	MoveTabRelative: integer
end

local record _Multiple
	Multiple: {_tmp.Action}
end

local record _OpenUri
	OpenUri: string
end

local record _PaneSelect
	PaneSelect: _tmp.PaneSelectParams
end

local record _PasteFrom
	PasteFrom: _tmp.ClipboardPasteDestination
end

local record _PromptInputLine
	PromptInputLine: _tmp.PromptInputLineParams
end

local record _QuickSelectArgs
	QuickSelectArgs: _tmp.QuickSelectArgsParams
end

local record _RotatePanes
	RotatePanes: _tmp.RotationDirection
end

local record _ScrollByLine
	ScrollByLine: integer
end

local record _ScrollByPage
	ScrollByPage: number
end

local record _ScrollToPrompt
	ScrollToPrompt: integer
end

local enum _CurrentSelectionOrEmptyString
	"CurrentSelectionOrEmptyString"
end

local record _Search
	Search: _CurrentSelectionOrEmptyString|_tmp.SearchParams
end

local record _SelectTextAtMouseCursor
	SelectTextAtMouseCursor: _tmp.SelectionMode
end

local record _SendKey
	SendKey: _tmp.SendKeyParams
end

local record _SendString
	SendString: string
end

local record _SetPaneZoomState
	SetPaneZoomState: boolean
end

local record _SetWindowLevel
	SetWindowLevel: _tmp.SetWindowLevelParams
end

local record _ShowLauncherArgs
	ShowLauncherArgs: _tmp.ShowLauncherArgsParams
end

local record _SpawnTab
	SpawnTab: _tmp.SpawnTabDomain
end

local record _SpawnCommandInNewTab
	SpawnCommandInNewTab: _tmp.SpawnCommand
end

local record _SpawnCommandInNewWindow
	SpawnCommandInNewWindow: _tmp.SpawnCommand
end

local record _SplitPane
	SplitPane: _tmp.SplitPaneParams
end

local record _SplitHorizontal
	SplitHorizontal: _tmp.SpawnCommand
end

local record _
	SwitchWorkspaceRelative: integer
end

local record _SplitVertical
	SplitVertical: _tmp.SpawnCommand
end

local record _SwitchToWorkspace
	SwitchToWorkspace: _tmp.SwitchToWorkspaceParams
end

local record _SpawnTab
	SpawnTab: _tmp.SpawnTabDomain
end

local record _CloseCurrentPane
	confirm: _Confirm
end

local record _CloseCurrentTab
	confirm: _Confirm
end

local record _SwitchWorkspaceRelative
	 SwitchWorkspaceRelative: integer
end

-- ============================================================================

---@generic T
local type ActivateKeyTable             = function(params: _tmp.ActivateKeyTableParams): _ActivateKeyTable
local type ActivatePaneByIndex          = function(params: integer): _ActivatePaneByIndex
local type ActivatePaneDirection        = function(params: _tmp.PaneDirection): _ActivatePaneDirection
local type ActivateTab                  = function(params: integer): _ActivateTab
local type ActivateTabRelative          = function(params: integer): _ActivateTabRelative
local type ActivateTabRelativeNoWrap    = function(params: integer): _ActivateTabRelativeNoWrap
local type ActivateWindow               = function(params: integer): _ActivateWindow
local type ActivateWindowRelative       = function(params: integer): _ActivateWindowRelative
local type ActivateWindowRelativeNoWrap = function(params: integer): _ActivateWindowRelativeNoWrap
local type AdjustPaneSize               = function(params: _AdjustPaneSizeValue): _AdjustPaneSize
local type AttachDomain                 = function(domain: string): _AttachDomain
local type CharSelect                   = _CharSelect|function(params: CharSelectParams): _CharSelect
local type ClearScrollback              = function(params: _tmp.ScrollbackEraseMode): _ClearScrollback
local type CloseCurrentPane             = function(params: _Confirm): _CloseCurrentPane
local type CloseCurrentTab              = function(params: _Confirm): _CloseCurrentTab
local type CompleteSelection            = function(params: _tmp.ClipboardCopyDestination): _CompleteSelection
local type CompleteSelectionOrOpenLinkAtMouseCursor = function(params: _tmp.ClipboardCopyDestination): _CompleteSelectionOrOpenLinkAtMouseCursor
local type Confirmation                 = function(params: _tmp.ConfirmationParams): _Confirmation
local type CopyMode                     = function(params: _tmp.CopyModeParams): _CopyMode
local type CopyTo                       = function(params: _tmp.ClipboardCopyDestination): _CopyTo
local type CopyTextTo                   = function(params: _tmp.CopyTextToParams): _CopyTextTo
local type DetachDomain                 = function(params: _tmp.SpawnTabDomain): _DetachDomain
local type EmitEvent                    = function(event_id: string): _EmitEvent
local type ExtendSelectionToMouseCursor = function(params: _tmp.SelectionMode): _ExtendSelectionToMouseCursor
local type InputSelector                = function(params: InputSelectorParams): _InputSelector
local type MoveTab                      = function(index: integer): _MoveTab
local type MoveTabRelative              = function(index: integer): _MoveTabRelative
local type Multiple                     = _Multiple|function(events: {Action}): _Multiple
local type OpenUri                      = function(uri: string): _OpenUri
local type PaneSelect                   = _PaneSelect|function(params: _tmp.PaneSelectParams): _PaneSelect
local type PasteFrom                    = function(source: _tmp.ClipboardPasteDestination): _PasteFrom
local type PromptInputLine              = function(params: _tmp.PromptInputLineParams): _PromptInputLine
local type QuickSelectArgs              = _QuickSelectArgs|function(params: _tmp.QuickSelectArgsParams): _QuickSelectArgs
local type RotatePanes                  = function(params: _tmp.RotationDirection): _RotatePanes
local type ScrollByLine                 = function(amount: integer): _ScrollByLine
local type ScrollByPage                 = function(amount: number): _ScrollByPage
local type ScrollToPrompt               = function(amount: integer): _ScrollToPrompt
local type Search                       = function(params: _CurrentSelectionOrEmptyString|_tmp.SearchParams): _Search
local type SelectTextAtMouseCursor      = function(params: _tmp.SelectionMode): _SelectTextAtMouseCursor
local type SendKey                      = function(params: _tmp.SendKeyParams): _SendKey
local type SendString                   = function(params: string): _SendString
local type SetPaneZoomState             = function(state: boolean): _SetPaneZoomState
local type SetWindowLevel               = function(level: _tmp.SetWindowLevelParams): _SetWindowLevel
local type ShowLauncherArgs             = function(params: _tmp.ShowLauncherArgsParams): _ShowLauncherArgs
local type SpawnCommandInNewTab         = _SpawnCommandInNewTab|function(params: _tmp.SpawnCommand): _SpawnCommandInNewTab
local type SpawnCommandInNewWindow      = _SpawnCommandInNewWindow|function(params: _tmp.SpawnCommand): _SpawnCommandInNewWindow
local type SpawnTabAction               = function(params: _tmp.SpawnTabDomain): _SpawnTab
local type SplitHorizontal              = _SplitHorizontal|function(params: _tmp.SpawnCommand): _SplitHorizontal
local type SplitPane                    = function(params: _tmp.SplitPaneParams): _SplitPane
local type SplitVertical                = _SwitchToWorkspace|function(params: _tmp.SpawnCommand): _SwitchToWorkspace
local type SwitchToWorkspace            = _SwitchToWorkspace|function(params: _tmp.SwitchToWorkspaceParams): _SwitchToWorkspace
local type SwitchWorkspaceRelative      = function(params: integer): _SwitchWorkspaceRelative

return _Shared
