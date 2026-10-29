local record WindowDimensions
	pixel_width: number
	pixel_height: number
	dpi: number
	is_full_screen: boolean

---A `Window` object cannot be created in Lua code; it is typically passed to the user code via
---an event callback. It is a handle to a GUI `TermWindow` running in the wezterm process.
local record Window

	---A convenience accessor for returning the active pane in the active tab of the GUI window.
	---This is similar to `MuxWindow:active_pane()` but, because it operates at the GUI layer,
	---it can return `Pane` objects for special overlay panes that are not visible to the mux layer
	---of the API.
	---See:
	--- - [`MuxWindow:active_pane()`](lua://MuxWindow.active_pane)
	--- - [`Pane`](lua://Pane)
	active_pane: function(self: Window): Pane

	---A convenience accessor for returning the active `tab` within the window.
	active_tab: function(self: Window): MuxTab

	---Returns the name of the active workspace.
	active_workspace: function(self: Window): string

	---Returns either a string holding the current dead key or IME composition text, or `nil`
	---if the input layer is not in a composition state.
	---This is the same text that is shown at the cursor position when composing.
	composition_status: function(self: Window): string|nil|?

	---Puts text into the specified clipboard.
	copy_to_clipboard: function(self: Window, text: string): nil

	---@param text string
	---@param target? "Clipboard"|"PrimarySelection"|"ClipboardAndPrimarySelection"
	copy_to_clipboard: function(self: Window, text, target) end

	---Returns the current event.
	---For now this is only implemented for mouse events.
	current_event: function(self: Window): WindowEvent

	---Returns a Lua table representing the effective configuration for the `Window`.
	---The table is in the same format as that used to specify the config in the `wezterm.lua` file,
	---but represents the fully-populated state of the configuration, including any CLI or per-window
	---configuration overrides.
	---Note that changing the config table will NOT change the effective window config; it's just a copy
	---of that information.
	effective_config: function(self: Window): Config

	---Attempts to focus and activate the window.
	focus: function(self: Window): nil

	---Returns the appearance of the window environment.
	get_appearance: function(self: Window): "Light"|"Dark"|"LightHighContrast"|"DarkHighContrast"

	---Returns a copy of the current set of configuration overrides that is in effect for the window.
	---For examples, see:
	--- - [`set_config_overrides`](lua://Window.set_config_overrides)
	get_config_overrides: function(self: Window): Config

	---Returns a Lua table representing the dimensions for the `Window`.
	get_dimensions: function(self: Window): WindowDimensions

	---Returns the text that is currently selected within the specified pane, within the
	---specified window formatted with the escape sequences necessary to reproduce the same colors
	---and styling.
	---This is the same text that `window:get_selection_text_for_pane()` would return, except that
	---it includes escape sequences.
	---See:
	--- - [`window:get_selection_text_for_pane()`](lua://Window.get_selection_text_for_pane)
	get_selection_escapes_for_pane: function(self: Window): string

	---Returns the text that is currently selected within the specified `Pane`, within the
	---specified window.
	---This is the same text that would be copied to the clipboard if the `CopyTo` action were
	---to be performed.
	get_selection_text_for_pane: function(self: Window, pane: Pane The `Pane` object.): string

	---Returns `true` if the window has focus.
	---The `"update-status"` event is fired when the focus state changes.
	is_focused: function(self: Window): boolean

	---Returns two values; the keyboard `modifiers` and the key status `leds`.
	---Note that macOS doesn't have a num lock concept.
	---@return string mods
	keyboard_modifiers: function(self: Window): "CAPS_LOCK"|"NUM_LOCK"|"CAPS_LOCK|NUM_LOCK"

	---Returns `true` if the Leader Key is active in the window, or `false` otherwise.
	leader_is_active: function(self: Window): boolean

	---Puts the window into the maximized state.
	---To return to the normal/non-maximized state use `window:restore()`.
	---See:
	--- - [`window:restore()`](lua://Window.restore)
	maximize: function(self: Window): nil

	---Returns the `MuxWindow` representation of this window.
	---For more information, see:
	--- - [`MuxWindow`](lua://MuxWindow)
	mux_window: function(self: Window): MuxWindow

	---Performs a key assignment against the window and pane.
	---There are a number of actions that can be performed against a pane in a window when configured
	---via the keys and mouse configuration options.
	perform_action: function(self: Window, key_assignment: Action, pane: Pane The `Pane` object.): nil

	---Restores the window from the maximized state.
	---For more information, see:
	--- - [`Window:maximize()`](lua://Window.maximize)
	restore: function(self: Window): nil

	---Changes the set of configuration overrides for the window.
	---The config file is re-evaLuated and any CLI overrides are applied, followed by the keys
	---and values from the overrides parameter. This can be used to override configuration on a
	---per-window basis; this is only useful for options that apply to the GUI window, such as
	---rendering the GUI.
	---Each call to `window:set_config_overrides()` will emit the `"window-config-reloaded"` event
	---for the window.
	---If you are calling this method from inside the handler for `"window-config-reloaded"` you should
	---take care to only call `window:set_config_overrides()` if the actual override values have changed
	---to avoid a loop.
	set_config_overrides: function(self: Window, overrides: Config): nil

	---Resizes the inner portion of the window (excluding any window decorations) to the specified width
	---and height.
	set_inner_size: function(self: Window, width: number, height: number): nil

	---This method can be used to change the content that is displayed in the tab bar, to the left of
	---the tabs and new tab button.
	---The content is left-aligned and will be clipped from the right edge to fit in the
	---available space.
	---The parameter is a string that can contain escape sequences that change presentation. To compose
	---the string, it is recommended that you use `wezterm.format()`.
	---See:
	--- - [`wezterm.format()`](lua://Wezterm.format)
	set_left_status: function(self: Window, str: string): nil

	---Repositions the top-left corner of the window to the specified `x` and `y` coordinates.
	---Note that Wayland does not allow applications to directly control their window placement,
	---so this method has no effect on Wayland.
	set_position: function(self: Window, x: number, y: number): nil

	---This method can be used to change the content that is displayed in the tab bar, to the right of
	---the tabs and new tab button.
	---The content is right-aligned and will be clipped from the left edge to fit in
	---the available space.
	---The parameter is a string that can contain escape sequences that change presentation.
	---To compose the string, it is recommended that you use `wezterm.format()`.
	---See:
	--- - [`wezterm.format()`](lua://Wezterm.format)
	set_right_status: function(self: Window, str: string): nil

	---Generates a desktop "toast notification" with the specified `title` and `message`.
	---An optional `url` parameter can be provided; clicking on the notification will open that URL.
	---An optional `timeout` parameter can be provided; if so, it specifies how long the notification
	---will remain prominently displayed in milliseconds.
	---To specify a `timeout` without specifying a `url`, set the `url` parameter to `nil`.
	---The timeout you specify may not be respected by the system, particularly in
	---X11/Wayland environments, and Windows will always use a fixed, unspecified, duration.
	---The notification will persist on screen until dismissed or clicked, or until its timeout duration
	---elapses.
	toast_notification: function(self: Window, title: string, message: string): nil

	---@param title string
	---@param message string
	---@param url? string
	toast_notification: function(self: Window, title, message, url) end

	---@param title string
	---@param message string
	---@param url? string
	---@param timeout? integer
	toast_notification: function(self: Window, title, message, url, timeout) end

	---Toggles full screen mode for the window.
	toggle_fullscreen: function(self: Window): nil

	---Returns the ID number for the window.
	---The ID is used to identify the window within the internal multiplexer and can be used when
	---making API calls via the WezTerm CLI to indicate the subject of manipulation.
	window_id: function(self: Window): integer

	---Returns a string holding the top of the current key table activation stack, or `nil`
	---if the stack is empty.
	---See [Key Tables](https://wezterm.org/config/key-tables.html) for a detailed example.
	active_key_table: function(self: Window): string|nil|?
end
-- vim: set ts=2 sts=2 sw=2 et ai si sta:
