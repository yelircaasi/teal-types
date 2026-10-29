-- vim: ft=teal expandtab sw=3 ts=3

local _tmp = require("_tmp")

global record wezterm
   config: _tmp.WeztermConfig
   events: _tmp.Events
   harfbuzz: _tmp.Harfbuzz

   -- local type WezTerm.Color Wezterm.Color
   ---The `wezterm.color` module exposes functions that work with colors.
   color: _tmp.Color
   gui: _tmp.Gui
   mux: _tmp.Mux
   nerdfonts: _tmp.Nerdfonts
   plugin: _tmp.WeztermPlugin
   procinfo: _tmp.ProcInfo
   serde: _tmp.Serde
   time: _tmp.Time
   url: _tmp.Url
   window_decorations: _tmp.WindowDecorations

   -- enums:
   action: _tmp.KeyAssignment

   on: function(event: _tmp.WeztermEvent, callback: _tmp.EventCallback): nil


   ---This function is a helper to register a custom event and return
   ---an action triggering it.
   ---It is helpful to write custom key bindings directly, without having to declare
   ---the event and use it in a different place.
   ---The implementation is essentially the same as:
   ---```lua
   ---function wezterm.action_callback(callback)
   ---  local event_id = '...' -- the function generates a unique event id
   ---  wezterm.on(event_id, callback)
   ---  return wezterm.action.EmitEvent(event_id)
   ---end
   ---```
   action_callback: function(callback: function(...:any): nil): nil --?

   ---Adds path to the list of files that are watched for config changes.
   ---If `config.automatically_reload_config`
   ---is enabled, then the config will be reloaded when any of the files
   ---that have been added to the watch list have changed.
   ---See:
   --- - [`config.automatically_reload_config`](lua://Config.automatically_reload_config)
   add_to_config_reload_watch_list: function(path: string): nil

   ---Accepts an argument list; it will attempt to spawn that command in the background.
   background_child_process: function(args: {string}): nil

   ---Returns the battery information for each of the installed batteries on the system.
   ---This is useful for example to assemble status information for the status bar.
   battery_info: function(): {_tmp.BatteryInfo}

   ---Given a `string` parameter, returns the number of columns that text occupies
   ---in the terminal.
   ---This is useful together with the `"format-tab-title"` and `"update-right-status"` events
   ---to compute/layout tabs and status information.
   column_width: function(value: string): number

   ---Returns a `Config` object that can be used to define your configuration.
   ---See:
   --- - [`Config`](lua://Config)
   config_builder: function(): _tmp.Config

   ---Returns the compiled-in default hyperlink rules as a table.
   ---For more information, see:
   --- - [`HyperLinkRule`](lua://HyperLinkRule)
   default_hyperlink_rules: function(): {_tmp.HyperLinkRule}

   ---Computes a list of `SshDomain` objects based on the set of hosts
   ---discovered in `~/.ssh/config`.
   ---Each host will have both a plain SSH and a multiplexing SSH domain
   ---generated and returned in the list of domains.
   ---The former don't require WezTerm to be installed on the remote host,
   ---while the latter do require it.
   ---The intended purpose of this function is to give you the opportunity
   ---to edit/adjust the returned information before assigning it to your config.
   ---For more information, see:
   --- - [SshDomain](lua://SshDomain)
   default_ssh_domains: function(): {_tmp.SshDomain}

   ---Computes a list of `WslDomain` objects, each one representing
   ---an installed WSL distribution on your system.
   ---This list is the same as the default value for the `config.wsl_domains`
   ---configuration option, which is to make a `WslDomain` object
   ---with the `distribution` field set to the name of the WSL distro
   ---and the `name` field set to name of the distro with `"WSL:"` prefixed to it.
   ---See:
   --- - [`WslDomain`](lua://WslDomain)
   --- - [`config.wsl_domains`](lua://Config.wsl_domains)
   default_wsl_domains: function(): {_tmp.WslDomain}

   ---`wezterm.emit()` resolves the registered callback(s) for the specified event name
   ---and calls each of them in turn, passing the additional arguments through to the callback.
   ---If a callback returns `false` then it prevents later callbacks from being called
   ---for this particular call to `wezterm.emit()` so it will return `false` to indicate that
   ---no additional/default processing should take place.
   ---If none of the callbacks returned `false` then `wezterm.emit()` will itself return `true`
   ---to indicate that default processing should take place.
   ---This function has no special knowledge of which events are defined by WezTerm, or what
   ---their required arguments might be.
   ---For more information on event handling, see:
   ---- [`wezterm.emit()`](lua://Wezterm.emit)
   ---- [`wezterm.on`](lua://Wezterm.on)
   emit: function(event: string, ...:any): boolean

   ---This function will parse your ssh configuration file(s) and extract from them
   ---the set of literal (non-pattern, non-negated) host names that are specified
   ---in `Host` and `Match` stanzas contained in those configuration files
   ---and return a mapping from the hostname to the effective ssh config options for that host.
   ---You may optionally pass a list of ssh configuration files that should be read
   ---in case you have a special configuration.
   enumerate_ssh_hosts: function(ssh_config_file_name: {string}|string|nil): {string}

   ---This function constructs a Lua table that corresponds to the internal
   ---`FontAttributes` struct that is used to select a single named font:
   ---```lua
   ---local wezterm = require("wezterm") ---@type Wezterm
   ---return { font = wezterm.font 'JetBrains Mono' }
   ---```
   ---The first parameter is the name of the font; the name can be one of the following types of names:
   --- - The font family name, e.g. `"JetBrains Mono"`. The family name doesn't include any style information
   ---   (such as `weight`, `stretch` or `italic`), which can be specified via the `attributes` parameter.
   ---   This is the recommended name to use for the font, as it the most compatible way to resolve
   ---   an installed font.
   --- - The computed full name, which is the family name with the sub-family
   ---   (which incorporates style information) appended, e.g. `"JetBrains Mono Regular"`.
   --- - The postscript name, which is an ostensibly unique name identifying a given font and style
   ---   that is encoded into the font by the font designer.
   ---When specifying a font using its family name, the second `attributes` parameter is
   ---an **optional** table that can be used to specify style attributes.
   ---See:
   --- - [`TextStyleAttributes`](lua://TextStyleAttributes)
   --- - [`TextStyle`](lua://TextStyle)
   font: function(font: string|_tmp.FontFamilyAttributes, attributes: {_tmp.TextStyleAttributes}|nil): _tmp.TextStyle

   ---This function constructs a Lua table that corresponds to the internal
   ---`FontAttributes` struct that is used to select a single named font.
   ---The first parameter is a table where the font family and the attributes are combined.
   ---You can use this expanded table form to override freetype and harfbuzz settings
   ---just for the specified font.
   ---The second attributes parameter is an **optional** table that can also be used
   ---to specify style attributes.
   ---**Note**, that the attributes specified in the second `attributes` parameter will take precedence over
   ---any attributes specified in the first `font` parameter.
   ---This example shows how to disable the default ligature feature just for this particular font:
   ---```lua
   ---local wezterm = require('wezterm') ---@type Wezterm
   ---return {
   ---  font = wezterm.font({
   ---    family = 'JetBrains Mono',
   ---    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
   ---  }),
   ---}
   ---```
   ---See:
   --- - [`FontFamilyAttributes`](lua://FontFamilyAttributes)
   --- - [`TextStyleAttributes`](lua://TextStyleAttributes)
   --- - [`TextStyle`](lua://TextStyle)
   --- - [`wezterm.font()`](lua://Wezterm.font)
   font: function(font: _tmp.FontFamilyAttributes, attributes: _tmp.TextStyleAttributes|nil): _tmp.TextStyle

   ---This function constructs a Lua table that configures a font with fallback processing.
   ---Glyphs are looked up in the first font in the list but if missing the next font is checked and so on.
   ---The first parameter is a table listing the fonts in their preferred order.
   ---The fonts can be specified by the their family or using the alternative form
   ---where the family and attributes are specified as part of the same Lua table:
   ---```lua
   ---local wezterm = require("wezterm") ---@type Wezterm
   ---return {
   ---  font = wezterm.font_with_fallback {
   ---  {
   ---    family = 'JetBrains Mono'
   ---    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
   ---    weight = 'Medium'
   ---  },
   ---  { family = 'Terminus', weight = 'Bold' },
   ---  'Noto Color Emoji',
   ---}
   ---```
   ---WezTerm implicitly adds its default fallback to the list that you specify.
   ---The second `attributes` parameter is an **optional** table that can also be used
   ---to specify style attributes.
   ---**Note**, that the attributes specified in the second `attributes` parameter will take precedence over
   ---any attributes specified in the individual font tables and will affect all listed fonts.
   ---See:
   --- - [`FontFamilyAttributes`](lua://FontFamilyAttributes)
   --- - [`TextStyleAttributes`](lua://TextStyleAttributes)
   --- - [`TextStyle`](lua://TextStyle)
   font_with_fallback: function(fonts: {string|_tmp.FontFamilyAttributes}, attributes: _tmp.TextStyleAttributes|nil): _tmp.TextStyle

   ---Can be used to produce a formatted string with terminal graphic attributes
   ---such as `bold`, `italic` and `colors`.
   ---The result is a string with WezTerm-compatible escape sequences embedded.
   format: function(...: {_tmp.FormatItem}): string

   ---While this function is still valid, it is recommended to use instead:
   --- - [`wezterm.color.get_builtin_schemes()`](lua://Wezterm.Color.get_builtin_schemes)
   --- ---
   ---Returns a Lua table keyed by color scheme name and whose values are the color scheme definition
   ---of the builtin color schemes.
   ---This is useful for programmatically deciding things about the scheme to use based on its color,
   ---or for taking a scheme and overriding a couple of entries from your configuration file.
   ---@deprecated Use `wezterm.color.get_builtin_color_schemes()` instead
   get_builtin_color_schemes: function(): {string: _tmp.Palette}

   ---This function evalutes the glob pattern and returns an array containing the absolute file names
   ---of the matching results.
   ---Due to limitations in the Lua bindings, all of the paths must be able to be represented as `UTF-8`
   ---or this function will generate an error.
   glob: function(pattern: string, relative_to: string|nil): {string}

   ---This function was moved to `wezterm.color.gradient`.
   ---In addition, the returned colors are now of `Color` type.
   ------
   ---Given a gradient spec (`gradient`) and a number of colors (`num_colors`), returns a table
   ---holding that many colors spaced evenly across the range of the gradient.
   ---This is useful, for instance, for generating colors for tabs, or doing something fancy
   ---like interpolating colors across a gradient based on the time of the day.
   ---See:
   --- - [`Color`](lua://Color)
   --- - [`wezterm.color.gradient`](lua://Wezterm.Color.gradient)
   gradient_colors: function(gradient: _tmp.Gradient, num_colors: number): {_tmp.Color}
   ---@deprecated
   has_action: function(action: string): boolean

   hostname: function(): string

   json_encode: function(value: any): string

   json_parse: function(value: string): any

   ---This function logs the provided message string through WezTerm's logging layer at `'ERROR'`
   ---level, which can be displayed via the [`ShowDebugOverlay`](https://wezterm.org/config/lua/keyassignment/ShowDebugOverlay.html) action.
   ---If you started WezTerm from a terminal that text will print to the `stdout` of that terminal.
   ---If running as a daemon for the multiplexer server then it will be logged to the daemon output path.
   ---```lua
   ---local wezterm = require("wezterm") ---@type Wezterm
   ---wezterm.log_error('Hello!')
   ---```
   ---See also:
   --- - [`wezterm.log_info()`](lua://Wezterm.log_info)
   --- - [`wezterm.log_warn()`](lua://Wezterm.log_warn)
   log_error: function(msg: string, ...: any): nil

   ---This function logs the provided message string through WezTerm's logging layer at the `'INFO'`
   ---level, which can be displayed via the [`ShowDebugOverlay`](https://wezterm.org/config/lua/keyassignment/ShowDebugOverlay.html) action.
   ---If you started WezTerm from a terminal that text will print to the `stdout` of that terminal.
   ---If running as a daemon for the multiplexer server then it will be logged to the daemon output path.
   ---```lua
   ---local wezterm = require("wezterm") ---@type Wezterm
   ---wezterm.log_info('Hello!')
   ---```
   ---See also:
   --- - [`wezterm.log_error()`](lua://Wezterm.log_error)
   --- - [`wezterm.log_warn()`](lua://Wezterm.log_warn)
   log_info: function(msg: string, ...: any): nil

   ---This function logs the provided message string through WezTerm's logging layer at the `'WARN'`
   ---level, which can be displayed via the [`ShowDebugOverlay`](https://wezterm.org/config/lua/keyassignment/ShowDebugOverlay.html) action.
   ---If you started WezTerm from a terminal that text will print to the `stdout` of that terminal.
   ---If running as a daemon for the multiplexer server then it will be logged to the daemon output path.
   ---```lua
   ---local wezterm = require("wezterm") ---@type Wezterm
   ---wezterm.log_warn('Hello!')
   ---```
   ---See also:
   --- - [`wezterm.log_error()`](lua://Wezterm.log_error)
   --- - [`wezterm.log_info()`](lua://Wezterm.log_info)
   log_warn: function(msg: string, ...: any): nil


   ---This function opens the specified `path_or_url` with either the specified application,
   ---or the default application if `application` was not passed in.
   ---```lua
   ---local wezterm = require("wezterm") ---@type Wezterm
   ---wezterm.open_with('http://example.com') -- Opens a URL in your default browser
   ---wezterm.open_with('http://example.com', 'firefox') -- Opens a URL specifically in Firefox
   ---```
   open_with: function(path_or_url: string, application: string|nil): nil --?

   ---Returns a copy of a string `s` that is at least `min_width` columns as measured
   ---by `wezterm.column_width()`.
   ---If the string `s` is shorter than `min_width`, spaces are added to the left end of the string.
   ---For example, `wezterm.pad_left("o", 3)` returns `" o"`.
   ---See also:
   --- - [`wezterm.column_width()`](lua://Wezterm.column_width)
   --- - [`wezterm.pad_right()`](lua://Wezterm.pad_right)
   --- - [`wezterm.truncate_left()`](lua://Wezterm.truncate_left)
   pad_left: function(s: string, min_width: integer): string

   ---Returns a copy of a string `s` that is at least `min_width` columns as measured
   ---by `wezterm.column_width()`.
   ---If the string `s` is shorter than `min_width`, spaces are added to the right end of the string.
   ---For example, `wezterm.pad_right("o", 3)` returns `"o "`.
   ---See also:
   --- - [`wezterm.column_width()`](lua://Wezterm.column_width)
   --- - [`wezterm.pad_left()`](lua://Wezterm.pad_left)
   --- - [`wezterm.truncate_right()`](lua://Wezterm.truncate_right)
   pad_right: function(s: string, min_width: integer): string

   ---This function is intended to help with generating `KeyBinding` entries.
   ---These should apply regardless of the combination of modifier keys pressed.
   ---For each combination of modifiers, the supplied `table` value `T` is copied with
   ---a `mods = <value>` entry:
   --- - `CTRL`
   --- - `ALT`
   --- - `SHIFT`
   --- - `SUPER`
   ---An entry for `NONE` is **NOT** generated.
   ---This is the only difference between `wezterm.permute_any_or_no_mods()` and
   ---`wezterm.permute_any_mods()`.
   ---Either a `KeyBinding` or a `MouseBinding` array is returned.
   ---For more information, see:
   --- - [`KeyBinding`](lua://KeyBinding)
   --- - [`MouseBinding`](lua://MouseBinding)
   --- - [`wezterm.permute_any_or_no_mods()`](lua://Wezterm.permute_any_or_no_mods)
   permute_any_mods: function(T: table): _tmp.KeyBinding|_tmp.MouseBinding -- SHOULD BE: {_tmp.MouseBinding}|{_tmp.KeyBinding}

   ---This function is intended to help with generating `KeyBinding` entries.
   ---These should apply regardless of the combination of modifier keys pressed.
   ---For each combination of modifiers (`CTRL`, `ALT`, `SHIFT` and `SUPER`)
   ---the supplied `table` value `T` is copied with a `mods = <value>` entry.
   ---In addition, an entry for `NONE` is generated. This is the only difference
   ---between `wezterm.permute_any_mods()` and `wezterm.permute_any_or_no_mods()`.
   ---A `KeyBinding` array is returned.
   ---If this is either the only binding or the last one, the resulting array
   ---can be unpacked into a Lua table initializer by using `table.unpack()`.
   ---See:
   --- - [`KeyBinding`](lua://KeyBinding)
   --- - [`table.unpack()`](lua://table.unpack)
   --- - [`wezterm.permute_any_mods()`](lua://Wezterm.permute_any_mods)
   permute_any_or_no_mods: function(T: table): {_tmp.KeyBinding}

   ---This function is intended to help with generating `MouseBinding` entries.
   ---These should apply regardless of the combination of modifier keys pressed.
   ---For each combination of modifiers (`CTRL`, `ALT`, `SHIFT` and `SUPER`),
   ---the supplied `table` value `T` is copied with a `mods = <value>` entry.
   ---In addition, an entry for `NONE` is generated. This is the only difference between
   ---`wezterm.permute_any_mods()` and `wezterm.permute_any_or_no_mods()`.
   ---A `MouseBinding` array is returned.
   ---If this is either the only binding or the last one, the resulting array
   ---can be unpacked into a Lua table initializer by using `table.unpack()`.
   ---See:
   --- - [`MouseBinding`](lua://MouseBinding)
   --- - [`table.unpack()`](lua://table.unpack)
   --- - [`wezterm.permute_any_mods()`](lua://Wezterm.permute_any_mods)
   permute_any_or_no_mods: function(T: table): {_tmp.MouseBinding}

   ---Returns an array containing the absolute file name paths of the directory `path` specified.
   ---Due to limitations in the Lua bindings, all of the paths must be able to be represented as `UTF-8`
   ---or this function will generate an error.
   read_dir: function(path: string): {string}

   ---Immediately causes the configuration to be reloaded and re-applied.
   ---**If you call this at the file scope in your config you are in danger of creating an infinite loop
   ---that renders WezTerm unresponsive.**
   ---The intent is for this to be used from an event or timer callback function.
   reload_configuration: function(): nil

   ---This function accepts an argument list; it will attempt to spawn that command.
   ---It will return a tuple consisting of the boolean `success` of the invocation,
   ---the `stdout` data and the `stderr` data.
   ---```lua
   ---local wezterm = require("wezterm") ---@type Wezterm
   ---local success, stdout, stderr = wezterm.run_child_process({ 'ls', '-l' })
   ---```
   ---See also:
   --- - [`wezterm.background_child_process()`](lua://Wezterm.background_child_process)
   run_child_process: function(args: {string}): {boolean, string}

   ---This function returns a `boolean` indicating whether it is believed that WezTerm runs
   ---in a WSL container.
   ---In such an environment, `wezterm.target_triple` will indicate that the process is running
   ---in Linux with some slight differences in system behavior (such as filesystem capabilities)
   ---that you may wish to probe for in the configuration.
   ---```lua
   ---local wezterm = require("wezterm") ---@type Wezterm
   ---wezterm.log_error(
   ---  'System '
   ---  .. wezterm.target_triple
   ---  .. ' '
   ---  .. tostring(wezterm.running_under_wsl())
   ---)
   ---```
   ---See:
   --- - [`wezterm.log_error()`](lua://Wezterm.log_error)
   --- - [`wezterm.target_triple`](lua://Wezterm.target_triple)
   running_under_wsl: function(): boolean

   ---Joins together its array arguments by applying POSIX-style shell quoting on each argument
   ---and then adding a space.
   shell_join_args: function(args: {string}): string

   ---Quotes its single argument `s` using POSIX shell quoting rules.
   shell_quote_arg: function(s: string): string

   ---Splits a command line into a `string` argument array in accordance with POSIX shell rules.
   shell_split: function(line: string): {string}

   ---Suspends the execution of the script for `ms` milliseconds.
   ---When the time period has elapsed, the script continues running at the next statement.
   sleep_ms: function(ms: integer): nil

   ---Takes the input string and splits it by newlines.
   ---The result as an array of strings with the newlines removed.
   ---Both `\n` (LF) and `\r\n` (CRLF) are recognized as newlines.
   split_by_newlines: function(s: string): {string}

   ---Formats the current local date/time into a string using the Rust `chrono strftime` syntax.
   strftime: function(format: string): string

   ---Formats the current UTC date/time into a string using the Rust `chrono strftime` syntax.
   strftime_utc: function(format: string): string

   ---Returns a copy of a string that is no longer than `max_width` columns as measured
   ---by `wezterm.column_width()`. Truncation occurs by removing excess characters from the left end
   ---of the string.
   ---For example, `wezterm.truncate_left("hello", 3)` returns `"llo"`.
   ---See also:
   --- - [`wezterm.column_width()`](lua://Wezterm.column_width)
   --- - [`wezterm.pad_right()`](lua://Wezterm.pad_right)
   --- - [`wezterm.truncate_right()`](lua://Wezterm.truncate_right)
   truncate_left: function(s: string, max_width: integer): string

   ---Returns a copy of a string that is no longer than `max_width` columns as measured
   ---by `wezterm.column_width()`.
   ---Truncation occurs by reemoving excess characters from the right end of the string.
   ---For example, `wezterm.truncate_right("hello", 3)` returns `"hel"`.
   ---See also:
   --- - [`wezterm.column_width()`](lua://Wezterm.column_width)
   --- - [`wezterm.pad_left()`](lua://Wezterm.pad_left)
   --- - [`wezterm.truncate_left()`](lua://Wezterm.truncate_left)
   truncate_right: function(s: string, max_width: integer): string

   ---Overly specific and exists primarily to workaround this `wsl.exe` issue.
   ---It takes as input a string and attempts to convert it from `utf16` to `utf8`.
   utf16_to_utf8: function(s: string): string

   ---A custom declared event handler.
   ---You may register handlers for arbitrary events for which Wezterm itself has no special knowledge.
   ---It is recommended that you avoid event names that are likely to be used future versions of Wezterm
   ---in order to avoid unexpected behavior if or when those names might be used in future.
   ---The `wezterm.emit()` function and the `EmitEvent` key assignment can be used to emit events.
   ---See:
   --- - [`EmitEvent`](lua://KeyAssignment.EmitEvent)
   --- - [`Pane`](lua://Pane)
   --- - [`Window`](lua://Window)
   --- - [`wezterm.emit()`](lua://Wezterm.emit)
   ---<UNUSABLE> on: function(event: string, callback: fun(...:any): any): nil

   ---A custom declared event handler for events emitted by the `EmitEvent` key assignment.
   --- - The first event parameter is a `Window` object that represents the GUI window
   --- - The second event parameter is a `Pane` object that represents the pane
   ---   in which the event was triggered
   ---See:
   --- - [`EmitEvent`](lua://KeyAssignment.EmitEvent)
   --- - [`Pane`](lua://Pane)
   --- - [`Window`](lua://Window)
   ---<UNUSABLE> on: function(event: string, callback: CallbackWindowPane): nil

   ---This event is emitted when the Command Palette is shown.
   ---Its purpose is to enable you to add additional entries to the list of commands shown in the palette.
   ---This hook is synchronous; calling asynchronous functions will not succeed.
   ------
   ---The `"augment-command-palette"` event is emitted when the `Command Palette` is shown.
   ---Its purpose is to enable you to add additional entries to the list of commands
   ---shown in the palette.
   ---This hook is synchronous; calling asynchronous functions will not succeed.
   ---The return value is an `AugmentCommandPaletteReturn` table.
   ---See:
   --- - [`AugmentCommandPaletteReturn`](lua://AugmentCommandPaletteReturn)
   ---<UNUSABLE> ---<UNUSABLE> on: function(event: "augment-command-palette", callback: fun(window: Window, pane: Pane): AugmentCommandPaletteReturn): nil

   --- - The first event parameter is a `Window` object that represents the GUI window
   --- - The second event parameter is a `Pane` object that represents the pane
   ---   in which the bell was rung, which may not be active pane;
   ---   rather it could be in an unfocused pane or tab
   ------
   ---The `"bell"` event is emitted when the ASCII `BEL` sequence is emitted to a pane in the window.
   ---Defining an event handler doesn't alter WezTerm's handling of the bell; the event supplements it
   ---and allows you to take additional action over the configured behavior.
   ---See:
   --- - [`Pane`](lua://Pane)
   --- - [`Window`](lua://Window)
   ---<UNUSABLE> on: function(event: "bell", callback: CallbackWindowPane): nil

   ---The parameters to the event are:
   --- - `config`: The effective configuration for the window
   --- - `hover`: `true` if the current tab is in the hover state
   --- - `panes`: An array containing `PaneInformation` objects for each of the panes in the active tab
   --- - `tab`: The `TabInformation` for the active tab
   --- - `tabs`: An array containing `TabInformation` objects for each of the tabs in the window
   --- - `max_width`: The maximum number of cells available to draw this tab when using
   ---              the retro tab bar style
   ---The return value of the event can be:
   --- - A string, holding the text to use for the tab title
   --- - A `FormatItem` object as used in the `wezterm.format()` function.
   ---   This allows formatting style and color information for individual elements
   ---   within the tab
   ---If the event encounters an error, or returns something that is not
   ---one of the types mentioned above, then the default tab title text
   ---will be computed and used instead.
   ---When the tab bar is computed, this event is called twice for each tab;
   ---on the first pass, `hover` will be false and `max_width` will be set to `tab_max_width`.
   ---WezTerm will then compute the tab widths that will fit in the tab bar,
   ---and then call the event again for the set of tabs,
   ---this time with appropriate hover and max_width values.
   ---Only the first `"format-tab-title"` event will be executed; it doesn't make sense to define
   ---multiple instances of the event with multiple `wezterm.on("format-tab-title", ...)` calls.
   --- ---
   ---The `"format-tab-title"` event is emitted when the text for a tab title
   ---needs to be recomputed.
   ---This event is a bit special in that it is synchronous and must return
   ---as quickly as possible in order to avoid blocking the GUI thread.
   ---The most notable consequence of this is that some functions that are asynchronous
   ---(e.g. `wezterm.run_child_process()`) are not possible to call
   ---from inside the event handler and will generate the following error:
   ---```
   ---format-tab-title: runtime error: attempt to yield from outside a coroutine
   ---```
   ---See:
   --- - [`FormatItem`](lua://FormatItem)
   --- - [`wezterm.format()`](lua://Wezterm.format)
   --- - [`wezterm.run_child_process()`](lua://Wezterm.run_child_process)
   ---<UNUSABLE> on: function(event: "format-tab-title", callback: fun(tab: TabInformation, tabs: {TabInformation}, panes: {PaneInformation}, config: Config, hover: boolean, max_width: integer): string|FormatItem): nil

   ---The parameters to the event are:
   --- - `config`: The effective configuration for the window
   --- - `pane`: The `PaneInformation` object for the active pane
   --- - `panes`: An array containing `PaneInformation` objects for each of the panes in the active tab
   --- - `tab`: The `TabInformation` object for the active tab
   --- - `tabs`: An array containing `TabInformation` objects for each of the tabs in the window
   ---The return value of the event should be a `string`, and if it is then it will be used
   ---as the title text in the window title bar.
   ---If the event encounters an error, or returns something that is not a `string`,
   ---then the default window title text will be computed and used instead.
   ---Only the first `"format-window-title"` event will be executed; it doesn't make sense to define
   ---multiple instances of the event with multiple `wezterm.on("format-window-title", ...)` calls.
   ---The `"format-window-title"` event is emitted when the text for the window title
   ---needs to be recomputed.
   ---This event is a bit special in that it is synchronous and must return as quickly as possible
   ---in order to avoid blocking the GUI thread.
   ---The most notable consequence of this is that some functions that are asynchronous
   ---(e.g. `wezterm.run_child_process()`) are not possible to call from inside
   ---the event handler and will generate the following error:
   ---```
   ---format-window-title: runtime error: attempt to yield from outside a coroutine
   ---```
   ---For more information, see:
   --- - [`wezterm.run_child_process()`](lua://Wezterm.run_child_process)
   ---Mirrors the `format-window-title` callback arguments in wezterm upstream:
   ---https://github.com/wezterm/wezterm/blob/main/wezterm-gui/src/termwindow/mod.rs
   ---<UNUSABLE> on: function(event: "format-window-title", callback: fun(tab: TabInformation, pane: PaneInformation, tabs: {TabInformation}, panes: {PaneInformation}, config: Config): string): nil

   ---This event is triggered when the GUI is starting up after attaching the selected domain.
   ---For example, when running `wezterm connect DOMAIN` or `wezterm start --domain DOMAIN`
   ---to start the GUI, the `gui-attached` event will be triggered and passed the `MuxDomain` object
   ---associated with `DOMAIN`.
   ---In cases where you don't specify the domain, the default domain will be passed instead.
   ---This event fires after the `gui-startup` event.
   ---Note that the `gui-startup` event does not fire when invoking
   ---`wezterm connect DOMAIN` or `wezterm start --domain DOMAIN --attach`.
   ---<UNUSABLE> on: function(event: "gui-attached", callback: fun(domain: MuxDomain|ExecDomain)): nil

   ---The `gui-startup` event is emitted once when the GUI server is starting up when running
   ---the `wezterm start` subcommand.
   ---If no explicit program was passed to `wezterm start`, and if the `gui-startup` event causes
   ---any panes to be created then those will take precedence over the default program configuration
   ---and no additional default program will be spawned.
   ---This event is useful for starting a set of programs in a standard configuration
   ---to save you the effort of doing it manually each time.
   --- - It is triggered before any default program is started
   --- - This event fires before `'gui-attached'`
   --- - This event does not fire for `wezterm connect` invocations
   --- - The event receives an optional `SpawnCommand` argument that corresponds to any arguments
   ---   that may have been passed via `wezterm start`
   ---The intent is for you to use the information in the command object to spawn a new window,
   ---but you can choose to use or ignore it as suits your purpose.
   ---<UNUSABLE> on: function(event: "gui-startup", callback: fun(cmd?: SpawnCommand)): nil

   ---The `mux-is-process-stateful` event is emitted when the multiplexer layer wants to determine
   ---whether a given `Pane` can be closed without prompting the user.
   ---This event is synchronous and must return as quickly as possible in order to avoid
   ---blocking the multiplexer.
   ---The event is passed a `LocalProcessInfo` object representing the process that corresponds
   ---to the pane.
   ---The hook can return one of the following values:
   --- - `false`: to indicate that the process tree can be terminated without prompting the user
   --- - `true`: to indicate that this process tree is considered to be stateful and that the user
   ---         should be prompted before terminating the pane
   ---Any other value means to use the default behavior, which is to consider the configuration option:
   ----[`config.skip_close_confirmation_for_processes_named`](lua://Config.skip_close_confirmation_for_processes_named)
   ---<UNUSABLE> on: function(event: "mux-is-process-stateful", callback: fun(info: LocalProcessInfo): boolean): nil

   ---The `mux-startup` event is emitted once when the mux server is starting up.
   ---It is triggered before any default program is started.
   ---If the `mux-startup` event causes any panes to be created then those will take precedence
   ---over the default program configuration and no additional default program will be spawned.
   ---This event is useful for starting a set of programs in a standard configuration to save you
   ---the effort of manually doing it each time.
   ---Example:
   ---```lua
   ---local wezterm = require("wezterm") ---@type Wezterm
   ---local mux = wezterm.mux
   ----- this is called by the mux server when it starts up.
   ----- It makes a window split top/bottom
   ---wezterm.on('mux-startup', function()
   ---  local _, pane = mux.spawn_window({})
   ---  pane:split({ direction = 'Top' })
   ---end)
   ---return {
   ---  unix_domains = {
   ---    { name = 'unix' },
   ---  },
   ---}
   ---```
   ---See also:
   --- - [`wezterm.mux`](lua://Wezterm.Mux)
   ---<UNUSABLE> on: function(event: "mux-startup", callback: function): nil

   --- - The first event parameter is a `Window` object that represents the GUI window
   --- - The second event parameter is a `Pane` object that represents the active pane in the window
   ------
   ---The `"new-tab-button-click"` event is emitted when the user clicks on the
   ---`"new tab"` button in the tab bar.
   ---This is the `+` button that is drawn to the right of the last tab.
   ---Returning early with `false` in the callback will prevent the event handler from
   ---performing the default actions of the button pressed.
   ---For more information, see:
   --- - [`Pane`](lua://Pane)
   --- - [`Window`](lua://Window)
   ---<UNUSABLE> on: function(event: "new-tab-button-click", callback: fun(window: Window, pane: Pane, button: "Left"|"Middle"|"Right", default_action?: Action): false|nil|?): nil

   --- - The first event parameter is a `Window` object that represents the GUI window
   --- - The second event parameter is a `Pane` object that represents the pane
   --- - The third event parameter is the URI string
   ------
   ---The `"open-uri"` event is emitted when
   ---the `CompleteSelectionOrOpenLinkAtMouseCursor` key/mouse assignment is triggered.
   ---The default action is to open the active URI in your browser,
   ---but if you register for this event and return early with `false`
   ---you can co-opt the default behavior.
   ---For more information, see:
   --- - [`Pane`](lua://Pane)
   --- - [`Window`](lua://Window)
   ---<UNUSABLE> on: function(event: "open-uri", callback: fun(window: Window, pane: Pane, uri: string): false|nil|?): nil

   ---This event is considered to be deprecated and you should migrate to using `"update-status"`,
   ---which behaves the same way, but doesn't overly focus on the right status area.
   ------
   --- - The first event parameter is a `Window` object that represents the GUI window
   --- - The second event parameter is a `Pane` object that represents the active pane in that window
   ---There is no defined return value for the event, but its purpose is to allow you the chance
   ---to carry out some activity and then ultimately call `Window:set_right_status()`.
   ---WezTerm will ensure that only a single instance of this event is outstanding; if the hook
   ---takes longer than the `config.status_update_interval` to complete, `wezterm` won't schedule
   ---another call until `config.status_update_interval` time has elapsed since the last call completed.
   ------
   ---The `"update-right-status"` event is emitted periodically
   ---(based on the interval specified by `config.status_update_interval`).
   ---For more information, see:
   --- - [`Pane`](lua://Pane)
   --- - [`Window`](lua://Window)
   --- - [`Window:set_right_status()`](lua://Window.set_right_status)
   --- - [`config.status_update_interval`](lua://Config.status_update_interval)
   ---@param event "update-right-status"
   ---@param callback CallbackWindowPane
   ---@deprecated Use the `"update-status"` event instead
   ---<UNUSABLE> on: function(event, callback) end

   --- - The first event parameter is a `Window` object that represents the GUI window
   --- - The second event parameter is a `Pane` object that represents the active pane in that window
   ---There is no defined return value for the event, but its purpose is
   ---to allow you the chance to carry out some activity and then ultimately call
   ---`Window:set_left_status()`.
   ---WezTerm will ensure that only a single instance of this event is outstanding; if the hook
   ---takes longer than `config.status_update_interval` to complete, `wezterm` won't schedule
   ---another call until `config.status_update_interval` time has elapsed since the last call completed.
   ------
   ---The `"update-left-status"` event is emitted periodically
   ---(based on the interval specified by `config.status_update_interval`).
   ---For more information, see:
   --- - [`Pane`](lua://Pane)
   --- - [`Window`](lua://Window)
   --- - [`Window:set_left_status()`](lua://Window.set_left_status)
   --- - [`config.status_update_interval`](lua://Config.status_update_interval)
   ---<UNUSABLE> on: function(event: "update-status", callback: CallbackWindowPane): nil

   ---You can use something like the following from your shell
   ---to set the user var named `foo` to the value `bar`:
   ---```sh
   ---# Shell script
   ---printf "\033]1337;SetUserVar=%s=%s\007" foo `echo -n bar | base64`
   ---```
   ---Then, if you have this in your config:
   ---```lua
   ---local wezterm = require("wezterm") ---@type Wezterm
   ---wezterm.on('user-var-changed', function(window, pane, name, value)
   ---  wezterm.log_info('var', name, value)
   ---end)
   ---return {}
   ---```
   ---your event handler will be called with `name = 'foo'` and `value = 'bar'`.
   ---For more info, see:
   --- - [`Pane:get_user_vars()`](lua://Pane.get_user_vars)
   ------
   ---The `"user-var-changed"` event is emitted when a _user var escape sequence_
   ---is used to set a user var.
   ---<UNUSABLE> on: function(event: "user-var-changed", callback: fun(window: Window, pane: Pane, name: string, value: string)): nil

   ---This event is _fire-and-forget_ from Wezterm's perspective; it fires the event to advise
   ---of the config change, but has no other expectations.
   ---If you call `Window:set_config_overrides()` from inside this event callback then an additional
   ---`window-config-reloaded` event will be triggered.
   ---You should take care to avoid creating a loop by only calling `Window:set_config_overrides()`
   ---when the actual override values are changed.
   --- - The first event parameter is a `Window` object that represents the GUI window
   --- - The second event parameter is a `Pane` object that represents the active pane in that window
   ------
   ---The `"window-config-reloaded"` event is emitted when the configuration for a window
   ---has been reloaded.
   ---This can occur when the configuration file is detected as changed
   ---(when `config.automatically_reload_config` is enabled), when the configuration is explicitly
   ---reloaded via the `ReloadConfiguration` key action, and when `Window:set_config_overrides()`
   ---is called for the window.
   ---For more information, see:
   --- - [`Pane`](lua://Pane)
   --- - [`Window`](lua://Window)
   --- - [`Window:set_config_overrides()`](lua://Window.set_config_overrides)
   --- - [`config.automatically_reload_config`](lua://Config.automatically_reload_config)
   ---<UNUSABLE> on: function(event: "window-config-reloaded", callback: CallbackWindowPane): nil

   ---This event is _fire-and-forget_ from WezTerm's perspective; it fires the event to advise
   ---of the config change, but has no other expectations.
   --- - The first event parameter is a `Window` object that represents the GUI window
   --- - The second event parameter is a `Pane` object that represents the active pane in that window
   ------
   ---The `"window-focus-changed"` event is emitted when the focus state for a window is changed.
   ---For more information, see:
   --- - [`Pane`](lua://Pane)
   --- - [`Window`](lua://Window)
   ---<UNUSABLE> on: function(event: "window-focus-changed", callback: CallbackWindowPane): nil

   --- - The first event parameter is a `Window` object that represents the GUI window
   --- - The second event parameter is a `Pane` object that represents the active pane in that window
   ---The `"window-resized"` event is emitted when the window is resized and when transitioning
   ---between full-screen and regular windowed mode.
   ---The event is triggered asynchronously with respect to the potentially-ongoing
   ---live resize operation. `wezterm` will coalesce the stream of multiple events generated by a live
   ---resize such that there can be a maximum of one executing event, and one buffered event.
   ---For more information, see:
   --- - [`Pane`](lua://Pane)
   --- - [`Window`](lua://Window)
   ---<UNUSABLE> on: function(event: "window-resized", callback: CallbackWindowPane): nil

   ---=============================== dev.wezterm =====================================

   ---This is for `dev.wezterm` only!
   ------
   ---Either no `hashkey` or an invalid one provided.
   ---<UNUSABLE> on: function(event: "dev.wezterm.invalid_hashkey" This is for `dev.wezterm` only!, callback: function): nil

   ---This is for `dev.wezterm` only!
   ------
   ---Invalid options provided to plugin setup.
   ---<UNUSABLE> on: function(event: "dev.wezterm.invalid_opts" This is for `dev.wezterm` only!, callback: function): nil

   ---This is for `dev.wezterm` only!
   ------
   ---No keywords were provided for searching the plugin.
   ---<UNUSABLE> on: function(event: "dev.wezterm.no_keywords" This is for `dev.wezterm` only!, callback: function): nil

   ---This is for `dev.wezterm` only!
   ------
   ---The plugin was not found and thus `package.path` could not be set.
   ---<UNUSABLE> on: function(event: "dev.wezterm.require_path_not_set" This is for `dev.wezterm` only!, callback: function): nil

   ---This is for `dev.wezterm` only!
   ------
   ---The provided keywords did not allow for the plugin to be found.
   ---<UNUSABLE> on: function(event: "dev.wezterm-plugin-not-found" This is for `dev.wezterm` only!, callback: function): nil

   ---=================================================================================

   ---============================== modal.wezterm ====================================

   ---This is for `modal.wezterm` only!
   ---<UNUSABLE> on: function(event: "modal.enter" This is for `modal.wezterm` only!, callback: fun(name: string, window: Window, pane: Pane)): nil

   ---This is for `modal.wezterm` only!
   ---<UNUSABLE> on: function(event: "modal.exit" This is for `modal.wezterm` only!, callback: fun(name: string, window: Window, pane: Pane)): nil

   ---=================================================================================

   ---===================== smart_workspace_switcher.wezterm ==========================

   ---This is for `smart_workspace_switcher.wezterm` only!
   ---<UNUSABLE> on: function(event: "smart_workspace_switcher.workspace_switcher.chosen" This is for `smart_workspace_switcher.wezterm` only!, callback: fun(window: MuxWindow, workspace: string)): nil

   ---This is for `smart_workspace_switcher.wezterm` only!
   ---<UNUSABLE> on: function(event: "smart_workspace_switcher.workspace_switcher.created" This is for `smart_workspace_switcher.wezterm` only!, callback: fun(window: MuxWindow, workspace: string)): nil

   ---=================================================================================

   ---============================= tabsets.wezterm ===================================

   ---This is for `tabsets.wezterm` only!
   ---<UNUSABLE> on: function(event: "delete_tabset" This is for `tabsets.wezterm` only!, callback: fun(window: Window)): nil

   ---This is for `tabsets.wezterm` only!
   ---<UNUSABLE> on: function(event: "load_tabset" This is for `tabsets.wezterm` only!, callback: fun(window: Window)): nil

   ---This is for `tabsets.wezterm` only!
   ---<UNUSABLE> on: function(event: "rename_tabset" This is for `tabsets.wezterm` only!, callback: fun(window: Window)): nil

   ---This is for `tabsets.wezterm` only!
   ---<UNUSABLE> on: function(event: "save_tabset" This is for `tabsets.wezterm` only!, callback: fun(window: Window)): nil

   ---============================= wezterm-sessions ==================================

   ---This is for `wezterm-sessions` only!
   ---<UNUSABLE> on: function(event: "delete_session" This is for `wezterm-sessions` only!, callback: fun(window: Window, pane: Pane)): nil

   ---This is for `wezterm-sessions` only!
   ---<UNUSABLE> on: function(event: "edit_session" This is for `wezterm-sessions` only!, callback: fun(window: Window, pane: Pane)): nil

   ---This is for `wezterm-sessions` only!
   ---<UNUSABLE> on: function(event: "fork_session" This is for `wezterm-sessions` only!, callback: fun(window: Window, pane: Pane)): nil

   ---This is for `wezterm-sessions` only!
   ---<UNUSABLE> on: function(event: "load_session" This is for `wezterm-sessions` only!, callback: fun(window: Window, pane: Pane)): nil

   ---This is for `wezterm-sessions` only!
   ---<UNUSABLE> on: function(event: "restore_session" This is for `wezterm-sessions` only!, callback: fun(window: Window)): nil

   ---This is for `wezterm-sessions` only!
   ---<UNUSABLE> on: function(event: "save_session" This is for `wezterm-sessions` only!, callback: fun(window: Window)): nil

   ---This is for `wezterm-sessions` only!
   ---<UNUSABLE> on: function(event: "toggle_autosave" This is for `wezterm-sessions` only!, callback: fun(window: Window)): nil

end
