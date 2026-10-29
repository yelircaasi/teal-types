
local record FormatItemAttribute
	Intensity: FormatItemAttribute.Intensity | nil
	Italic: boolean | nil
	Underline: FormatItemAttribute.Underline
end

local record FormatItemSpec
	Attribute: FormatItemAttribute | nil
	Background: ColorSpec | nil
	Foreground: ColorSpec | nil
	Text: string | nil
end

local record FontAttributesBase
	---To control whether a font is considered to have emoji (rather than text)
	---presentation glyphs for emoji.
	assume_emoji_presentation: boolean | nil
	family: string
	---you can combine the flags like `"NO_HINTING|MONOCHROME"`
	---**(you probably wouldn't want to do this)**.
	freetype_load_flags: FreeTypeLoadFlags | nil
	freetype_load_target: FreeTypeTarget | nil
	freetype_render_target: FreeTypeTarget | nil
	---When `config.font_shaper` is
	---set to `"Harfbuzz"`, this setting affects
	---how font shaping takes place.
	---The _OpenType_ spec lists a number of features
	---[here](https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist).
	---For more information and examples, see:
	--- - [Font Shaping](https://wezterm.org/config/font-shaping.html)
	--- - [`config.font_shaper`](lua://Config.font_shaper)
	harfbuzz_features: HarfbuzzFeatures | nil[]
	scale: number | nil
	stretch: FontStretch | nil
	---This option will only be respected if the `italic` option is `nil`.
	style: FontStyle | nil
	weight: FontWeight | nil

---Argument type for `Wezterm.font()` and `Wezterm.font_with_fallback()`.
local record FontFamilyAttributes: FontAttributesBase
	---Setting this option to `true` will overwrite the `style` option to `Italic`.
	---Otherwise it will overwrite the `style` option to `Normal`.
	italic: boolean | nil

---Corresponds to the internal `FontAttributes` struct that is used to
---select a single named font.
local record FontAttributes: FontAttributesBase
	is_fallback: boolean | nil
	is_synthetic: boolean | nil
end

local record TextStyleAttributes
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
	stretch: FontStretch | nil
	style: FontStyle | nil
	weight: FontWeight | nil
end

local record TextStyle
	fonts: FontAttributes[]
	foreground: string | nil
end

local record WindowFrameConfig
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

local record TabBarStyle
	new_tab: string | nil
	new_tab_hover: string | nil
	window_close: string | nil
	window_close_hover: string | nil
	window_hide: string | nil
	window_hide_hover: string | nil
	window_maximize: string | nil
	window_maximize_hover: string | nil
end

local record HyperlinkRule
	format: string
	highlight: integer | nil
	regex: string
end

local record SerialDomain
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

---Corresponds to [`wgpu::AdapterInfo`](https://docs.rs/wgpu/latest/wgpu/struct.AdapterInfo.html).
local record GpuInfo
	backend: GpuInfo.Backend
	device: integer
	device_type: GpuInfo.DeviceType
	driver: string | nil
	driver_info: string | nil
	name: string
	vendor: integer
end

local record UnixDomain
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
	proxy_command: string[]
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
	serve_command: string[]
	---If `true`, bypass checking for secure ownership of `socket_path`.
	---This is not recommended on a multi-user system, but is useful, for example,
	---when running the server inside a WSL container but with the socket on
	---the host NTFS volume.
	skip_permissions_check: boolean
	socket_path: string
	write_timeout: integer
end

local record LeaderKey: Key
	---Maximum time to wait for next key.
	---Default is `1000` ms.
	timeout_milliseconds: integer | nil
end

local record HyperLinkRule
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

local record BatteryInfo
	---If known, shows the battery model string or `"unknown"` otherwise.
	model: string
	---If known, shows the battery serial number or `"unknown"` otherwise.
	serial: string
	state: BatteryInfo.State
	---The battery level expressed as a number between `0.0` (empty) and `1.0` (full).
	state_of_charge: number
	---If discharing, how long until the battery is empty (in seconds).
	time_to_empty: integer | nil
	---If charging, how long until the battery is full (in seconds).
	time_to_full: integer | nil
	---If known, shows battery manufacturer name or `"unknown"` otherwise.
	vendor: string
end

local record AugmentCommandPaletteReturn
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
	icon: Wezterm | nil.NerdFont
end

---Mirrors `StableCursorPosition` in wezterm upstream:
---https://github.com/wezterm/wezterm/blob/main/mux/src/renderable.rs
local record StableCursorPosition
	shape: StableCursorPosition.Shape
	visibility: "Visible"|"Hidden"
	---The horizontal cell index.
	x: integer
	---The vertical stable row index.
	y: integer
end

local record LinearGradientOrientation
	angle: number
end

local record RadialGradientOrientation
	cx: number | nil
	cy: number | nil
	radius: number | nil
end

local record Gradient
	blend: Gradient | nil.Blend
	colors: string[]
	interpolation: Gradient | nil.Interpolation
	noise: number | nil
	orientation: GradientOrientation | nil
	segment_size: number | nil
	segment_smoothness: number | nil
end

local record ColorSchemeMetaData
	aliases: string | nil[]
	author: string | nil
	name: string | nil
	origin_url: string | nil
	wezterm_version: string | nil
end

local record ScreenInformation
	height: number
	max_fps: number | nil
	name: string
	width: number
	x: number
	y: number
end

local record GuiScreensInfo
	active: ScreenInformation
	byName: table<string, ScreenInformation>
	main: ScreenInformation
	origin_x: number
	origin_y: number
	virtual_height: number
	virtual_width: number
end

local record KeyBinding: Key
	action: Action
	key: string
	mods: string | nil
end

local record MouseEventInfo
	button: "Left"|"Right"|"Middle"|{ WheelDown: number }|{ WheelUp: number }
	streak: number
end

local record MouseBindingBase
	action: Action
	alt_screen: boolean | nil|"Any"
	event: MouseEvent
	mouse_reporting: boolean | nil
end

local record MouseBinding: MouseBindingBase
	mods: string
end
---The `wezterm` module is the primary module that exposes
---WezTerm configuration and control to your config file.
---You will typically place:
---```lua
---local wezterm = require("wezterm")
---```
---at the top of your configuration file to enable it.

local record Wezterm: ExecDomain
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
	GLOBAL: table<string, string|number|table|boolean>
	---Helper for defining key assignment actions in your configuration file.
	---This is really just sugar for the underlying `Lua ==> Rust` deserialation mapping
	---that makes it a bit easier to identify where syntax errors may exist in your configuration.
	---For more information, see:
	--- - [`Action`](lua://Action)
	--- - [`KeyAssignment`](lua://KeyAssignment)
	action: KeyAssignment
	---The `wezterm.color` module exposes functions that work with colors.
	---For more information, see:
	--- - [`Wezterm.Color`](lua://Wezterm.Color)
	color: Wezterm.Color
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
	gui: Wezterm.Gui
	home_dir: string
	---For more information, see:
	--- - [`Wezterm.Mux`](lua://Wezterm.Mux)
	mux: Wezterm.Mux
	---For more information, see:
	--- - [`Wezterm.NerdFont`](lua://Wezterm.NerdFont)
	nerdfonts: Wezterm.NerdFont
	---The `wezterm.plugin` module provides functions to manage WezTerm plugins.
	---For more information, see:
	--- - [`Wezterm.Plugin`](lua://Wezterm.Plugin)
	plugin: Wezterm.Plugin
	---The `wezterm.procinfo` module exposes functions that allow querying information about
	---processes that are running on the local system.
	---For more information, see:
	--- - [`Wezterm.ProcInfo`](lua://Wezterm.ProcInfo)
	procinfo: Wezterm.ProcInfo
	---The `wezterm.serde` module provides functions for parsing the given string
	---as JSON, YAML, or TOML, returning the corresponding Lua values, and vice-versa.
	---For more information, see:
	--- - [`Wezterm.Serde`](lua://Wezterm.Serde)
	serde: Wezterm.Serde
	---This constant is set to the Rust target triple for the platform on which
	---WezTerm was built.
	---This can be useful when you wish to conditionally adjust your configuration
	---based on the platform.
	target_triple: string
	---The `wezterm.time` module exposes functions that allow working with time.
	---For more information, see:
	--- - [`Wezterm.Time`](lua://Wezterm.Time)
	time: Wezterm.Time
	---The `wezterm.url` module exposes functions that allow working with URLs.
	---For more information, see:
	--- - [`Wezterm.Url`](lua://Wezterm.Url)
	url: Wezterm.Url
	---This constant is set to the WezTerm version string that is also reported
	---by running `wezterm -V`.
	---This can potentially be used to adjust configuration according to the installed version.
	version: string
end