local _enums = require("_enums")
-- local _aliases = require("_aliases")
-- local _config = require("config")

local record _Shared
	type ColorSpec = _AnsiColor|_Color
	type StringMaker = function(): string
	type SearchParams = {_enums._SearchParamsKey: string}
    type NumberTriple = {number, number, number}
    type NumberQuadruple = {number, number, number, number}
	type Endo = function(cmd: SpawnCommand): SpawnCommand
	type SendString = function(params: string): _SendString
    type ScrollByPage = function(amount: number): _ScrollByPage
	type GradientOrientation = _enums._GradientOrientation|_Linear|_Radial
	type MouseEvent = {_enums._MouseEventName: MouseEventInfo}
	type ProgressNum = {_enums.ProgressType: integer}

    type PaneProgress = _enums.PaneProgressNamed|ProgressNum
	type SpawnTabDomain = _enums._SpawnTabDomain|_DomainId|_DomainName

	type CopyModeParams = _enums.CopyModeStr|BackwardJump|ForwardJump|BackwardJumpZone|ForwardJumpZone|PageMovement|SelectionModeSetter


	type EasingFunction               = _enums._EasingFunction|_CubicBezier
    type ActivateKeyTable             = function(params: ActivateKeyTableParams): _ActivateKeyTable
    type ActivatePaneByIndex          = function(params: integer): _ActivatePaneByIndex
    type ActivatePaneDirection        = function(params: _enums.PaneDirection): _ActivatePaneDirection
    type ActivateTab                  = function(params: integer): _ActivateTab
    type ActivateTabRelative          = function(params: integer): _ActivateTabRelative
    type ActivateTabRelativeNoWrap    = function(params: integer): _ActivateTabRelativeNoWrap
    type ActivateWindow               = function(params: integer): _ActivateWindow
    type ActivateWindowRelative       = function(params: integer): _ActivateWindowRelative
    type ActivateWindowRelativeNoWrap = function(params: integer): _ActivateWindowRelativeNoWrap
    type AdjustPaneSize               = function(params: _AdjustPaneSizeValue): _AdjustPaneSize
    type AttachDomain                 = function(domain: string): _AttachDomain
    type CharSelect                   = _CharSelect|function(params: CharSelectParams): _CharSelect
    type ClearScrollback              = function(params: _enums.ScrollbackEraseMode): _ClearScrollback
    type CloseCurrentPane             = function(params: _Confirm): _CloseCurrentPane
    type CloseCurrentTab              = function(params: _Confirm): _CloseCurrentTab
    type CompleteSelection            = function(params: _enums.ClipboardCopyDestination): _CompleteSelection
    type CompleteSelectionOrOpenLinkAtMouseCursor = function(params: _enums.ClipboardCopyDestination): _CompleteSelectionOrOpenLinkAtMouseCursor
    type Confirmation                 = function(params: ConfirmationParams): _Confirmation
    type CopyMode                     = function(params: CopyModeParams): _CopyMode
    type CopyTo                       = function(params: _enums.ClipboardCopyDestination): _CopyTo
    type CopyTextTo                   = function(params: CopyTextToParams): _CopyTextTo
    type DetachDomain                 = function(params: SpawnTabDomain): _DetachDomain
    type EmitEvent                    = function(event_id: string): _EmitEvent
    type ExtendSelectionToMouseCursor = function(params: _enums.SelectionMode): _ExtendSelectionToMouseCursor
    type InputSelector                = function(params: InputSelectorParams): _InputSelector
    type MoveTab                      = function(index: integer): _MoveTab
    type MoveTabRelative              = function(index: integer): _MoveTabRelative
    type Multiple                     = _Multiple|function(events: {Action}): _Multiple
    type OpenUri                      = function(uri: string): _OpenUri
    type PaneSelect                   = _PaneSelect|function(params: PaneSelectParams): _PaneSelect
    type PasteFrom                    = function(source: _enums.ClipboardPasteDestination): _PasteFrom
    type PromptInputLine              = function(params: PromptInputLineParams): _PromptInputLine
    type QuickSelectArgs              = _QuickSelectArgs|function(params: QuickSelectArgsParams): _QuickSelectArgs
    type RotatePanes                  = function(params: _enums.RotationDirection): _RotatePanes
    type ScrollByLine                 = function(amount: integer): _ScrollByLine

	type ScrollToPrompt               = function(amount: integer): _ScrollToPrompt
    type Search                       = function(params: _enums._CurrentSelectionOrEmptyString|SearchParams): _Search
    type SelectTextAtMouseCursor      = function(params: _enums.SelectionMode): _SelectTextAtMouseCursor
    type SendKey                      = function(params: SendKeyParams): _SendKey
    type SetPaneZoomState             = function(state: boolean): _SetPaneZoomState
    type SetWindowLevel               = function(level: _enums.SetWindowLevelParams): _SetWindowLevel
    type ShowLauncherArgs             = function(params: ShowLauncherArgsParams): _ShowLauncherArgs
    type SpawnCommandInNewTab         = _SpawnCommandInNewTab|function(params: SpawnCommand): _SpawnCommandInNewTab
    type SpawnCommandInNewWindow      = _SpawnCommandInNewWindow|function(params: SpawnCommand): _SpawnCommandInNewWindow
    type SpawnTabAction               = function(params: SpawnTabDomain): _SpawnTab
    type SplitHorizontal              = _SplitHorizontal|function(params: SpawnCommand): _SplitHorizontal
    type SplitPane                    = function(params: SplitPaneParams): _SplitPane
    type SplitVertical                = _SwitchToWorkspace|function(params: SpawnCommand): _SwitchToWorkspace
    type SwitchToWorkspace            = _SwitchToWorkspace|function(params: SwitchToWorkspaceParams): _SwitchToWorkspace
    type SwitchWorkspaceRelative      = function(params: integer): _SwitchWorkspaceRelative

    
	
	record Ribbon end --?

	type Action = string|number
	-- CORRECT VALUE: Actions|KeyAssignmentLiterals|CharSelect|Multiple|PaneSelect|QuickSelectArgs|SpawnCommandInNewTab|SpawnCommandInNewWindow|SplitHorizontal|SplitVertical|SwitchToWorkspace
	


	--[[
	global record Config
	--from docs: https://wezterm.org/config/lua/config/index.html

	adjust_window_size_when_changing_font_size
	allow_square_glyphs_to_overflow_width
	allow_win32_input_mode
	alternate_buffer_wheel_scroll_speed
	animation_fps
	anti_alias_custom_block_glyphs
	audible_bell
	automatically_reload_config
	background
	bold_brightens_ansi_colors
	bypass_mouse_reporting_modifiers
	canonicalize_pasted_newlines
	cell_width
	cell_widths
	char_select_bg_color
	char_select_fg_color
	char_select_font
	char_select_font_size
	check_for_updates
	clean_exit_codes
	color_schemes
	colors
	command_palette_bg_color
	command_palette_fg_color
	command_palette_font
	command_palette_font_size
	command_palette_line_height
	command_palette_rows
	cursor_blink_ease_in
	cursor_blink_ease_out
	cursor_blink_rate
	cursor_thickness
	custom_block_glyphs
	daemon_options
	debug_key_events
	default_cursor_style
	default_cwd
	default_domain
	default_gui_startup_args
	default_mux_server_domain
	default_prog
	default_ssh_auth_sock
	default_workspace
	detect_password_input
	disable_default_mouse_bindings
	disable_default_quick_select_patterns
	display_pixel_geometry
	dpi
	enable_csi_u_key_encoding
	enable_kitty_keyboard
	enable_scroll_bar
	enable_tab_bar
	enable_wayland
	exit_behavior
	exit_behavior_messaging
	font
	font_antialias
	font_dirs
	font_hinting
	font_locator
	font_rasterizer
	font_rules
	font_shaper
	font_size
	force_reverse_video_cursor
	foreground_text_hsb
	freetype_interpreter_version
	freetype_load_flags
	freetype_load_target
	freetype_pcf_long_family_names
	freetype_render_target
	front_end
	harfbuzz_features
	hide_mouse_cursor_when_typing
	hide_tab_bar_if_only_one_tab
	hyperlink_rules
	ime_preedit_rendering
	initial_cols
	initial_rows
	integrated_title_button_alignment
	integrated_title_button_color
	integrated_title_button_style
	integrated_title_buttons
	kde_window_background_blur
	key_map_preference
	key_tables
	launch_menu
	launcher_alphabet
	line_height
	log_unknown_escape_sequences
	macos_forward_to_ime_modifier_mask
	macos_fullscreen_extend_behind_notch
	macos_window_background_blur
	max_fps
	min_scroll_bar_height
	mouse_wheel_scrolls_tabs
	mux_enable_ssh_agent
	mux_env_remove
	native_macos_fullscreen_mode
	normalize_output_to_unicode_nfc
	notification_handling
	pane_focus_follows_mouse
	pane_select_font
	prefer_egl
	prefer_to_spawn_tabs
	quick_select_alphabet
	quick_select_patterns
	quick_select_remove_styling
	quit_when_all_windows_are_closed
	quote_dropped_files
	reverse_video_cursor_min_contrast
	scroll_to_bottom_on_input
	scrollback_lines
	selection_word_boundary
	serial_ports
	set_environment_variables
	show_close_tab_button_in_tabs
	show_new_tab_button_in_tab_bar
	show_tab_index_in_tab_bar
	show_tabs_in_tab_bar
	show_update_window
	skip_close_confirmation_for_processes_named
	ssh_backend
	ssh_domains
	status_update_interval
	strikethrough_position
	swallow_mouse_click_on_pane_focus
	swallow_mouse_click_on_window_focus
	swap_backspace_and_delete
	switch_to_last_active_tab_when_closing_tab
	tab_and_split_indices_are_zero_based
	tab_bar_at_bottom
	tab_bar_style
	tab_max_width
	term
	text_blink_ease_in
	text_blink_ease_out
	text_blink_rapid_ease_in
	text_blink_rapid_ease_out
	text_blink_rate
	text_blink_rate_rapid
	text_min_contrast_ratio
	tiling_desktop_environments
	tls_clients
	tls_servers
	treat_east_asian_ambiguous_width_as_wide
	treat_left_ctrlalt_as_altgr
	ui_key_cap_rendering
	ulimit_nofile
	ulimit_nproc
	underline_position
	underline_thickness
	unicode_version
	unix_domains
	unzoom_on_switch_pane
	use_cap_height_to_scale_fallback_fonts
	use_fancy_tab_bar
	use_ime
	use_resize_increments
	visual_bell
	warn_about_missing_glyphs
	wayland_window_background_blur
	webgpu_force_fallback_adapter
	webgpu_power_preference
	webgpu_preferred_adapter
	win32_acrylic_accent_color
	win32_system_backdrop
	window_background_gradient
	window_background_image
	window_background_image_hsb
	window_background_opacity
	window_close_confirmation
	window_content_alignment
	window_decorations
	window_frame
	window_padding
	wsl_domains
	xim_im_name
	end
	]]

		
	---The `return` statement at the end of your `wezterm.lua` file returns a table that is interpreted
	---as the internal `Config` struct type.
	---```lua
	---local wezterm = require("wezterm") ---@type Wezterm
	---local config = wezterm.config_builder()
	----- YOUR CONFIG TWEAKS
	---return config
	---```
	------
	---At the time of writing, it is not a complete list. Mirrors `Config` in upstream WezTerm:
	---https://github.com/wezterm/wezterm/blob/main/config/src/config.rs
	record Config
		---Control whether changing the font size adjusts the dimensions of the window (`true`)
		---or adjusts the number of terminal rows/columns (`false`).
		---If you use a tiling window manager then you may wish to set this to `false`.
		---The default value is now `nil` which causes wezterm to match the name of the connected
		---window environment, which you can see if you open the debug overlay, against the list of
		---known tiling environments configured by `config.tiling_desktop_environments`.
		---If the environment is known to be tiling then the effective value of
		---`config.adjust_window_size_when_changing_font_size` is `false`, and `true` if otherwise.
		---See also:
		--- - [DecreaseFontSize](https://wezterm.org/config/lua/keyassignment/DecreaseFontSize.html)
		--- - [IncreaseFontSize](https://wezterm.org/config/lua/keyassignment/IncreaseFontSize.html)
		--- - [`config.tiling_desktop_environments`](lua://Config.tiling_desktop_environments)
		adjust_window_size_when_changing_font_size: boolean | nil
		allow_download_protocols: boolean | nil
		---Configures how square symbol glyph's cell is rendered:
		--- - `"Always"`: Overflow the cell regardless of the next cell being a space
		--- - `"Never"`: Strictly respect the cell width
		--- - `"WhenFollowedBySpace"`: (default) Deliberately overflow the cell width when
		---                          the next cell is a space
		---This setting now applies to any glyph with an aspect ratio larger than `0.9`,
		---which covers more symbol glyphs than in earlier releases.
		allow_square_glyphs_to_overflow_width: _enums.AllowSquareGlyphs | nil
		---When set to `true`, wezterm will honor an escape sequence generated by
		---the Windows ConPTY layer to switch the keyboard encoding to a proprietary scheme
		---that has maximum compatibility with win32 console applications.
		---The default is `true`.
		---See also [Improved Keyboard Handling in ConPTY](https://github.com/microsoft/terminal/blob/main/doc/specs/%234999%20-%20Improved%20keyboard%20handling%20in%20Conpty.md).
		---@field allow_win32_input_mode? boolean
		---Normally the vertical mouse wheel will scroll the terminal viewport so that different sections
		---of the scrollback are visible.
		---When an application activates the _Alternate Screen Buffer_ (this is common for "full screen"
		---terminal programs such as pagers and editors), the alternate screen doesn't have a scrollback.
		---In this mode, if the application hasn't enabled mouse reporting, WezTerm will generate
		---`Arrow Up` / `Arrow Down` key events when the vertical mouse wheel is scrolled.
		---`config.alternate_buffer_wheel_scroll_speed` specifies how many arrow key presses are generated
		---by a single scroll wheel "tick".
		---The default for this value is `3`, meaning a single _wheel up_ "tick" will appear to
		---the application as though the user pressed `Arrow Up` three times in quick succession.
		alternate_buffer_wheel_scroll_speed: integer | nil
		---This setting controls the maximum frame rate used when rendering easing effects
		---for blinking cursors, blinking text and visual bell. Setting it larger will result in
		---smoother easing effects, but will increase GPU usage.
		---If you are running with a CPU renderer (e.g. you have `config.front_end` set to `"Software"`,
		---or your system doesn't have a GPU), then setting this option to `1` is recommended,
		---as doing so will disable easing effects and instead will use transitions.
		---```lua
		---config.animation_fps = 1
		---config.cursor_blink_ease_in = "Constant"
		---config.cursor_blink_ease_out = "Constant"
		---```
		---See:
		--- - [`config.front_end`](lua://Config.front_end)
		animation_fps: integer | nil
		---Controls whether the glyphs set in `config.custom_block_glyphs` are rendered
		---using anti-aliasing or not.
		---Anti-aliasing makes lines look smoother but may not look so nice at smaller font sizes.
		---See:
		--- - [`config.custom_block_glyphs`](lua://Config.custom_block_glyphs)
		anti_alias_custom_block_glyphs: boolean | nil
		---When the BEL ascii sequence is sent to a pane, the bell is "rung" in that pane.
		---You may choose to configure the audible_bell option to change the sound that WezTerm
		---makes when the bell rings.
		---The follow are possible values:
		--- - `"Disabled"`: Don't make a sound
		--- - `"SystemBeep"`: Perform the system beep or alert sound. This is the default.
		---                 On Wayland systems, which have no system beep function,
		---                 it won't produce a sound
		---See also:
		--- - [`config.visual_bell`](lua://Config.visual_bell)
		--- - [Bell Event](https://wezterm.org/config/lua/window-events/bell.html)
		audible_bell: _enums.AudibleBell | nil
		---When `true`, watch the config file and reload it automatically when changes are detected.
		automatically_reload_config: boolean | nil
		---The `config.background` option allows you to compose a number of layers to produce
		---the background content in the terminal.
		---Layers can be image files, gradients or solid blocks of color. Layers composite over
		---each other based on their alpha channel. Images in layers can be made to fill the viewport
		---or to tile, and also to scroll with optional parallax as the viewport is scrolled.
		---This option is a table that lists the desired layers starting with the deepest/back-most layer.
		---Subsequent layers are composited over the top of preceding layers.
		background: {BackgroundLayer} | nil
		bidi_direction: _enums.BidiDirection | nil
		bidi_enabled: boolean | nil
		---When `true` (the default), PaletteIndex 0-7 are shifted to **bright**
		---when the font intensity is bold.
		---This brightening effect doesn't occur when the text is set to the default foreground color.
		---This defaults to `true` for better compatibility with software; for instance,
		---a lot of software assumes that `Black+Bold` renders as a `Dark Grey`, which is legible
		---on a `Black` background, but if this option is set to `false`, it would render as
		---`Black on Black`.
		---This option can also have one of three `string` values:
		--- - `"BrightAndBold"`: The _bold_ attribute will select a bright version
		---                    of palette indices (`0-7`) and preserve the _bold_ attribute
		---                    on the text, using both a bold font and a brighter color
		--- - `"BrightOnly"`: The _bold_ attribute will select a bright version
		---                 of palette indices (`0-7`), but the intensity will be
		---                 treated as _normal_ and a non-bold font will be used
		---                 for the text
		--- - `"No"`: The _bold_ attribute will not influence palette selection
		---You may use `true` or `false` for backwards compatibility.
		---`true` is equivalent to `"BrightAndBold"`, while `false` is equivalent to `"No"`.
		enum _BoldStyle
			"No"
			"BrightAndBold"
			"BrightOnly"
		end
		bold_brightens_ansi_colors: _BoldStyle|boolean|nil
		---If an application has enabled mouse reporting mode, mouse events are sent directly
		---to the application, and do not get routed through the mouse assignment logic.
		---Holding down the `config.bypass_mouse_reporting_modifiers` modifier key(s)
		---will prevent the event from being passed to the application.
		---The default value for `config.bypass_mouse_reporting_modifiers` is `"SHIFT"`,
		---which means that holding down shift while clicking will not send the mouse event to,
		---e.g. _vim running in mouse mode_, and will instead treat the event as though `"SHIFT"`
		---was not pressed and then match it against the mouse assignments.
		bypass_mouse_reporting_modifiers: _enums.Modifiers | nil
		---Controls whether pasted text will have newlines normalized.
		---If bracketed paste mode is enabled by the application the effective value
		---of this configuration option is `"None"`.
		enum _NewlineStyle
			"None"
			"LineFeed"
			"CarriageReturn"
			"CarriageReturnAndLineFeed"
		end
		canonicalize_pasted_newlines: _NewlineStyle|boolean|nil
		---Scales the computed cell width to adjust the spacing between successive cells of text.
		---If possible, you should prefer to specify the stretch parameter when selecting a font
		---using either `wezterm.font()` or `wezterm.font_with_fallback()`, as that will generally
		---look better and have fewer undesirable side effects.
		---If your preferred font doesn't have variations with different stretches,
		---or if the font spacing still doesn't look right to you, then `config.cell_width`
		---gives you a simple way to influence the spacing.
		---The default cell width is indirectly controlled by the `config.font` and `config.font_size`
		---configuration options. The selected font and font size controls the height of the font,
		---while the font designer controls the aspect ratio of the glyphs in the font.
		---The base font (the first font resolved from `config.font`) defines the cell metrics
		---for the terminal display grid. Those metrics are then then used to place glyphs, regardless of
		---which fallback font might be resolved for a given glyph.
		---If you feel that your chosen font feels too horizontally cramped then you can set this
		---to `1.2` to increase the horizontal spacing by `20%`. Conversely, setting this to `0.9`
		---will decrease the horizontal spacing by `10%`.
		---This option doesn't adjust the rasterized width of glyphs, it just changes what WezTerm
		---considers  to be the cell boundaries. When rendering _monospace_, WezTerm advances
		---by the cell width to place successive glyphs.
		---If you set the scale less than `1.0` then the glyphs won't be truncated or squished,
		---rather they will render on top of each other. Conversely, if you set the scale
		---to greater than `1.0`, the glyphs won't be stretched but will render further apart
		---from each other.
		---Changing `config.cell_width` doesn't adjust the positioning of the glyph within the cell;
		---it remains at its usual x-position. It is not centered within the adjusted space. Doing so
		---may have undesirable consequences, particularly for fonts that use ligatures.
		---Depending on the font, you may find that some ligatured sequences are misaligned
		---or render strangely. **This is not a bug**: the font is designed to be rendered with a
		---`config.cell_width` value of `1.0`, so running with a different value will have
		---this sort of side effect.
		---See also:
		--- - [`config.font_size`](lua://Config.font_size)
		--- - [`config.font`](lua://Config.font)
		--- - [`config.line_height`](lua://Config.line_height)
		--- - [`wezterm.font()`](lua://Wezterm.font)
		--- - [`wezterm.font_with_fallback()`](lua://Wezterm.font_with_fallback)
		cell_width: number | nil

		---The character width recommended by the Unicode standard is occasionally inconsistent
		---and may not align with linguistic tradition.
		--- - circled numbers width: ⓪①..⑳㉑
		--- - lowercase Roman numerals width: ⅹⅺⅻ
		--- - Nerd Font (Private Use Area) character width
		--- - ambiguous character width for CJK text
		--- - square emojis defined as EAW=Neutral
		---The `config.cell_widths` configuration parameter allows users to override
		---the default character width.
		---[Nerd Font](https://www.nerdfonts.com/) has square glyphs and is an example of half advance width.
		---Below is a configuration example that treats these character widths as full-width:
		---```lua
		---config.cell_widths = {
		---  { first = 0xe000, last = 0xf8ff, width = 2 },
		---  { first = 0xf0000, last = 0xf1fff, width = 2 },
		---}
		---```
		---This setting takes priority over `config.treat_east_asian_ambiguous_width_as_wide`.
		---Note that changing this setting may have consequences for layout in text UI applications
		---if their expectation of width differs from your choice of configuration.
		---For example, Vim has a built-in function [`setcellwidths()`](https://vimhelp.org/builtin.txt.html#setcellwidths%28%29),
		---and shells like Bash or Zsh determine character width based on the `glibc` locale.
		---See also:
		--- - [`config.treat_east_asian_ambiguous_width_as_wide`](lua://Config.treat_east_asian_ambiguous_width_as_wide)
		cell_widths: {CellWidth} | nil
		---Specifies the background color used by [`CharSelect`](https://wezterm.org/config/lua/keyassignment/CharSelect.html).
		char_select_bg_color: string | nil
		---Specifies the text color used by [`CharSelect`](https://wezterm.org/config/lua/keyassignment/CharSelect.html).
		char_select_fg_color: string | nil
		---Configures the font to use for character selection.
		---The `config.char_select_font` setting can specify a set of fallbacks and other options.
		---It is described in more detail in the [Fonts](https://wezterm.org/config/fonts.html) section.
		---If not specified, the font is same as the font in `config.window_frame.font`.
		---You will typically use either `wezterm.font()` or `wezterm.font_with_fallback()`
		---to specify the font.
		---See:
		--- - [`config.window_frame.font`](lua://WindowFrameConfig.font)
		--- - [`wezterm.font_with_fallback()`](lua://Wezterm.font_with_fallback)
		--- - [`wezterm.font()`](lua://Wezterm.font)
		char_select_font: TextStyle | nil
		---Specifies the size of the font used with [`CharSelect`](https://wezterm.org/config/lua/keyassignment/CharSelect.html).
		char_select_font_size: number | nil
		---Wezterm checks regularly if there is a new stable version available on GitHub,
		---and shows a simple UI to let you know about the update.
		---Set this option to `false` to disable this completely.
		---**NO DATA IS COLLECTED FOR THE WEZTERM PROJECT.**
		---For more info abouh controlling this UI, see:
		--- - [`config.show_update_window`](lua://Config.show_update_window)
		check_for_updates: boolean | nil
		---By default it is checked once every 24 hours.
		---You may change this option for an alternative update interval.
		check_for_updates_interval_seconds: integer | nil
		---Defines the set of exit codes that are considered to be a "clean" exit by `config.exit_behavior`
		---when the program running in the terminal completes.
		---Acceptable values are an array of integer exit codes that you wish to treat as successful.
		---For example, if you often `CTRL-C` a program and then `CTRL-D`, `bash` will typically exit
		---with status `130` to indicate that a program was terminated with `SIGINT`,
		---but that `bash` itself wasn't. In that situation you may wish to set this config
		---to treat `130` as `OK`:
		---```lua
		---config.clean_exit_codes = { 130 } --- `OK`
		---```
		---Note that `0` is always treated as a clean exit code and can be omitted from the list.
		---See:
		--- - [`config.exit_behavior`](lua://Config.exit_behavior)
		clean_exit_codes: {integer} | nil
		---The color scheme to be used.
		---For more info, see:
		--- - [Colors & Appearance](https://wezterm.org/config/appearance.html)
		color_scheme: string|nil --Colorschemes
		---If you wish to place your color scheme files in some other location, then you will need
		---to instruct wezterm where to look for your scheme files. The `config.color_scheme_dirs` setting
		---specifies a list of directories to be searched:
		---```lua
		---config.color_scheme_dirs = { '/some/path/to/my/color/schemes' }
		---```
		---Color scheme names that are defined in files in `config.color_scheme_dirs` take precedence
		---over the built-in color schemes.
		color_scheme_dirs: {string} | nil
		---Specifies various named color schemes in your configuration file.
		---Described in more detail in [Colors & Appearance](https://wezterm.org/config/appearance.html).
		color_schemes: {string, Palette}|nil
		---Specifies the color palette.
		---Described in more detail in [Colors & Appearance](https://wezterm.org/config/appearance.html).
		colors: Palette | nil
		---Specifies the background color used by `ActivateCommandPalette`.
		---See:
		--- - [`ActivateCommandPalette`](https://wezterm.org/config/lua/keyassignment/ActivateCommandPalette.html)
		command_palette_bg_color: string | nil
		---Specifies the text color used by `ActivateCommandPalette`.
		---See:
		--- - [`ActivateCommandPalette`](https://wezterm.org/config/lua/keyassignment/ActivateCommandPalette.html)
		command_palette_fg_color: string | nil
		---Configures the font to use for command palette.
		---The `config.command_palette_font` setting can specify a set of fallbacks and other options,
		---and is described in more detail in the [Fonts](https://wezterm.org/config/fonts.html) section.
		---If not specified, the font is same as the font in `config.window_frame.font`.
		---You will typically use `wezterm.font()` or `wezterm.font_with_fallback()` to specify the font.
		---To specify `config.command_palette_font`:
		---```lua
		---config.command_palette_font = wezterm.font 'Roboto'
		---```
		---See:
		--- - [`config.window_frame.font`](lua://WindowFrameConfig.font)
		--- - [`wezterm.font()`](lua://Wezterm.font)
		--- - [`wezterm.font_with_fallback()`](lua://Wezterm.font_with_fallback)
		command_palette_font: TextStyle | nil
		---Specifies the size of the font used with `ActivateCommandPalette`.
		---See:
		--- - [`ActivateCommandPalette`](https://wezterm.org/config/lua/keyassignment/ActivateCommandPalette.html)
		command_palette_font_size: number | nil
		---Specifies the number of rows displayed by the command palette.
		---If unset or `nil`, a default value based on the terminal display will be used.
		---See:
		--- - [`ActivateCommandPalette`](https://wezterm.org/config/lua/keyassignment/ActivateCommandPalette.html)
		command_palette_rows: integer | nil
		---Specifies the easing function to use when computing the color for the text cursor
		---when it is set to a blinking style.
		---For more information about easing functions, see:
		--- - [`config.visual_bell`](lua://Config.visual_bell)
		cursor_blink_ease_in: EasingFunction | nil
		---Specifies the easing function to use when computing the color for the text cursor
		---when it is set to a blinking style.
		---For more information about easing functions, see:
		--- - [`config.visual_bell`](lua://Config.visual_bell)
		cursor_blink_ease_out: EasingFunction | nil
		---Specifies how often a blinking cursor transitions between _visible_ and _invisible_,
		---expressed in milliseconds.
		---Setting this to `0` disables blinking.
		---Note that this value is approximate due to the way that the system event loop schedulers
		---manage timers; non-zero values will be at least the interval specified with some degree of slop.
		---Note: It is recommended to avoid blinking cursors when on battery power, as it is
		---relatively costly to keep re-rendering for the blink.
		cursor_blink_rate: integer | nil
		---If specified, overrides the base thickness of the lines used to render the textual cursor glyph.
		---The default is to use `config.underline_thickness`.
		---This config option accepts different units that have slightly different interpretations:
		--- - `2`, `2.0` or `"2px"`: All specify a thickness of 2 pixels
		--- - `"2pt"`: Specifies a thickness of `2` points, which scales according to
		---          the DPI of the window
		--- - `"200%"`: Takes the value of
		---           [`config.underline_thickness`](lua://Config.underline_thickness)
		---           and multiplies it by `2` to arrive
		---           at a thickness double the normal size
		--- - `"0.1cell"`: takes the cell height, scales it by `0.1`
		---              and uses that as the thickness
		---See:
		--- - [`config.underline_thickness`](lua://Config.underline_thickness)
		cursor_thickness: number|nil|string
		---When set to `true` (the default), WezTerm will compute its own idea of what the glyphs
		---in the following unicode ranges should be, instead of using glyphs resolved from a font.
		---Ideally this option wouldn't exist, but it is present to work around a [hinting issue in freetype](https://gitlab.freedesktop.org/freetype/freetype/-/issues/761).
		---You can set this to `false` to use the block characters provided by your font selection.
		custom_block_glyphs: boolean | nil
		---Allows configuring the multiplexer (mux) server and how it places itself into the background
		---to run as a daemon process.
		---You should not normally need to configure this setting; the defaults should be sufficient
		---in most cases.
		---There are three fields supported:
		--- - `pid_file`: Specifies the location of the `PID` and lock file.
		---             The default location is `$XDG_RUNTIME_DIR/wezterm/pid` on X11/Wayland systems,
		---             or `$HOME/.local/share/wezterm/pid`
		--- - `stdout`: Specifies where a log of the `stdout` stream from the daemon will be placed.
		---           The default is `$XDG_RUNTIME_DIR/wezterm/stdout` on X11/Wayland systems,
		---           or `$HOME/.local/share/wezterm/stdout`
		--- - `stderr`: Specifies where a log of the `stderr` stream from the daemon will be placed.
		---           The default is `$XDG_RUNTIME_DIR/wezterm/stderr` on X11/Wayland systems,
		---           or `$HOME/.local/share/wezterm/stderr`
		daemon_options: DaemonOptions | nil
		---When set to `true`, each key event will be logged by the GUI layer as an `INFO` level
		---log message on the `stderr` stream from WezTerm.
		---You will typically need to launch WezTerm directly from another terminal to see this logging.
		---This can be helpful in figuring out how keys are being decoded on your system, or for
		---discovering the system-dependent "raw" key code values.
		debug_key_events: boolean | nil
		---Specifies the default cursor style.
		---Various escape sequences can override the default style in different situations
		---(e.g. an editor can change it depending on the mode), but this value controls how the cursor
		---appears when it is reset to default.
		---Acceptable values are:
		--- - `"BlinkingBar"`
		--- - `"BlinkingBlock"`
		--- - `"BlinkingUnderline"`
		--- - `"SteadyBar"`
		--- - `"SteadyBlock"` (default)
		--- - `"SteadyUnderline"`
		default_cursor_style: _enums.DefaultCursorStyle | nil
		---Specifies the default current working directory if none is specified through configuration
		---or OSC 7.
		default_cwd: string | nil
		---Note: This option only applies to the GUI.
		---For the equivalent option in the standalone mux server, see
		--- - [`config.default_mux_server_domain`](lua://Config.default_mux_server_domain)
		------
		---When starting the GUI (not using the serial or connect subcommands), by default WezTerm
		---will set the built-in `"local"` domain as the default multiplexing domain.
		---The `"local"` domain represents processes that are spawned directly on the local system.
		---Windows users, particularly those who use WSL, may wish to override the default domain to
		---instead use a particular WSL distribution so that wezterm launches directly into a Linux shell
		---rather than having to manually invoke `wsl.exe`. Using a `WslDomain` for this has the advantage
		---that WezTerm can then use [shell integration](https://wezterm.org/shell-integration.html) to track
		---the current directory inside WSL and use it when splitting new panes or spawning new tabs.
		---See:
		--- - [`Wsldomain`](lua://WslDomain)
		default_domain: string | nil
		---When launching the GUI using either `wezterm` or `wezterm-gui`
		---(with no subcommand explicitly specified), WezTerm will use the value
		---of `config.default_gui_startup_args` to pick a default mode for running the GUI.
		---The default for this config is `{ "start" }` which makes `wezterm` with no additional
		---subcommand arguments equivalent to `wezterm start`.
		---If you always want to use wezterm's ssh client to login to a particular host,
		---then you might consider using this configuration:
		---```lua
		---config.default_gui_startup_args = { "ssh", "some-host" }
		---```
		---which will cause `wezterm` with no additional subcommand arguments to be equivalent
		---to running `wezterm ssh some-host`.
		---_Specifying subcommand arguments on the command line is **NOT** additive with this config;
		---the command line arguments always take precedence._
		---Depending on your desktop environment, you may find it simpler to use your operating system
		---shortcut or alias function to set up a shortcut that runs the subcommand you desire.
		
		enum _StartLiteral
			"start"
		end
		default_gui_startup_args: string|{_StartLiteral}|nil --TODO: check second variant
		---**Note: This option only applies to the standalone mux server.**
		---For the equivalent option in the GUI, see:
		--- - [`config.default_domain`](lua://Config.default_domain).


		--- ---
		---When starting the mux server, by default wezterm will set the built-in `"local"` domain
		---as the default multiplexing domain. The `"local"` domain represents processes that are
		---spawned directly on the local system.
		---This option allows you to change the default domain to some other domain, such as an `ExecDomain`.
		---It is not possible to configure a client multiplexing domain such as a TLS, SSH or UNIX domain
		---as the default for the multiplexer server. That is prohibited in order to prevent recursion
		---when a client connects to the server.
		---See:
		--- - [`ExecDomain`](lua://ExecDomain)
		default_mux_server_domain: string | nil
		---If no `prog` is specified on the command line, use this instead of running the user's shell.
		---`config.default_prog` is implemented as an array where the 0th element is the command to run
		---and the rest of the elements are passed as the positional arguments to that command.
		default_prog: {string} | nil
		---Setting this value will cause wezterm to replace the the value of the `SSH_AUTH_SOCK` environment
		---when it first starts up, and to use this value for the auth socket registered
		---with the multiplexer server (visible via `wezterm cli list-clients`).
		---You won't normally need to set this, but if you are running with an alternative identity agent
		---and wish to replace the default on your system, this gives you that ability.
		default_ssh_auth_sock: string | nil
		---Specifies the name of the default workspace.
		---The default value is `"default"`.
		default_workspace: string | nil --"default"
		---When set to `true`, on UNIX systems, for local panes,
		---WezTerm will query the _termios_ associated with the PTY to see
		---whether local echo is disabled and canonical input is enabled.
		---If those conditions are met, then the text cursor will be changed
		---to a lock to give a visual cue that what you type will not
		---be echoed to the screen.
		---This technique only works for local processes on UNIX systems,
		---and will not work through other processes that themselves use PTYs.
		---Most notably, this will not work with `tmux` or remote processes
		---spawned via `ssh`.
		detect_password_input: boolean | nil
		disable_default_key_bindings: boolean | nil
		---If set to `true`, the default mouse assignments will not be used, allowing you
		---to tightly control those assignments.
		disable_default_mouse_bindings: boolean | nil
		---When set to `true`, the default set of quick select patterns are omitted, and
		---`config.quick_select_patterns` specifies the total set of patterns used for quick select mode.
		---Defaults to `false`.
		---See:
		--- - [`config.quick_select_patterns`](lua://Config.quick_select_patterns)
		disable_default_quick_select_patterns: boolean | nil
		---Configures whether subpixel anti-aliasing should produce either `"RGB"` or `"BGR"` ordered output.
		---If your display has a `BGR` pixel geometry then you will want to set this to `"BGR"`
		---for the best results when using subpixel antialiasing.
		---The default value is `"RGB"`.
		display_pixel_geometry: _enums.DisplayPixelGeometry | nil
		---Override the detected DPI (_dots per inch_) for the display.
		---This can be useful if the detected DPI is inaccurate and the text appears either blurry
		---or too small, particularly if you are using a 4K display on either X11 or Wayland.
		---The default value is system specific:
		-- | OS      | Standard Density        | High Density            |
		-- |------	|----------------------	|----------------------	|
		-- | macOS   | `72.0`                  | `144.0`                 |
		-- | Windows | Probed from the display | Probed from the display |
		-- | X11     | `96.0`                  | `96.0`                  |
		-- | Wayland | `96.0`                  | `192.0`                 |
		---In macOS and Wayland environments there isn't strictly a system DPI value that can be queried;
		---instead standard density has a fixed value and the system will inform WezTerm when the display
		---is high density by communicating a scaling factor for the display.
		---The Wayland protocol only allows for integer scaling factors, but some compositors support
		---fractional scaling. That fractional scaling can result in blurry text and you may wish
		---to specify a DPI value to compensate.
		---On macOS the scaling factor changes based on the monitor on which the window is displayed;
		---dragging the window from a retina laptop display to an external standard DPI display
		---causes the window to automatically adjust to the DPI scaling.
		---Microsoft Windows reports the true DPI for the monitor on which the window is displayed,
		---and will similarly adjust as the window is dragged between monitors.
		---**DPI is poorly supported by X11 itself**. While it is possible to query the displays
		---to determine their dimensions, the results are generally inaccurate.
		---It is common for X11 environments to publish an `Xft.dpi` value as a property
		---of the root window as a hint for the DPI of the display. While that is a reasonable workaround
		---for a single-monitor system, it isn't ideal for a multi-monitor setup where the monitors
		---have varying DPIs.
		dpi: number | nil
		dpi_by_screen: {string, number} | nil
		---When set to `true`, the [keyboard encoding](https://wezterm.org/config/key-encoding.html) will be changed
		---to use the scheme that is [described here](http://www.leonerd.org.uk/hacks/fixterms/).
		---It is not recommended to enable this option as it does change the behavior of some keys
		---in backwards incompatible ways and there isn't a way for applications to detect or request
		---this behavior.
		---The default for this option is `false`.
		---`config.allow_win32_input_mode` takes precedence over this option.
		---See:
		--- - [`config.allow_win32_input_mode`](lua://Config.allow_win32_input_mode)
		enable_csi_u_key_encoding: boolean | nil
		enable_kitty_graphics: boolean | nil
		---When set to `true`, wezterm will honor `kitty` keyboard protocol escape sequences that modify
		---the [keyboard encoding](https://wezterm.org/config/key-encoding.html).
		enable_kitty_keyboard: boolean | nil
		---Enable the scrollbar.
		---**This is currently disabled by default.** It will occupy the right window padding space.
		---If right padding is set to `0` then it will be increased to a single cell width.
		enable_scroll_bar: boolean | nil
		---Controls whether the tab bar is enabled.
		---Set it to `false` to disable it.
		enable_tab_bar: boolean | nil
		---Whether the terminal should respond to requests to read the title string.
		---Disabled by default for security concerns with shells that might otherwise attempt
		---to execute the response. More info [here](https://marc.info/?l=bugtraq&m=104612710031920&w=2).
		enable_title_reporting: boolean | nil
		---If `false`, do not try to use a Wayland protocol connection when starting the GUI frontend,
		---and instead use X11.
		---This option is only considered on X11/Wayland systems and has no effect on macOS or Windows.
		---The default is `true`.
		enable_wayland: boolean | nil
		enable_zwlr_output_manager: boolean | nil
		enq_answerback: string | nil
		---An array of `ExecDomain` tables.
		---For more info read the [`ExecDomain`](https://wezterm.org/config/lua/ExecDomain.html) docs.
		exec_domains: {ExecDomain }| nil
		---Controls the behavior when the shell program spawned by the terminal exits.
		---There are three possible values:
		--- - `"Close"`: Close the corresponding pane as soon as the program exits
		--- - `"Hold"`: Keep the pane open after the program exits.
		---           The pane must be manually closed via [`CloseCurrentPane`](https://wezterm.org/config/lua/keyassignment/CloseCurrentPane.html),
		---           [`CloseCurrentTab`](https://wezterm.org/config/lua/keyassignment/CloseCurrentTab.html) or closing the window
		--- - `"CloseOnCleanExit"`: if the shell program exited with a successful status,
		---                       behave like `"Close"`. Otherwise, behave like `"Hold"`
		---Note that most UNIX shells will exit with the status of the last command that it ran
		---if you don't specify an exit status.
		---For example, if you interrupt a command and then use `exit` (with no arguments),
		---or `CTRL-D` to send `EOF` to the shell, it will return an unsuccessful exit status.
		---The same thing holds if you were to run:
		---```sh
		---$ false
		---$ exit
		---```
		---The default is `"Close"`.
		---For fine tuning what is considered to be a clean exit status, see also:
		--- - [`config.clean_exit_codes`](lua://Config.clean_exit_codes)
		exit_behavior: _enums.ExitBehavior | nil
		---Controls how wezterm indicates the exit status of the spawned process in a pane
		---when it terminates.
		---`config.exit_behavior` being set to keep the pane open after the process has completed,
		---WezTerm will display a message to let you know that it has finished.
		---This option controls that message.
		---It can have one of the following values:
		--- - `"Verbose"`: Shows 2-3 lines of explanation, including the process name,
		---              its exit status and a link to the exit_behavior documentation
		--- - `"Brief"`: Like "Verbose", but the link to the documentation is not included
		--- - `"Terse"`: A very short indication of the exit status is shown in square brackets
		--- - `"None"`: No message is shown
		---In earlier versions of wezterm, this was not configurable and behaved equivalently
		---to the `"Verbose"` setting.
		---Examples can be found [here](https://wezterm.org/config/lua/config/exit_behavior_messaging.html).
		---See:
		--- - [`config.exit_behavior`](lua://Config.exit_behavior)
		exit_behavior_messaging: _enums.ExitBehaviorMessaging | nil
		experimental_pixel_positioning: boolean | nil
		---Configures the font to use by default.
		---The font setting can specify a set of fallbacks and other options, and is described
		---in more detail in the [Fonts](https://wezterm.org/config/fonts.html) section.
		---You will typically use `wezterm.font()` or `wezterm.font_with_fallback()` to specify the font.
		---See:
		--- - [`wezterm.font()`](lua://Wezterm.font)
		--- - [`wezterm.font_with_fallback()`](lua://Wezterm.font_with_fallback)
		font: TextStyle | nil
		font_colr_rasterizer: _enums.FontRasterizer | nil
		---By default, wezterm will use an appropriate system-specific method
		---for locating the fonts that you specify using the options below.
		---Additionally, if you configure the `config.font_dirs` option,
		---wezterm will load fonts from that set of directories:
		---```lua
		----- This tells wezterm to look first for fonts in the directory named
		----- `fonts` that is found alongside your `wezterm.lua` file.
		----- As this option is an array, you may list multiple locations if
		----- you wish.
		---config.font_dirs = { 'fonts' }
		---```
		---`wezterm` will scan the `config.font_dirs` to build a database
		---of available fonts.
		---When resolving a font, wezterm will first use the configured
		---[`config.font_locator`](lua://Config.font_locator),
		---which is typically the system specific font resolver.
		---If the system doesn't resolve the requested font, the fonts
		---from `config.font_dirs` are searched for a match.
		---If you want to only find fonts from `config.font_dirs`,
		---perhaps because you have a self-contained wezterm config
		---that you carry around with you between multiple systems
		---and don't want to install those fonts on every system that you use,
		---then you can set:
		---```lua
		---config.font_locator = 'ConfigDirsOnly'
		---```
		font_dirs: {string} | nil
		---Specifies the method by which system fonts are located and loaded.
		---You may specify `"ConfigDirsOnly"` to disable loading system fonts
		---and use only the fonts found in the directories that you specify in your
		---[`config.font_dirs`](lua://Config.font_dirs)
		---configuration option.
		---Otherwise, it is recommended to omit this setting.
		font_locator: Config | _enums.FontLocator | nil
		---Specifies the method by which fonts are rendered on screen.
		---Possible values are `"FreeType"` and `"Harfbuzz"`.
		font_rasterizer: _enums.FontRasterizer | nil
		---When textual output in the terminal is styled with `bold`, `italic`
		---or other attributes, wezterm uses `config.font_rules` to decide
		---how to render that text.
		---Most users won't need to specify any explicit value for `config.font_rules`,
		---as the defaults should be sufficient.
		---By default, unstyled text will use the font specified by
		---the font configuration, and wezterm will use that as a base,
		---and then automatically generate appropriate `config.font_rules`
		---that use heavier weight fonts for bold text,
		---lighter weight fonts for dim text and italic fonts for italic text.
		---If you have some unusual fonts or mixtures of fonts
		---that you'd like to use, such as using your favourite
		---monospace font for the base and a fancy italic font
		---from a different font family for italics,
		---then `config.font_rules` will allow you to do so.
		---`config.font_rules` is comprised of a list of rule entries with fields
		---that are split into matcher fields and action fields.
		---Matcher fields specify which textual attributes you want to match on,
		---while action fields specify how you want to render them
		---If a matcher field is omitted, then the associated attribute
		---has no impact on the match: the rule doesn't care about that attribute
		---and will match based on the attributes that were listed.
		---See:
		--- - [`FontRules`](lua://FontRules).
		font_rules: {FontRules} | nil
		---Specifies the method by which text is mapped to glyphs
		---in the available fonts.
		---The shaper is responsible for handling kerning, ligatures
		---and emoji composition.
		---Possible values are `"Harfbuzz"` and `"Allsorts"`.
		font_shaper: _enums.FontShaper | nil
		---Specifies the size of the font, measured in points.
		---You may use fractional point sizes, such as `13.3`,
		---to fine tune the size.
		---The default font size is `12.0` points.
		font_size: number | nil
		---When `true` it'll override the `cursor_fg`, `cursor_bg`
		---and `cursor_border` settings from the color scheme and
		---force the cursor to use reverse video colors based on
		---the foreground and background colors.
		---When `false` (the default), the `cursor_fg`, `cursor_bg`
		---and `cursor_border` color scheme settings are applied as normal.
		---If escape sequences are used to change the cursor color,
		---they will take precedence over `config.force_reverse_video_cursor`.
		---In earlier releases, setting `config.force_reverse_video_cursor`
		---to `true` always ignored the configured cursor color.
		force_reverse_video_cursor: boolean | nil
		---Configures a Hue, Saturation, Brightness transformation
		---that is applied to monochrome glyphs.
		---The transform works by converting the `RGB` colors to `HSV` values
		---and then multiplying the HSV by the numbers specified
		---in `config.foreground_text_hsb`.
		---Modifying the hue changes the hue of the color by rotating it
		---through the color wheel.
		---It is not as useful as the other components, but is available
		---_"for free"_ as part of the colorspace conversion.
		---Modifying the saturation can add or reduce
		---the amount of "colorfulness".
		---Making the value smaller can make it appear more washed out.
		---Modifying the brightness can be used to dim or increase
		---the perceived amount of light.
		---The range of these values is `0.0` and up; they are used
		---to multiply the existing values, so the default of `1.0`
		---preserves the existing component, whilst `0.5` will reduce it
		---by half, and `2.0` will double the value.
		---```lua
		------This increases color saturation by 50%
		---config.foreground_text_hsb = {
		---  hue = 1.0,
		---  saturation = 1.5,
		---  brightness = 1.0,
		---}
		---```
		---For more details, see:
		--- - [`HsbTransform`](lua://HsbTransform)
		foreground_text_hsb: HsbTransform | nil
		---Selects the freetype interpret version to use.
		---Likely values are `35`, `38` and `40` which have different
		---characteristics with respective to subpixel hinting.
		---See [Subpixel Hinting](https://freetype.org/freetype2/docs/subpixel-hinting.html).
		freetype_interpreter_version: integer | nil
		---An advanced option to fine tune the freetype rasterizer.
		---This is a bitfield, so you can combine one or more of
		---these options together, separated by the `|` character,
		---although not many of the available options necessarily
		---make sense to be combined.
		---Available flags are:
		--- - `"DEFAULT"`
		--- - `"NO_HINTING"`: Disable hinting.
		---                 The freetype documentation says that this generally generates ‘blurrier’
		---                 bitmap glyph when the glyph is rendered in any of the anti-aliased modes,
		---                 but that was written for rasterizing direct to bitmaps.
		---                 In the context of wezterm where we are rasterizing to a texture that is then
		---                 sampled and applied to a framebuffer through vertices on the GPU,
		---                 the hinting process can be counter-productive and result
		---                 in unexpected visual artifacts
		--- - `"NO_BITMAP"`: Don't load any pre-rendered bitmap strikes
		--- - `"FORCE_AUTOHINT"`: Use the freetype auto-hinter rather than the font's native hinter
		--- - `"MONOCHROME"`: Instructs renderer to use 1-bit monochrome rendering.
		---                 This option doesn't impact the hinter
		--- - `"NO_AUTOHINT"`: Don't use the freetype auto-hinter
		---```lua
		----- You probably don't want to do this, but this demonstrates
		----- that the flags can be combined
		---config.freetype_load_flags = 'NO_HINTING|MONOCHROME'
		---```
		---The default value depends on the effective DPI of the display.
		---If the DPI is `100` or larger, the default value is `"NO_HINTING"`.
		---Otherwise, the default value is `"DEFAULT"`.
		freetype_load_flags: _enums.FreeTypeLoadFlags | nil
		---Configures the hinting and (potentially) the rendering mode used
		---with the freetype rasterizer.
		---The following values are possible:
		--- - `"Normal"`: This corresponds to the default hinting algorithm,
		---             optimized for standard gray-level rendering.
		---             This is the default setting
		--- - `"Light"`: A lighter hinting algorithm for non-monochrome modes.
		---            Many generated glyphs are more fuzzy but better resemble
		---            its original shape.
		---            A bit like rendering on Mac OS X
		--- - `"Mono"`: Strong hinting algorithm that should only be used
		---           for monochrome output.
		---           The result is probably unpleasant if the glyph
		---           is rendered in non-monochrome modes
		--- - `"HorizontalLcd"`: A subpixel-rendering variant of `"Normal"`
		---                    optimized for horizontally decimated LCD displays
		--- - `"VerticalLcd"`: A subpixel-rendering variant of `"Normal"`
		---                  optimized for vertically decimated LCD displays
		---For more advanced flags that can be primarily used to influence font hinting, see also:
		--- - [`config.freetype_render_target`](lua://Config.freetype_render_target)
		--- - [`config.freetype_load_flags`](lua://Config.freetype_load_flags)
		---Note: When using subpixel-rendering, it comes at the cost
		---of the ability to explicitly set the alpha channel for the
		---text foreground color.
		---You will need to choose between using the alpha channel or
		---using subpixel-rendering, and you must select subpixel-rendering
		---in your main configuration in order for the correct render mode
		---to activate: setting it only in a
		---[`wezterm.font`](lua://Wezterm.font)
		---override is not sufficient.
		freetype_load_target: _enums.FreeTypeLoadTarget | nil
		---This option provides control over the [no-long-family-names](https://freetype.org/freetype2/docs/reference/ft2-properties.html#no-long-family-names)
		---FreeType PCF font driver property.
		---The default is for this configuration to be `false`,
		---which sets the PCF driver to use the un-decorated font name.
		---This corresponds to the default mode of operation
		---of the freetype library.
		---Some Linux distributions build the freetype library
		---in a way that causes the PCF driver to report font names differently;
		---instead of reporting just `Terminus` it will prefix the font name with
		---the foundry (`xos4` in the case of `Terminus`) and potentially
		---append `Wide` to the name if the font has wide glyphs.
		---The purpose of that configuration option is to disambiguate fonts,
		---as there are a number of fonts from different foundries
		---that all have the name `Fixed`, and being presented with multiple items
		---with the same `Fixed` label is a very ambiguous user experience.
		---When two different applications have differing values
		---for this long family names property, they will face inconsistencies
		---in resolving fonts by name as they will disagree on what the name
		---of a given PCF font is.
		---## When should you set this option to true?
		---If all of the following are `true`, then you should set this option to `true`:
		--- - You need to use PCF fonts and you need to use fontconfig
		---   to resolve their names to font files.
		--- - You are using a Linux distribution that builds their FreeType library with
		---   `PCF_CONFIG_OPTION_LONG_FAMILY_NAMES` defined.
		---Note that PCF fonts are a legacy font format and you will be
		---better served by OTF, TTF or OTB (Open Type Binary) file formats.
		freetype_pcf_long_family_names: boolean | nil
		---Configures the rendering mode used with the freetype rasterizer.
		---The default is to use the value of
		---[`config.freetype_load_target`](lua://Config.freetype_load_target).
		---You may wish to override that value if you want very fine control over how
		---freetype hints and then renders glyphs.
		---For example, this configuration uses light hinting but produces subpixel-antialiased glyph bitmaps:
		---```lua
		---config.freetype_load_target = 'Light'
		---config.freetype_render_target = 'HorizontalLcd'
		---```
		freetype_render_target: _enums.FreeTypeLoadTarget | nil
		---Specify the features to enable when using harfbuzz for font shaping.
		---There is some light documentation [here](https://harfbuzz.github.io/shaping-opentype-features.html).
		---but it boils down to allowing opentype feature names to be specified
		---using syntax similar to [the CSS `font-feature-settings` options](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings).
		---The _OpenType_ spec lists a number of features [here](https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist).
		---This option used to have more scope in earlier versions of wezterm,
		---but today it allows three possible values:
		--- - `"OpenGL"`: Use GPU accelerated rasterization
		--- - `"Software"`: Use CPU-based rasterization
		--- - `"WebGpu"`: Use GPU accelerated rasterization
		---You may wish (or need!) to select Software if there are issues with your GPU/OpenGL drivers.
		---WezTerm will automatically select Software if it detects that
		---it is being started in a Remote Desktop environment on Windows.
		---## WebGpu
		---The `WebGpu` front end allows wezterm to use GPU acceleration
		---provided by a number of platform-specific backends:
		--- - Metal (on macOS)
		--- - Vulkan
		--- - DirectX 12 (on Windows)
		front_end: Config |_enums.FrontEnd | nil
		glyph_cache_image_cache_size: integer | nil
		---When `config.font_shaper = "Harfbuzz"`, this setting affects how font shaping takes place.
		---See [Font Shaping](https://wezterm.org/config/font-shaping.html)
		---for more information and examples.
		---The _OpenType_ spec lists a number of features [here](https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist).
		---See [Font Shaping](https://wezterm.org/config/font-shaping.html) for more information and examples.
		harfbuzz_features: {_enums.HarfbuzzFeatures} | nil
		---If `true`, the mouse cursor will be hidden while typing.
		---This option is `true` by default.
		hide_mouse_cursor_when_typing: boolean | nil
		---If set to `true`, when there is only a single tab,
		---the tab bar is hidden from the display.
		---If a second tab is created, the tab will be shown.
		hide_tab_bar_if_only_one_tab: boolean | nil
		---Defines rules to match text from the terminal output
		---and generate clickable links.
		hyperlink_rules: {HyperlinkRule} | nil
		ignore_svg_fonts: boolean | nil
		---Control IME preedit rendering. IME preedit is an area that is used to display the string being preedited in IME. WezTerm supports the following IME preedit rendering.
		--- - `"Builtin"`: (Default) IME preedit is rendered by WezTerm itself
		---`"Builtin"` rendering provides good look and feel for many IMEs,
		---rendering the text using the same font as the terminal and works in concert
		---with features like [`window:composition_status()`](lua://Window.composition_status).
		---It may truncate displaying of IME preedit at the end of window
		---if IME preedit is very long because the rendering does not allow the IME preedit
		---to overflow the window and does not wrap IME preedit to the next line.
		--- - `"System"`: IME preedit is rendered by system
		---`"System"` rendering can be useful to avoid the truncated displaying of IME preedit
		---but has a worse look and feel compared to `"Builtin"` rendering.
		---You can control IME preedit rendering in your configuration file:
		---```lua
		---config.ime_preedit_rendering = 'System'
		---```
		---Otherwise, the default is `"Builtin"`.
		---Note:
		--- - Changing this option usually requires re-launching WezTerm to take full effect.
		--- - In macOS, this option has no effect currently.
		---   IME preedit is always rendered by WezTerm itself.
		enum _BuiltinOrSytem
			"Builtin"
			"System"
		end
		ime_preedit_rendering: _BuiltinOrSytem | nil
		---Specifies the Hue, Saturation, and Brightness transformation
		---applied to inactive panes.
		inactive_pane_hsb: HsbTransform | nil
		---Specifies the width of a new window, expressed in character cells.
		initial_cols: integer | nil
		---Specifies the height of a new window, expressed in character cells.
		initial_rows: integer | nil
		---Configures the alignment of the set of window management buttons when
		---[`config.window_decorations`](lua://Config.window_decorations) has
		---a value of `"INTEGRATED_BUTTONS|RESIZE"`.
		---Possible values are:
		--- - `"Left"`: The buttons are shown on the left side of the tab bar
		--- - `"Right"`:` The buttons are shown on the right side of the tab bar
		enum _RightOrLeft
			"Right"
			"Left"
		end
		integrated_title_button_alignment: _RightOrLeft | nil
		---Configures the color of the set of window management buttons when
		---[`config.window_decorations`](lua://Config.window_decorations) has
		---a value of `"INTEGRATED_BUTTONS|RESIZE"`.
		---Possible values are:
		--- - `"Auto"`: Automatically compute the color
		--- - A custom color, like `"red"`
		--- See:
		--- - [`PaletteBrights`](lua://PaletteBrights)
		enum _Auto
			"Auto"
		end
		integrated_title_button_color: _enums.PaletteBrightsOrAuto | nil
		---Configures the visual style of the tabbar-integrated titlebar button replacements that are shown
		---when [`config.window_decorations`](lua://Config.window_decorations) has
		---a value of `"INTEGRATED_BUTTONS|RESIZE"`.
		---Possible styles are:
		--- - `"Windows"`: Draw Windows-style buttons
		--- - `"Gnome"`: Draw Adwaita-style buttons
		--- - `"MacOsNative"`: On macOS only, move the native macOS buttons into the tab bar
		---The default value is `"MacOsNative"` on macOS systems.
		---On other systems it's `"Windows"`.
		enum _OS
			"Windows"
			"Gnome"
			"MacOsNative"
		end
		integrated_title_button_style: _OS | nil
		---Configures the ordering and set of window management buttons to show
		---when [`config.window_decorations`](lua://Config.window_decorations) has
		---a value of `"INTEGRATED_BUTTONS|RESIZE"`.
		---The value is a table listing the buttons.
		---Each element can have one of the following values:
		--- - `"Hide"`: The window hide or minimize button
		--- - `"Maximize"`: The window maximize button
		--- - `"Close"`: The window close button
		---The default value is equivalent to:
		---```lua
		---config.integrated_title_buttons = { 'Hide', 'Maximize', 'Close' }
		---```
		---You can change the order by listing them in a different order:
		---```lua
		---config.integrated_title_buttons = { 'Close', 'Maximize', 'Hide' }
		---```
		---or remove buttons you don't want:
		---```lua
		---config.integrated_title_buttons = { 'Close' }
		---```
		enum _HideMaximizeClose
			"Hide"
			"Maximize"
			"Close"
		end
		integrated_title_buttons: {_HideMaximizeClose} | nil
		---Combinined with [`config.window_background_opacity`](lua://Config.window_background_opacity),
		---enables background blur using the KDE Wayland blur protocol.
		---This can be used to produce a translucent window effect rather than
		---a crystal clear transparent window effect.
		kde_window_background_blur: boolean | nil
		---Controls how keys without an explicit `phys:` or `mapped:` prefix are treated.
		---If `"Mapped"` (the default), then `mapped:` is assumed.
		---Otherwise if `"Physical"` then `phys:` is assumed.
		---Default key assignments also respect `config.key_map_preference`.
		enum _MappedOrPhysical
			"Mapped"
			"Physical"
		end
		key_map_preference: _MappedOrPhysical | nil
		---See the main [Key Tables docs](https://wezterm.org/config/key-tables.html).
		key_tables: {string, {Key}} | nil
		---Holds an array of tables that assign keys to WezTerm.
		keys: {Key} | nil
		---Specify a string of unique characters.
		---The characters in the string are used to calculate one or two key press
		---shortcuts that can be used to quickly choose from the Launcher when in the default mode.
		---Defaults to: `"1234567890abcdefghilmnopqrstuvwxyz"`
		---(Without `j`/`k` so they can be used for movement up and down).
		launcher_alphabet: string | nil --"1234567890abcdefghilmnopqrstuvwxyz"
		---You can define your own entries for the [Launcher Menu](https://wezterm.org/config/launch.html#the-launcher-menu)
		---using this configuration setting.
		---Each entry in `config.launch_menu` is an instance
		---of a [`SpawnCommand`](lua://SpawnCommand) object.
		launch_menu: {SpawnCommand} | nil
		---A leader key is a a modal modifier key. If leader is specified in the configuration then pressing
		---that key combination will enable a virtual LEADER modifier.
		---If `config.leader` is specified in the configuration then pressing
		---that key combination will enable a virtual `LEADER` modifier.
		---While `LEADER` is active, only defined key assignments that include `LEADER` in the mods mask
		---will be recognized.
		---Other keypresses will be swallowed and **NOT** passed through to the terminal.
		---`LEADER` stays active until a keypress is registered (whether it matches a key binding or not), or
		---until it has been active for the duration specified by `timeout_milliseconds`,
		---at which point it will automatically cancel itself.
		---LEADER stays active until a keypress is registered (whether it matches a key binding or not), or
		---until it has been active for the duration specified by timeout_milliseconds, at which point it
		---will automatically cancel itself.
		leader: LeaderKey | nil

		---Scales the computed line height to adjust the spacing between successive rows of text.
		---The default line height is controlled by
		---[`config.font_size`](lua://Config.font_size).
		---If you feel that your chosen font feels too vertically cramped then you can set
		---`config.line_height = 1.2` to increase the vertical spacing by 20%.
		---Conversely, setting `config.line_height = 0.9` will decrease the vertical spacing by 10%.
		line_height: number | nil
		line_quad_cache_size: integer | nil
		line_state_cache_size: integer | nil
		line_to_ele_shape_cache_size: integer | nil
		---When set to `true`, WezTerm will log warnings when it receives escape sequences
		---which it does not understand.
		---Those warnings are harmless and are useful primarily by the maintainer
		---to discover new and interesting escape sequences.
		log_unknown_escape_sequences: boolean | nil
		---On macOS systems, this option controls whether modified key presses are routed
		---via the IME when setting `true` to
		---[`config.use_ime`](lua://Config.use_ime).
		---When processing a key event, if any modifiers are held,
		---if the modifiers intersect with the value of `config.macos_forward_to_ime_modifier_mask`,
		---then the key event is routed to the IME, which may choose to swallow the key event
		---as part of its own state management.
		---Users of a Japanese IME may wish to set this to `"SHIFT|CTRL"`,
		---but should note that it will prevent certain `CTRL` key combinations
		---that are commonly used in UNIX terminal programs from working as expected.
		macos_forward_to_ime_modifier_mask: _enums.Modifiers | nil
		---When `true` and in full screen mode, the window will extend behind the notch on macOS.
		---The default value for `config.macos_fullscreen_extend_behind_notch` is `false`.
		---Must be used with a `false` value for
		---[`config.native_macos_fullscreen_mode`](lua://Config.native_macos_fullscreen_mode).
		---Toggling full screen with the native macOS full screen button
		---or a window manager command won't have any effect and you must use the
		---`"Toggle full screen mode"` button in `View > Toggle` full screen mode
		---or configure your own key, see `ToggleFullScreen`.
		---Example config:
		---```lua
		---config.native_macos_fullscreen_mode = false
		---config.macos_fullscreen_extend_behind_notch = true
		---```
		macos_fullscreen_extend_behind_notch: boolean | nil
		---Combined with [`config.window_background_opacity`](lua://Config.window_background_opacity)
		---will configure the blur radius amount used by macOS when compositing the window on the screen.
		---This can be used to produce a translucent window effect rather than a crystal clear
		---transparent window effect.
		---The default value is `0`.
		macos_window_background_blur: integer | nil
		---Limits the maximum number of frames per second that wezterm will attempt to draw.
		---Defaults to `60`.
		---Note that for Wayland this is ignored, instead will use information
		---from the compositor to schedule painting frames.
		max_fps: integer | nil
		---Controls the minimum size of the scroll bar "thumb".
		--The value can be a number to specify the number of pixels, or a string with a unit suffix:
		--- - `"1px"`: The `px` suffix indicates pixels, so this represents a 1 pixel value
		--- - `"1pt"`: The `pt` suffix indicates points.
		---          There are 72 points in 1 inch.
		---          The actual size this occupies on screen depends on the DPI of the display device
		--- - `"1cell"`: The `cell` suffix indicates the height of the terminal cell,
		---            which in turn depends on the font size, font scaling and DPI
		--- - `"1%"`: The `%` suffix indicates the size of the terminal portion of the display,
		---         which is computed based on the number of rows and the size of the cell
		---You may use a fractional number such as `"0.5cell"`
		---or numbers larger than one such as `"72pt"`.
		min_scroll_bar_height: number | string | nil
		---A list containing tables of type
		---[`MouseBindingBase`](lua://MouseBindingBase).
		---For more info please check the [Mouse Binding](https://wezterm.org/config/mouse.html?h=mouse_report#configuring-mouse-assignments) docs.
		mouse_bindings: {MouseBindingBase} | nil
		---If `true`, the vertical mouse wheel will switch between tabs
		---when the mouse cursor is over the tab bar.
		---The default is `true`.
		---Set to `false` to disable this behavior.
		mouse_wheel_scrolls_tabs: boolean | nil
		---When set to `true` (the default), wezterm will configure the `SSH_AUTH_SOCK` environment variable
		---for panes spawned in the `local` domain.
		---The auth sock will point to a symbolic link that will in turn be pointed to the authentication socket
		---associated with the most recently active multiplexer client.
		---You can review the authentication socket that will be used for various clients
		---by running `wezterm cli list-clients` and inspecting the `SSH_AUTH_SOCK` column.
		---The symlink is updated within (at the time of writing this documentation) 100ms
		---of the active Mux client changing.
		---You can set `config.mux_enable_ssh_agent` to `false` to prevent wezterm from assigning `SSH_AUTH_SOCK`
		---or updating the symlink.
		mux_enable_ssh_agent: boolean | nil
		---Specifies a list of environment variables that should be removed from the environment
		---in the multiplexer server.
		---The intent is to clean up environment variables that might give the wrong impression
		---of their operating environment to the various terminal sessions spawned by the multiplexer server.
		---The default value for this is:
		---```lua
		---config.mux_env_remove = {
		---  'SSH_AUTH_SOCK',
		---  'SSH_CLIENT',
		---  'SSH_CONNECTION',
		---}
		---```
		mux_env_remove: string | nil
		---The buffer size used by `parse_buffered_data` in the mux output parser.
		---Values that are too large can make output application less responsive.
		mux_output_parser_buffer_size: integer | nil
		---How many milliseconds to delay after reading a chunk of output,
		---to coalesce fragmented writes into a single larger chunk.
		mux_output_parser_coalesce_delay_ms: integer | nil
		---Specifies whether the [`ToggleFullScreen`](https://wezterm.org/config/lua/keyassignment/ToggleFullScreen.html) key assignment
		---uses the native macOS full-screen application support or not.
		---The default is `false` which will simply (and very quickly) toggle between a window
		---that covers the full screen, with no decorations and a regularly sized window.
		---When `true`, transitioning to full screen will use the macOS native full screen mode,
		---which in more recent versions of macOS, will allocate a separate Space for the wezterm application
		---and then slowly animate the wezterm window moving into to that full screen Space on the monitor.
		---This option only has an effect when running on macOS.
		native_macos_fullscreen_mode: boolean | nil
		---When set to `true`, contiguous runs codepoints output to the terminal
		---are normalized to Unicode Normalization Form C (NFC).
		---This can improve the display of text and in the terminal
		---when portions of the output are in other normalization forms,
		---particularly with Korean text where
		---a given glyph can be comprised of several codepoints.
		---However, depending on the application running inside the terminal,
		---enabling this option may introduce discrepancies in the understanding of text positioning:
		---while it may fix some display glitches for some applications,
		---it may trade them for other glitches.
		---**As such, you should consider this configuration setting to be an imperfect option.**
		---This option defaults to `false` as it introduces some additional text processing
		---that is not necessary for most users.
		normalize_output_to_unicode_nfc: boolean | nil
		---This option controls how wezterm behaves when a toast notification escape sequence is received.
		---The following escape sequences will generate a toast notification:
		---```sh
		---printf "\e]777;notify;%s;%s\e\\" "title" "body"
		---printf "\e]9;%s\e\\" "hello there"
		---```
		notification_handling: _enums.NotifyHandler | nil
		palette_max_key_assigments_for_action: integer | nil
		---When `true`, moving the mouse pointer over an inactive pane will cause that pane to activate;
		---this behavior is known as "focus follows mouse".
		---When `false` (the default), you need to click on an inactive pane to activate it.
		pane_focus_follows_mouse: boolean | nil
		pane_select_bg_color: string | nil
		pane_select_fg_color: string | nil
		---Configures the font to use for pane selection mode.
		---The `config.pane_select_font` setting can specify a set of fallbacks and other options,
		---and is described in more detail in the [Fonts section](https://wezterm.org/config/fonts.html).
		---If not specified, the font is same as the font
		---for [`config.window_frame.font`](lua://WindowFrameConfig.font).
		---Typically either [`wezterm.font`](lua://Wezterm.font) or
		---[`wezterm.font_with_fallback`](lua://Wezterm.font_with_fallback) are
		---used to specify the font.
		---An example:
		---```lua
		---config.pane_select_font = wezterm.font 'Roboto'
		---```
		pane_select_font: TextStyle | nil
		pane_select_font_size: number | nil
		---If non-zero, specifies the period (in seconds) at which various statistics are logged.
		---Note that there is a minimum period of 10 seconds.
		periodic_stat_logging: integer | nil
		---Depending on the OS and windowing environment, there are a number of different ways
		---to access the GPU.
		---This option controls whether wezterm should attempt to use EGL to configure the GPU.
		---The default is `true`.
		prefer_egl: boolean | nil
		---If set to `true`, launching a new instance of wezterm will prefer to spawn
		---a new tab when it is able to connect to your already-running GUI instance.
		---Otherwise, it will spawn a new window.
		---The default value for this option is `false`.
		prefer_to_spawn_tabs: boolean | nil
		---Specify the alphabet used to produce labels for the items matched in quick select mode.
		---The default alphabet is `"asdfqwerzxcvjklmiuopghtybn"` which means that
		---the first matching item from the bottom is labelled with an `a`,
		---the second with `s` and so forth;
		---these are easily accessible characters in a `qwerty` keyboard layout.
		-- |          |                                        |
		-- |-------	|-------------------------------------	|
		-- | `qwerty`   | `"asdfqwerzxcvjklmiuopghtybn"` (default) |
		-- | `qwertz`   | `"asdfqweryxcvjkluiopmghtzbn"`           |
		-- | `azerty`   | `"qsdfazerwxcvjklmuiopghtybn"`           |
		-- | `dvorak`   | `"aoeuqjkxpyhtnsgcrlmwvzfidb"`           |
		-- | `colemak`  | `"arstqwfpzxcvneioluymdhgjbk"`           |
		---The suggested alphabet in the above table uses the left 4 fingers
		---on the home, top and bottom rows, then the right 4 fingers
		---on the home, top and bottom rows, followed by the characters
		---in the middle of the keyboard that may be harder to reach.
		quick_select_alphabet: _enums.QuickSelectAlphabet | nil
		---Specify additional patterns to match when in quick select mode.
		---This setting is a table listing out a set of regular expressions.
		---```lua
		---config.quick_select_patterns = {
		---  -- match things that look like sha1 hashes
		---  -- (this is actually one of the default patterns)
		---  '[0-9a-f]{7,40}',
		---}
		---```
		---The regex syntax now supports backreferences and look around assertions.
		---See [Fancy Regex Syntax](https://docs.rs/fancy-regex/latest/fancy_regex/#syntax) for the extended syntax,
		---which builds atop the underlying [Regex syntax](https://docs.rs/regex/latest/regex/#syntax).
		quick_select_patterns: string | nil
		---When set to `true`, all color and styling is removed from the pane
		---prior to performing matching and highlighting any matching text
		---in quick select mode.
		---This can make it easier to focus on the matches, particularly when the pane
		---already had a lot of styling and colors.
		---Defaults to `false`.
		quick_select_remove_styling: boolean | nil
		---When set to `true`, wezterm will terminate when all windows are closed.
		---This is the default behavior.
		---When set to `false`, wezterm will continue running.
		quit_when_all_windows_are_closed: boolean | nil
		---Controls how file names are quoted (or not) when dragging and dropping. There are five possible values:
		--- - `"None"`: No quoting is performed, the file name is passed through as-is
		--- - `"Posix"`: Use POSIX style shell word escaping
		--- - `"SpacesOnly"`: Backslash-escape only spaces, leaving all other characters as-is.
		---                 This is the default for non-Windows platforms
		--- - `"Windows"`: Use Windows style shell word escaping: double-quote filename
		---              with space characters in it, and leaving others as-is.
		---              This is the default on Windows
		--- - `"WindowsAlwaysQuoted"`: Like `"Windows"`, while always double-quoting the filename
		quote_dropped_files: _enums.DroppedFileQuoting | nil
		---Constrains the rate at which the multiplexer client speculatively prefetches lines.
		---This helps avoid saturating the client/server link when the server
		---is producing a large amount of output.
		ratelimit_mux_line_prefetches_per_second: integer | nil
		resolved_palette:Palette | nil
		---The minimum contrast ratio required to use the reverse video cursor.
		---When the contrast ratio between the reverse video cursor foreground and background
		---is below this threshold then the default cursor foreground and background
		---will be used instead.
		reverse_video_cursor_min_contrast: number | nil
		---If `false`, do not scroll to the bottom of the terminal when
		---you send input to the terminal.
		---The default is to scroll to the bottom when you send input
		---to the terminal (`true`).
		scroll_to_bottom_on_input: boolean | nil
		---How many lines of scrollback you want to retain.
		scrollback_lines: integer | nil
		search_font_dirs_for_fallback: boolean | nil
		---Configures the boundaries of a word, thus what is selected when doing a word selection with the mouse.
		---(See mouse actions [`SelectTextAtMouseCursor`](https://wezterm.org/config/lua/keyassignment/SelectTextAtMouseCursor.html)
		---and [`ExtendSelectionToMouseCursor`](https://wezterm.org/config/lua/keyassignment/ExtendSelectionToMouseCursor.html) with the mode argument set to `Word`).
		---Defaults to `" \t\n{}[]()\"'`"`.
		---For example, to always include spaces and newline when selecting a word,
		---but stop on punctuations:
		---```lua
		---config.selection_word_boundary = '{}[]()"\'`.,;:'
		---```
		selection_word_boundary: string | nil
		send_composed_key_when_left_alt_is_pressed: boolean | nil
		send_composed_key_when_right_alt_is_pressed: boolean | nil
		---Define a list of serial port(s) that you use regularly.
		---Each entry defines
		---a [`SerialDomain`](lua://SerialDomain)
		---table with the following fields:
		--- - `name`: The name to use for the serial domain.
		---         Must be unique across all multiplexer domains in your configuration
		--- - `port`: The name of the serial device.
		---         On Windows systems this can be a name like `COM0`.
		---         On Posix systems this will be a device path something like `/dev/ttyUSB0`.
		---         If omitted, the name field be interpreted as the port name
		--- - `baud`: The communication speed to assign to the port.
		---         If omitted, the default baud rate will be `9600`
		---The following configuration example defines a single port:
		---```lua
		---config.serial_ports = {
		---  {
		---    name = '/dev/tty.usbserial-10',
		---    baud = 115200,
		---  },
		---}
		---```
		---See [this page](https://wezterm.org/config/lua/config/serial_ports.html) for more complete info.
		serial_ports: {SerialDomain} | nil
		---Specifies a map of environment variables that should be set
		---when spawning commands in the local domain.
		---This is not used when working with remote domains.
		set_environment_variables: {string: string} | nil
		shape_cache_size: integer | nil
		---When set to `false`, the close-tab button will not be drawn in tabs
		---when the fancy tab bar is in use.
		---Default is `true`.
		show_close_tab_button_in_tabs: boolean | nil
		---When set to `true` (the default), the tab bar will display the `new-tab` button,
		---which can be left-clicked to create a new tab,
		---or right-clicked to display the Launcher Menu.
		---When set to `false`, the new-tab button will not be drawn into the tab bar.
		show_new_tab_button_in_tab_bar: boolean | nil
		---When set to `true` (the default), tab titles show their tab number (tab index)
		---with a prefix such as `1:`.
		---When `false`, no numeric prefix is shown.
		---The [`config.tab_and_split_indices_are_zero_based`](lua://Config.tab_and_split_indices_are_zero_based)
		---setting controls whether numbering starts with `0` or `1`.
		show_tab_index_in_tab_bar: boolean | nil
		---When set to `true` (the default), the tab bar will display the tabs
		---associated with the current window.
		---When set to `false`, the tabs will not be drawn into the tab bar.
		show_tabs_in_tab_bar: boolean | nil
		---This option no longer has any effect and will be removed in a future release.
		show_update_window: boolean | nil
		---This configuration specifies a list of process names that are considered to be "stateless"
		---and that are safe to close without prompting when closing windows, panes or tabs.
		---When closing a pane, WezTerm will try to determine the processes
		---that were spawned by the program that was started in the pane.
		---If all of those process names match one of the names in the
		---`config.skip_close_confirmation_for_processes_named` list then it will not
		---prompt for closing that particular pane.
		---The default value for this setting is:
		---```lua
		---config.skip_close_confirmation_for_processes_named = {
		---  'bash',
		---  'sh',
		---  'zsh',
		---  'fish',
		---  'tmux',
		---  'nu',
		---  'cmd.exe',
		---  'pwsh.exe',
		---  'powershell.exe',
		---}
		---```
		---More advanced control over this behavior can be achieved by defining a
		---[`"mux-is-process-stateful"`](https://wezterm.org/config/lua/mux-events/mux-is-process-stateful.html) event handler.
		skip_close_confirmation_for_processes_named: {string} | nil
		sort_fallback_fonts_by_coverage:             boolean  | nil
		---Sets which ssh backend should be used by default for the integrated ssh client.
		---Possible values are:
		--- - `"Ssh2"`: Use `libssh2`
		--- - `"LibSsh"`: Use `libssh`
		---Despite the naming, `libssh2` is not a newer version of `libssh`.
		---They are completely separate ssh implementations.
		---`"LibSsh"` is the default as it has broader support for newer keys and cryptography,
		---and has clearer feedback about authentication events that require entering a passphrase.
		enum _SshBackend
			"Ssh2"
			"LibSsh"
		end
		ssh_backend: _SshBackend | nil
		---Configures SSH multiplexing domains.
		---This option accepts a list of tables of type
		---[`SshDomain`](lua://SshDomain).
		---Read more about SSH Domains [here](https://wezterm.org/multiplexing.html#ssh-domains).
		---If you don't set `config.ssh_domains` in your config, wezterm will default to
		---configuring it as if you had:
		---```lua
		---config.ssh_domains = wezterm.default_ssh_domains()
		---```
		---See also:
		--- - [`wezterm.default_ssh_domains()`](lua://Wezterm.default_ssh_domains)
		ssh_domains: {SshDomain} | nil
		---Specifies the number of milliseconds that need to elapse between triggering
		---the [`update-status`](https://wezterm.org/config/lua/window-events/update-status.html) and the [`update-right-status`](https://wezterm.org/config/lua/window-events/update-right-status.html)
		---hooks.
		status_update_interval: integer | nil
		---If specified, overrides the position of strikethrough lines.
		---The default is derived from the underline position metric specified
		---by the designer of the primary font.
		---This config option accepts different units that have slightly different interpretations:
		--- - `2`, `2.0` or `"2px"` all specify a position of 2 pixels
		--- - `"2pt"` specifies a position of 2 points, which scales according to the DPI of the window
		--- - `"200%"` takes the font-specified underline_position and multiplies it by `2`
		--- - `"0.5cell"` takes the cell height, scales it by `0.5` and uses that as the position
		strikethrough_position: string | nil|number
		---When set to `true`, clicking on a pane will focus it.
		---When set to `false` (the default), clicking on a pane will focus it and then pass
		---the click through to the application in the terminal.
		swallow_mouse_click_on_pane_focus: boolean | nil
		---When set to `true`, clicking on a wezterm window will focus it.
		---When set to `false`, clicking on a wezterm window will focus it and then pass through
		---the click to the pane where the
		---[`config.swallow_mouse_click_on_pane_focus`](lua://Config.swallow_mouse_click_on_pane_focus)
		---option will further modify mouse event processing.
		---The default is `true` on macOS. Otherwise it will default to `false`.
		swallow_mouse_click_on_window_focus: boolean | nil
		---If `true`, the `Backspace` and `Delete` keys generate `Delete` and `Backspace`
		---keypresses, respectively, rather than their normal keycodes.
		---On macOS the default for this is `true` because its `Backspace` key
		---is labeled as `Delete` and things are backwards.
		swap_backspace_and_delete: boolean | nil
		---If set to `true`, when the active tab is closed, the previously activated tab
		---will be activated.
		---Otherwise, the tab to the left of the active tab will be activated.
		switch_to_last_active_tab_when_closing_tab: boolean | nil
		---If `true`,
		---[`config.show_tab_index_in_tab_bar`](lua://Config.show_tab_index_in_tab_bar)
		---will use a zero-based index.
		---The default is `false`, so the tab will show a one-based index.
		tab_and_split_indices_are_zero_based: boolean | nil
		---When `true`, the tab bar will be rendered at the bottom of the window
		---rather than the top of the window.
		---The default is `false`.
		tab_bar_at_bottom: boolean | nil
		---This config option allows styling the elements that appear in the tab bar.
		---This configuration supplements the tab bar color options.
		---Styling in this context refers to how the edges of the tabs
		---and the new tab button are rendered.
		---The default is simply a space character but you can use any sequence of
		---formatted text produced by
		---[`wezterm.format`](lua://Wezterm.format).
		---The defaults for each of these styles is simply a space.
		---For each element, the foreground and background colors are set
		---as per the tab bar colors you've configured.
		---The available elements are:
		--- - `active_tab_left`/`active_tab_right`: The left and right sides of the active tab
		--- - `inactive_tab_left`/`inactive_tab_right`: The left and right sides of inactive tabs
		--- - `inactive_tab_hover_left`/`inactive_tab_hover_right`: The left and right sides of inactive tabs
		---                                                     in the hover state
		--- - `new_tab_left`/`new_tab_right`: The left and right sides of the new tab button (`+`)
		--- - `new_tab_hover_left`/`new_tab_hover_right`: The left and right sides of the new tab button (`+`)
		---                                           in the hover state
		------
		---When setting
		---[`config.window_decorations`](lua://Config.window_decorations) to
		---`"INTEGRATED_BUTTONS|RESIZE"` you can control how the different buttons are drawn
		---for the retro tab bar:
		--- - `window_hide`/`window_hide_hover`: The minimize/hide button
		--- - `window_maximize`/`window_maximize_hover`: The maximize button
		--- - `window_close`/`window_close_hover`: The close button
		tab_bar_style: TabBarStyle | nil
		---Specifies the maximum width that a tab can have in the tab bar
		---when using retro tab mode.
		---This is ignored when using fancy tab mode.
		---Defaults to `16` glyphs in width.
		tab_max_width: integer | nil
		---What to set the `TERM` variable to.
		term: string | nil
		text_background_opacity: number | nil
		---Specifies the `EasingFunction` to use when computing the color
		---for text that has the blinking attribute in the fading-in phase
		---when the text is fading from the background color to the foreground color.
		---For more information, see:
		--- - [`EasingFunction`](lua://EasingFunction)
		--- - [`config.visual_bell`](lua://Config.visual_bell)
		--- - [`config.cursor_blink_rate`](lua://Config.cursor_blink_rate)
		text_blink_ease_in: EasingFunction | nil
		---Specifies the easing function to use when computing the color
		---for text that has the blinking attribute in the fading-out phase
		---when the text is fading from the foreground color to the background color.
		---See:
		--- - [`config.visual_bell`](lua://Config.visual_bell)
		---   for more information about easing functions
		text_blink_ease_out: EasingFunction | nil
		---Specifies the easing function to use when computing the color for text that has
		---the rapid blinking attribute in the fading-in phase when the text is fading
		---from the background color to the foreground color.
		---See:
		--- - [`config.visual_bell`](lua://Config.visual_bell)
		---   for more information about easing functions
		text_blink_rapid_ease_in: EasingFunction | nil
		---Specifies the easing function to use when computing the color for text that has
		---the rapid blinking attribute in the fading-out phase when the text is fading
		---from the foreground color to the background color.
		---See:
		--- - [`config.visual_bell`](lua://Config.visual_bell)
		---   for more information about easing functions
		text_blink_rapid_ease_out: EasingFunction | nil
		---Specifies how often blinking text (normal speed) transitions between
		---_visible_ and _invisible_, expressed in milliseconds.
		---Setting this to `0` disables slow text blinking.
		---Note that this value is approximate due to the way that the system event loop
		---schedulers manage timers.
		---Non-zero values will be at least the interval specified with some degree of slop.
		text_blink_rate: integer | nil
		---Specifies how often blinking text (rapid speed) transitions
		---between visible and invisible, expressed in milliseconds.
		---Setting this to `0` disables rapid text blinking.
		---Note that this value is approximate due to the way
		---that the system event loop schedulers manage timers;
		---non-zero values will be at least the interval specified
		---with some degree of slop.
		--- ---
		---Note that blinking is no longer a binary blink, but rather
		---it interpolates between invisible and visible text using
		---an easing function.
		---For more information, see:
		--- - [`config.text_blink_rapid_ease_in`](lua://Config.text_blink_rapid_ease_in)
		--- - [`config.text_blink_rapid_ease_out`](lua://Config.text_blink_rapid_ease_out)
		text_blink_rate_rapid: integer | nil
		---An optional floating point value that defaults to `nil`.
		---When set, it defines the minimum contrast ratio between
		---the foreground and background color of a textual cell,
		---when the cell has differing foreground and background colors.
		---If the color attributes of a cell fall below the minimum contrast ratio,
		---then the foreground color will have its luminance (perceived brightness)
		---adjusted to try to boost the contrast ratio to meet the specified minimum.
		---This may cause the foreground color to either increase or decrease
		---in luminance, typically making it either more white or more black.
		---It may not be possible to achieve the requested minimum ratio,
		---in which case a slightly better or the original color
		---(if no better color can be computed) will be used.
		---If the foreground and background colors in a cell are identical,
		---then that is assumed to be deliberate and the colors will remain
		---unchanged by this setting.
		---WCAG 2.0 level AA requires a contrast ratio of at least 4.5:1 for normal text,
		---so setting `config.text_min_contrast_ratio` to `4.5` is a reasonable value
		---if you find that your selected color scheme has poor contrast
		---in the applications that you run in your terminal.
		text_min_contrast_ratio: number | nil
		---Contains a list of Window Environments that are known to be tiling window managers.
		---A tiling window manager is one that automatically resizes windows
		---according to some layout policy, rather than respecting the window size
		---set by an application.
		---The default value for this option is:
		---```lua
		---config.tiling_desktop_environments = {
		---  'X11 LG3D',
		---  'X11 bspwm',
		---  'X11 i3',
		---  'X11 dwm',
		---}
		---```
		---The following additional entries are now part of the default value of
		---`config.tiling_desktop_environments`:
		--- - '"X11 awesome"'
		---The environment name can be found in the debug overlay which you can show via
		---the [`ShowDebugOverlay`](https://wezterm.org/config/lua/keyassignment/ShowDebugOverlay.html) key assignment.
		---The default key binding for it is `Ctrl+Shift+L`.
		---Look for the line beginning with `Window Environment:`.
		---The text after the colon is the name to add to `config.tiling_desktop_environments`.
		---If your window environment is a tiling environment and is not listed here,
		---please file an Issue or a Pull Request upstream to add it to the default list.
		---The contents of this list are used to determine a reasonable default for the
		---[`config.adjust_window_size_when_changing_font_size`](lua://Config.adjust_window_size_when_changing_font_size)
		---configuration field.
		tiling_desktop_environments: {string} | nil
		---Configures TLS multiplexing domains.
		---Read more about TLS Domains [here](https://wezterm.org/multiplexing.html#tls-domains).
		---This option accepts an array of tables of type
		---[`TlsDomainClient`](lua://TlsDomainClient).
		tls_clients: {TlsDomainClient} | nil
		---Configures TLS multiplexing domains.
		---Read more about TLS Domains [here](https://wezterm.org/multiplexing.html#tls-domains).
		---This option accepts an array of tables of type
		---[`TlsDomainServer`](lua://TlsDomainServer).
		tls_servers: {TlsDomainServer} | nil
		---Unicode defines a number of codepoints as having [Ambiguous Width](http://www.unicode.org/reports/tr11/#Ambiguous).
		---These are characters whose width resolves differently according to
		---context that is typically absent from the monospaced world
		---of the terminal.
		---WezTerm will by default treat ambiguous width as occupying a single cell.
		---When `true`, WezTerm will treat them as being two cells wide.
		---Note that changing this setting may have consequences for layout
		---in text UI applications if their expectation of width differs from
		---your choice of configuration.
		treat_east_asian_ambiguous_width_as_wide: boolean | nil
		---If you are using a layout with an `AltGr` key, you may experience issues
		---when running inside a VNC session, because VNC emulates the `AltGr` keypresses
		---by sending plain `Ctrl-Alt` keys, which won't be understood as `AltGr`.
		---To fix this behavior you can tell WezTerm to treat `Left-Ctrl-Alt` keys
		---as `AltGr` with the `config.treat_left_ctrlalt_as_altgr` option.
		---Note that the key bindings using separate `Ctrl` and `Alt`
		---won't be triggered anymore.
		treat_left_ctrlalt_as_altgr: boolean | nil
		---Controls how keyboard shortcuts are rendered in the Command Palette.
		---Possible values are:
		--- - `"UnixLong"`: `Super`, `Meta`, `Ctrl`, `Shift`
		--- - `"Emacs"`: `Super`, `M`, `C`, `S`
		--- - `"AppleSymbols"`: Use macOS style symbols for `Command`, `Option` and so on
		--- - `"WindowsLong"`: `Win`, `Alt`, `Ctrl`, `Shift`
		--- - `"WindowsSymbols"`: Like `"WindowsLong"` but using a logo for the `Win` key
		---The default is the platform-appropriate value.
		enum _KeyCapRendering
			"AppleSymbols"
			"Emacs"
			"UnixLong"
			"WindowsLong"
			"WindowsSymbols"
		end
		ui_key_cap_rendering: _KeyCapRendering | nil
		---On UNIX systems, specifies the minimum desirable value for the
		---`RLIMIT_NOFILE` soft limit.
		---That system parameter controls the maximum number of file descriptors
		---that a given process is permitted to open.
		---On startup, wezterm will inspect the soft and hard limits,
		---and if the soft limit is below the value of the `config.ulimit_nofile` option,
		---wezterm will attempt to raise it to `min(ulimit_nofile, hard_limit)`.
		ulimit_nofile: integer | nil
		---On UNIX systems, specifies the minimum desirable value for the
		---`RLIMIT_NPROC` soft limit.
		---That system parameter controls the maximum number of
		---simultaneous processes that a given user is permitted to spawn.
		---On startup, wezterm will inspect the soft and hard limits,
		---and if the soft limit is below the value of `config.ulimit_nproc`,
		---wezterm will attempt to raise it to `min(ulimit_nproc, hard_limit)`.
		ulimit_nproc: integer | nil
		---If specified, overrides the position of underlines.
		---The default is to use the underline position metric specified
		---by the designer of the primary font.
		---This config option accepts different units that have
		---slightly different interpretations:
		--- - `2`, `2.0` or `"2px"` all specify a position of 2 pixels
		--- - `"2pt"` specifies a position of 2 points, which scales according to the DPI of the window
		--- - `"200%"` takes the font-specified `underline_position` and multiplies it by `2`
		--- - `"0.1cell"` takes the cell height, scales it by `0.1` and uses that as the position
		---Note that `config.underline_position` is often a small negative number
		---like `-2` or `-4` which specifies an offset from the baseline of the font.
		underline_position: string | nil|number
		---If specified, overrides the base thickness of underlines.
		---The underline thickness is also used for rendering split pane dividers
		---and a number of other lines in custom glyphs.
		---The default is to use the underline thickness metric specified
		---by the designer of the primary font.
		---This config option accepts different units that have
		---slightly different interpretations:
		--- - `2`, `2.0` or `"2px"` all specify a thickness of 2 pixels
		--- - `"2pt"` specifies a thickness of 2 points, which scales according to the DPI of the window
		--- - `"200%"` takes the font-specified `underline_thickness` and multiplies it by 2
		---          to arrive at a thickness double the normal size
		--- - `"0.1cell" takes the cell height, scales it by `0.1`` and uses that as the thickness
		underline_thickness: string | nil|number
		---Specifies the version of unicode that will be used when interpreting
		---the width/presentation of text.
		---This option exists because Unicode is an evolving specification which
		---introduces new features and that occasionally adjusts how existing features
		---should be handled.
		---For example, there were a number of unicode code points that had
		---their width changed between Unicode version `8` and version `9`.
		---This wouldn't be an issue if all software was simultaneously aware of the change,
		---but the reality is that there is a lot of older software out there,
		---and that even if your local system is fully up to date,
		---you might connect to a remote system via SSH that is running applications
		---that use a different version of unicode than your local system.
		---The impact of mismatching expectations of unicode width for a
		---terminal emulator is that text columns may no longer line up
		---as the application author expected, and/or that the cursor
		---may appear to be in the wrong place when editing lines or text
		---in shells or text editors.
		---`config.unicode_version` defaults to unicode version `9` as that is
		---the most widely used version (from the perspective of width) as of writing,
		---which means that the default experience has the lowest chance
		---of mismatched expectations.
		---More info can be found [here](https://wezterm.org/config/lua/config/unicode_version.html).
		unicode_version: integer | nil
		---The set of UNIX domains.
		unix_domains: {UnixDomain} | nil
		---If set to `false`, the [`ActivatePaneDirection`](https://wezterm.org/config/lua/keyassignment/ActivatePaneDirection.html) command
		---will have no effect if the active pane is zoomed.
		---If `true`, the active pane will be unzoomed first and then switched.
		---See also [`TogglePaneZoomState`](https://wezterm.org/config/lua/keyassignment/TogglePaneZoomState.html).
		unzoom_on_switch_pane: boolean | nil
		use_box_model_render:  boolean | nil
		---When set to `true`, use the cap-height font metrics of the base
		---and the current font to adjust the size of secondary fonts
		---(such as bold or italic faces) to visually match the size
		---of the base font.
		---The default is `false`.
		use_cap_height_to_scale_fallback_fonts: boolean | nil
		---By default, if you are using a layout with dead keys
		---(e.g. US International or a number of European layouts),
		---pressing a dead key in wezterm will "hold" the dead key
		---until the next character is pressed, resulting in a
		---combined character with a diacritic.
		---For example, pressing `^` and then e will produce `ê`.
		---Pressing `^` then `SPACE` will produce `^` on its own.
		---If you are a heavy user of Vi style editors then you may
		---wish to disable dead key processing so that `^` can be used
		---with a single keypress.
		---You can tell WezTerm to disable dead keys by setting this
		---in your configuration file:
		---```lua
		---config.use_dead_keys = false
		---```
		---Note that for X11 systems that use a `true` value for
		---[`config.use_ime`](lua://Config.use_ime),
		---depending on the configured IME, the IME may handle
		---dead key processing implicitly.
		---There is no way for WezTerm to prevent it from doing that,
		---short of disabling the IME.
		use_dead_keys: boolean | nil
		---When set to `true` (the default), the tab bar is rendered
		---in a native style with proportional fonts.
		---When set to `false`, the tab bar is rendered using a retro aesthetic
		---using the main terminal font.
		use_fancy_tab_bar: boolean | nil
		---Controls whether the Input Method Editor (IME) will be used
		---to process keyboard input.
		---The IME is useful for inputting kanji or other text that
		---isn't natively supported by the attached keyboard hardware.
		---More info can be found [here](https://wezterm.org/config/lua/config/use_ime.html).
		use_ime: boolean | nil
		---When set to `true`, prefer to snap the window size to a
		---multiple of the terminal cell size.
		---The default is `false`, which allows sizing the window
		---to an arbitrary size.
		---This option is only respected on X11, Wayland, Windows and macOS.
		---Note that if you have
		---[`config.window_padding`](lua://Config.window_padding)
		---configured then the resize increments
		---don't take the padding into account.
		use_resize_increments: boolean | nil
		---When the `BEL` ASCII sequence is sent to a pane,
		---the bell is "rung" in that pane.
		---You may choose to configure the `config.visual_bell` option
		---to show a visible representation of the bell event, by having
		---the background color of the pane briefly change color.
		---There are four fields to the `config.visual_bell` config option:
		--- -`fade_in_duration_ms`: How long it should take for the bell color to fade in,
		---                       in milliseconds.
		---                       The default is `0`
		--- -`fade_out_duration_ms`: How long it should take for the bell color to fade out,
		---                        in milliseconds.
		---                        The default is `0`
		--- -`fade_in_function`: An easing function, similar to CSS easing functions,
		---                    that affects how the bell color is faded in
		--- -`fade_out_function`: An easing function that affects how the bell color is faded out
		--- -`target`: Can be `"BackgroundColor"` (the default) to have the background color
		---          of the terminal change when the bell is rung,
		---          or `"CursorColor"` to have the cursor color change when the bell is rung
		---If the total fade in and out durations are `0`, then there will be
		---no visual bell indication.
		---The bell color is itself specified in your color settings;
		---if not specified, the text foreground color will be used.
		---The following easing functions are supported:
		--- - `"Linear"`: The fade happens at a constant rate
		--- - `"Ease"`: The fade starts slowly, accelerates sharply, and then
		---           slows gradually towards the end.
		---           This is the default
		--- - `"EaseIn"`: The fade starts slowly, and then progressively
		---             speeds up until the end, at which point it stops abruptly
		--- - `"EaseInOut"`: The fade starts slowly, speeds up, and then slows down
		---                towards the end
		--- - `"EaseOut"`: The fade starts abruptly, and then progressively
		---              slows down towards the end
		--- - `{ CubicBezier = { 0.0, 0.0, 0.58, 1.0 } }`: An arbitrary cubic bezier
		---                                              with the specified parameters
		--- - `"Constant"`: Evaluates as `0` regardless of time.
		---               Useful to implement a step transition at the end of the duration
		---See also:
		--- - [`config.audible_bell`](lua://Config.audible_bell)
		--- - [`Bell`](https://wezterm.org/config/lua/window-events/bell.html)
		visual_bell: VisualBell | nil
		---When set to `true`, if a glyph cannot be found for a given codepoint,
		---then the configuration error window will be shown with a pointer
		---to the font configuration docs.
		---You can set this to `false` to prevent the configuration error window
		---from being displayed.
		---The default is `true`.
		warn_about_missing_glyphs: boolean | nil
		---If set to `true`, forces the use of a fallback software (CPU based)
		---rendering backend.
		---The performance will not be as good as using a GPU.
		---This option is only applicable when you have set `"WebGpu"` for
		---[`config.front_end`](lua://Config.front_end).
		---A more fine grained control over which GPU is selected also relies on
		---[`config.webgpu_preferred_adapter`](lua://Config.webgpu_preferred_adapter).
		webgpu_force_fallback_adapter: boolean | nil
		---Whether to select the higher powered discrete GPU when the system has
		---a choice of _integrated_ or _discrete_.
		---Defaults to `"LowPower"`.
		webgpu_power_preference: _enums.WebGpuPowerPreference | nil --TODO: check if takes Config
		---Specifies which `WebGpu` adapter should be used.
		---This option is only applicable when you have set `"WebGpu"` to
		---[`config.front_end`](lua://Config.front_end).
		---To return a list of GPUs, you can use
		---[`wezterm.gui.enumerate_gpus()`](lua://Wezterm.Gui.enumerate_gpus).
		webgpu_preferred_adapter: GpuInfo | nil
		---When combined with
		---[`config.win32_system_backdrop`](lua://Config.win32_system_backdrop)
		---as `"Acrylic"` on Windows systems, this option specifies
		---the accent color used with the Acrylic composition effect.
		---@field win32_acrylic_accent_color? string
		---When combined with
		---[`config.window_background_opacity`](lua://Config.window_background_opacity)
		---it chooses from available window background effects provided by Windows.
		---@field win32_system_backdrop? Config.Win32SystemBackdrop
		---Dynamically generates a
		---[`config.window_background_image`](lua://Config.window_background_image)
		---from the provided gradient specification.
		---When `config.window_background_gradient` is configured,
		---wezterm will ignore the value of
		---[`config.window_background_image`](lua://Config.window_background_image).
		---Linear gradients with both vertical or horizontal orientation
		---are supported.
		window_background_gradient: Gradient | nil
		---Specifies the path to a background image attachment file.
		---The file can be any image format that the rust `image`
		---crate is able to identify and load.
		---A window background image is rendered into the background
		---of the window before any other content.
		---The image will be scaled to fit the window.
		window_background_image: string | nil
		---Generates a coloured background from an object of type
		---[`HsbTransform`](lua://HsbTransform).
		window_background_image_hsb: HsbTransform | nil
		---Specifies the alpha value to use when rendering the window background.
		---The background is taken either from
		---[`config.window_background_image`](lua://Config.window_background_image)
		---or, if there is none, the background color of the cell in the current position.
		---The default is `1.0` which is 100% opaque.
		---Setting it to a number between `0.0` and `1.0` will allow for
		---the screen behind the window to _"shine through"_ to varying degrees.
		---This only works on systems with a compositing window manager.
		---Setting opacity to a value other than `1.0` can impact render performance.
		window_background_opacity: number | nil
		---Whether to display a confirmation prompt when the window is closed
		---by the windowing environment, either because the user closed it
		---with the window decorations, or instructed their window manager to do so.
		---Set this to `"NeverPrompt"` if you don't like having to confirm closing your windows.
		enum _PromptOrNot
			"AlwaysPrompt"
			"NeverPrompt"
		end
		window_close_confirmation: _PromptOrNot | nil
		---Controls the alignment of the terminal cells inside the window.
		---When the window size is not a multiple of terminal cell size,
		---terminal cells will be slightly smaller than the window,
		---and leave a small gap between the two.
		---You can use this option to control where the additional gap will be.
		enum _HorizontalAlignment
			"Left"
			"Center"
			"Right"
		end
		enum _VerticalAlignment
			"Top"
			"Center"
			"Bottom"
		end
		record _Alignment
			horizontal: _HorizontalAlignment
			vertical: _VerticalAlignment
		end
		window_content_alignment: _Alignment | nil
		---Configures whether the window has a title bar and/or resizable border.
		---The value is a set of flags:
		---  - `"NONE"`: disables titlebar and border (borderless mode),
		---              but causes problems with resizing and minimizing the window,
		---              so you probably want to use `"RESIZE"` instead of `"NONE"`
		---              if you just want to remove the title bar
		---  - `"TITLE"`: disable the resizable border and enable only the title bar
		---  - `"RESIZE"`: disable the title bar but enable the resizable border
		---  - `"TITLE|RESIZE"`: Enable titlebar and border. This is the default
		---  - `"INTEGRATED_BUTTONS|RESIZE"`: place window management buttons (minimize, maximize, close)
		---                                     into the tab bar instead of showing a title bar
		---  - `"MACOS_FORCE_DISABLE_SHADOW"`: (macOS only) disable the window shadow effect
		---  - `"MACOS_FORCE_ENABLE_SHADOW"`: (macOS only) enable the window shadow effect
		---  - `"MACOS_FORCE_SQUARE_CORNERS"`: (macOS only) force the window to have square rather than rounded corners.
		---                                    It is not compatible with `"TITLE"` or `"INTEGRATED_BUTTONS"`
		---  - `"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"`: (macOS only) change the system titlebar background color
		---                                                      to match the terminal background color defined
		---                                                      by your configuration.
		---                                                      This option doesn't make sense to use without
		---                                                      also including `"TITLE|RESIZE"` in the set of decorations
		---For more info, see:
		--- - [`WindowDecorations`](lua://WindowDecorations)
		window_decorations: _enums.WindowDecorations | nil
		---This setting is applicable primarily on Wayland systems when
		---client-side decorations are in use.
		---It allows you to customize the colors of the window frame.
		---Some of these colors are used by the fancy tab bar.
		---```lua
		---config.window_frame = {
		---  inactive_titlebar_bg = "#353535",
		---  active_titlebar_bg = "#2b2042",
		---  inactive_titlebar_fg = "#cccccc",
		---  active_titlebar_fg = "#ffffff",
		---  inactive_titlebar_border_bottom = "#2b2042",
		---  active_titlebar_border_bottom = "#2b2042",
		---  button_fg = "#cccccc",
		---  button_bg = "#2b2042",
		---  button_hover_fg = "#ffffff",
		---  button_hover_bg = "#3b3052",
		---}
		---```
		---You may explicitly add a border around the window area:
		---```lua
		---config.window_frame = {
		---  border_left_width = "0.5cell",
		---  border_right_width = "0.5cell",
		---  border_bottom_height = "0.25cell",
		---  border_top_height = "0.25cell",
		---  border_left_color = "purple",
		---  border_right_color = "purple",
		---  border_bottom_color = "purple",
		---  border_top_color = "purple",
		---}
		---```
		---You may specify the font and font size for the tabbar:
		---```lua
		---config.window_frame = {
		---  font = require("wezterm").font "Roboto",
		---  font_size = 12,
		---}
		---```
		---The default value of `font` is `Roboto`.
		---The default value of `font_size` is `10pt` on Windows
		---and `12pt` on other systems.
		---For more info, see:
		--- - [`WindowFrameConfig`](lua://WindowFrameConfig)
		window_frame: WindowFrameConfig | nil
		---Controls the amount of padding between the window border
		---and the terminal cells.
		---Padding is measured in pixels.
		---[`config.enable_scroll_bar`](lua://Config.enable_scroll_bar)
		---being set to `true` causes the value you set for right to control
		---the width of the scrollbar.
		---If you have enabled the scrollbar and have set right to `0`
		---then the right padding (and thus the scrollbar width)
		---will instead match the width of a cell.
		---For more info, see:
		--- - [`WindowPadding`](lua://WindowPadding)
		window_padding: WindowPadding | nil
		---Configures WSL domains.
		---This option accepts an array of tables of type
		---[`WslDomain`](lua://WslDomain).
		---The default is a list derived from parsing the output of `wsl -l -v`.
		---For more info about that list, and how to override it, see:
		--- - [`wezterm.default_wsl_domains()`](lua://Wezterm.default_wsl_domains)
		wsl_domains: {WslDomain} | nil
		xcursor_size: integer | nil
		xcursor_theme: string | nil
		---Explicitly set the name of the IME server to which wezterm
		---will connect via the `XIM` protocol when using X11 and
		---setting `true` to
		---[`config.use_ime`](lua://Config.use_ime).
		---By default, this option is not set which means that wezterm
		---will consider the value of the `XMODIFIERS` environment variable.
		---If for some reason the environment isn't set up correctly,
		---or you want to quickly evaluate a different input method server,
		---then you could update your config to specify it explicitly:
		---```lua
		---config.xim_im_name = 'fcitx'
		---```
		---will cause wezterm to connect to `fcitx`
		---regardless of the value of `XMODIFIERS`.
		xim_im_name: string | nil
	end

	
	record SpawnPosition
		origin: _enums.OriginType|_enums.NamedOrigin|nil
		x: integer | nil
		y: integer | nil
	end

	record NamedDomain
		DomainName: string
	end

	record SshHost
		hostname: string
		identityagent: string
		identityfile: string
		port: string
		user: string
		userknownhostsfile: string
	end

	---The `SshDomain` struct specifies information about an individual SSH Domain.
	record SshDomain
		---If `true`, connect to this domain automatically at startup.
		connect_automatically: boolean | nil
		---The name of this specific domain.
		---Must be unique amongst all types of domain in the configuration file.
		name: string
		---Whether agent auth should be disabled.
		---Set to `true` to disable it.
		no_agent_auth: boolean | nil
		---Identifies the host:port pair of the remote server.
		---Can be a DNS name or an IP address with an optional `":<port>"` at the end.
		remote_address: string
		---The path to the wezterm binary on the remote host.
		---Primarily useful if it isn't installed in the `PATH` of the remote session.
		remote_wezterm_path: string | nil
		---Specifies an alternative read timeout.
		timeout: integer | nil
		---The username to use for authenticating with the remote host.
		username: string
	end

	---The `TabInformation` struct describes a tab.
	---`TabInformation` is purely a snapshot of some of the key characteristics of the tab, intended
	---for use in synchronous, fast event callbacks that format GUI elements such as the window and tab
	---title bars.
	record TabInformation
		---The `PaneInformation` object for the active pane in this tab.
		---See
		--- - [`PaneInformation`](lua://PaneInformation)
		active_pane: PaneInformation
		---The `PaneInformation` array for all panes in the tab.
		---See:
		--- - [`PaneInformation`](lua://PaneInformation)
		panes: {PaneInformation}
		---Is `true` if this tab is the active tab.
		is_active: boolean
		---Is `true` if this tab is the previously active tab.
		is_last_active: boolean
		---The identifier for the tab.
		tab_id: integer
		---The logical tab position within its containing window, with `0` indicating the leftmost tab.
		tab_index: integer
		---The title of the tab.
		tab_title: string
		---The ID of the window that contains this tab.
		window_id: integer
		---The title of the window that contains this tab.
		window_title: string
	end

	record SunTimes
		progression: number
		rise: Time | nil
		set: Time | nil
		up: boolean
	end

	---The TlsDomainClient struct specifies information about how to connect to a [TLS Domain](https://wezterm.org/multiplexing.html#tls-domains).
	record TlsDomainClient
		---Explicitly controls whether the client checks that the certificate presented by the server
		---matches the hostname portion of `remote_address`.
		---The default is `true`.
		---This option is made available for troubleshooting purposes and should not be used outside of a
		---controlled environment as it weakens the security of the TLS channel.
		accept_invalid_hostnames: boolean | nil
		---If set, use `ssh` to connect, start the server, and obtain a certificate.
		---The value is `"user@host:port"`, just like what `wezterm ssh` accepts.
		bootstrap_via_ssh: string
		---The name of this specific domain.
		---Must be unique amongst all types of domain in the configuration file.
		name: string
		---The path to an x509 PEM encoded CA chain file.
		---Omit this if you are using `bootstrap_via_ssh`.
		pem_ca: string | nil
		---The path to an x509 PEM encoded certificate file
		---Omit this if you are using `bootstrap_via_ssh`.
		pem_cert: string | nil
		---The path to an x509 PEM encoded private key file.
		---Omit this if you are using `bootstrap_via_ssh`.
		pem_private_key: string | nil
		---A set of paths to load additional CA certificates.
		---Each entry can be either the path to a directory or to a PEM encoded CA file.
		---If an entry is a directory, then its contents will be loaded as CA certs and added
		---to the trust store.
		---Omit this if you are using `bootstrap_via_ssh`.
		pem_root_certs: {string} | nil
		---Identifies the `host:port` pair of the remote server.
		remote_address: string
		---The hostname string that we expect to match against the common name field in the certificate
		---presented by the server.
		---This defaults to the hostname portion of the `remote_address` configuration.
		---**You should not normally need to override this value**.
		expected_cn: string | nil
		---If `true`, connect to this domain automatically at startup.
		connect_automatically: boolean | nil
		---If true, connect to this domain automatically at startup.
		read_timeout: integer | nil
		write_timeout: integer | nil
		---The path to the wezterm binary on the remote host.
		remote_wezterm_path: string | nil
		---Specifies the round-trip latency threshold for enabling predictive local echo.
		local_echo_threshold_ms: integer | nil
		---If you prefer to have the information overlaid on the content area, then you can this to `true`,
		---but note that this may be dropped in the future.
		overlay_lag_indicator: boolean
	end

	---The `TlsDomainServer` struct specifies information about how to define the server side of a [TLS Domain](https://wezterm.org/multiplexing.html#tls-domains).
	record TlsDomainServer
		---The address:port combination on which the server will listen for client connections.
		bind_address: string
		---The path to an x509 PEM encoded CA chain file.
		---You can omit this if your `tls_client` is using `bootstrap_via_ssh`.
		pem_ca: string | nil
		---The path to an x509 PEM encoded certificate file.
		---You can omit this if your `tls_client` is using `bootstrap_via_ssh`.
		pem_cert: string | nil
		---The path to an x509 PEM encoded private key file.
		---You can omit this if your `tls_client` is using `bootstrap_via_ssh`.
		pem_private_key: string | nil
		---A set of paths to load additional CA certificates. Each entry can be either the path
		---to a directory or to a PEM encoded CA file. If an entry is a directory, then its contents will be
		---loaded as CA certs and added to the trust store.
		---You can omit this if your `tls_client` is using `bootstrap_via_ssh`.
		pem_root_certs: {string} | nil
	end

	---The `WslDomain` struct is used to tell WezTerm how to interact with one of your locally installed
	---[WSL distributions](https://docs.microsoft.com/en-us/windows/wsl/about).
	---By mapping a distribution to a multiplexing domain, wezterm is better able to support creating
	---new tabs and panes with the same working directory as an existing tab/pane running in
	---that same domain.
	---By default, wezterm creates a list of `WslDomain` objects based on parsing the output from
	---`wsl -l -v` and assigns that as the value of the following configuration option:
	--- - [`config.wsl_domains`](lua://Config.wsl_domains)
	record WslDomain
		---The current working directory to use when spawning commands, if the `SpawnCommand`
		---doesn't otherwise specify the directory.
		---See:
		--- - [`SpawnCommand`](lua://SpawnCommand)
		default_cwd: string | nil
		---The default command to run, if the `SpawnCommand` doesn't otherwise override it.
		---Note that you may prefer to use `chsh` to set the default shell for your user inside WSL
		---to avoid needing to specify it here.
		---See:
		--- - [`SpawnCommand`](lua://SpawnCommand)
		default_prog: {string} | nil
		---The name of the distribution. This identifies the WSL distribution.
		---It must match a valid distribution from your `wsl -l -v` output in order for the domain
		---to be useful.
		distribution: string
		---The name of this specific domain.
		---Must be unique amonst all types of domain in the configuration file.
		name: string
		---The username to use when spawning commands in the distribution.
		---If omitted, the default user for that distribution will be used.
		username: string | nil
	end

	record WindowDimensions
		pixel_width: number
		pixel_height: number
		dpi: number
		is_full_screen: boolean
	end

	---A `Window` object cannot be created in Lua code; it is typically passed to the user code via
	---an event callback. It is a handle to a GUI `TermWindow` running in the wezterm process.
	record Window
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
		composition_status: function(self: Window): string|nil

		---Puts text into the specified clipboard.
		copy_to_clipboard: function(self: Window, text: string): nil

		enum _Target
			"Clipboard"
			"PrimarySelection"
			"ClipboardAndPrimarySelection"
		end
		copy_to_clipboard: function(self: Window, text: string, target: _Target|nil): nil

		---Returns the current event.
		---For now this is only implemented for mouse events.
		current_event: function(self: Window): _enums.WindowEvent

		---Returns a Lua table representing the effective configuration for the `Window`.
		---The table is in the same format as that used to specify the config in the `wezterm.lua` file,
		---but represents the fully-populated state of the configuration, including any CLI or per-window
		---configuration overrides.
		---Note that changing the config table will NOT change the effective window config; it's just a copy
		---of that information.
		effective_config: function(self: Window): Config

		---Attempts to focus and activate the window.
		focus: function(self: Window): nil

		enum _Appearance
			"Light"
			"Dark"
			"LightHighContrast"
			"DarkHighContrast"
		end
		---Returns the appearance of the window environment.
		get_appearance: function(self: Window): _Appearance

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
		get_selection_text_for_pane: function(self: Window, pane: Pane): string

		---Returns `true` if the window has focus.
		---The `"update-status"` event is fired when the focus state changes.
		is_focused: function(self: Window): boolean

		---Returns two values; the keyboard `modifiers` and the key status `leds`.
		---Note that macOS doesn't have a num lock concept.
		enum _LEDs
			"CAPS_LOCK"
			"NUM_LOCK"
			"CAPS_LOCK|NUM_LOCK"
		end
		keyboard_modifiers: function(self: Window): {string, _LEDs}

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
		perform_action: function(self: Window, key_assignment: Action, pane: Pane): nil

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
		-- toast_notification: function(self: Window, title: string, message: string): nil
		-- toast_notification: function(self: Window, title: string, message: string, url: string|nil): nil
		toast_notification: function(self: Window, title: string, message: string, url: string|nil, timeout: integer|nil): nil

		---Toggles full screen mode for the window.
		toggle_fullscreen: function(self: Window): nil

		---Returns the ID number for the window.
		---The ID is used to identify the window within the internal multiplexer and can be used when
		---making API calls via the WezTerm CLI to indicate the subject of manipulation.
		window_id: function(self: Window): integer

		---Returns a string holding the top of the current key table activation stack, or `nil`
		---if the stack is empty.
		---See [Key Tables](https://wezterm.org/config/key-tables.html) for a detailed example.
		active_key_table: function(self: Window): string|nil
	end

	---Represents a date and time that is tracked internally as UTC.
	---Using `tostring()` on a Time object will show the internally tracked UTC time information.
	record Time --TODO: disambiguate from _Time

		---Formats the time object as a string, using the local date/time representation of the time.
		---The format string supports the set of formatting placeholders described [here](https://docs.rs/chrono/latest/chrono/format/strftime/index.html).
		format: function(self: Time, format: string): string

		---Formats the time object as a string, using UTC date/time representation of the time.
		---The format string supports the set of formatting placeholders described [here](https://docs.rs/chrono/latest/chrono/format/strftime/index.html).
		format_utc: function(self: Time, format: string): string

		---For the date component of the time object, compute the times of the sun rise and sun set
		---for the given latitude and longitude.
		---For the time component of the time object, compute whether the sun is currently up, and
		---the progression of the sun through either the day or night.
		---Returns that information as a `Time.SunTimes` object.
		---This information is potentially useful if you want to vary color scheme or other configuration
		---based on the time of day.
		---If the provided `latitude` and `longitude` specify a location at one of the poles, then
		---the day or night may be longer than 24 hours. In that case the `rise` and `set` values
		---will be `nil`, `progression` will be `0` and `up` will indicate either if it is polar daytime
		---(`true`) or polar night time (`false`).
		sun_times: function(self: Time, lat: number, lon: number): SunTimes
	end

	---The `SpawnCommand` struct specifies information about a new command to be spawned.
	---It is a Lua object with the following fields; all of the fields have reasonable defaults and
	---can be omitted.
	record SpawnCommand
		---The argument array specifying the command and its arguments.
		---If omitted, the default program for the target domain will be spawned.
		args: {string} | nil
		---The current working directory to set for the command.
		---If omitted, wezterm will infer a value based on the active pane at the time this action
		---is triggered.
		---If the active pane matches the domain specified in this `SpawnCommand` instance then the
		---current working directory of the active pane will be used.
		---If the current working directory cannot be inferred then it will typically fall back to using
		---the `$HOME` directory of the current user.
		cwd: string | nil
		---Specifies that the multiplexer domain
		---of the currently active pane should be used
		---to start this process.
		domain: _enums.DomainType|NamedDomain|nil
		---An optional label.
		---The `label` is only used for `SpawnCommand` instances that are listed in the `launch_menu`
		---configuration section.
		---If `label` is omitted, a default will be produced based on the `args` field.
		label: string | nil
		---Specifies the initial position for a GUI window when this command is used in a context that will
		---create a new window, such as with:
		--- - [`wezterm.mux.spawn_window()`](lua://Wezterm.Mux.spawn_window)
		--- - `SpawnCommandInNewWindow`
		position: SpawnPosition | nil
		---Sets additional environment variables in the environment for this command invocation.
		set_environment_variables: {string, any} | nil
	end

	record HsbTransform
		brightness: number | nil
		hue: number | nil
		saturation: number | nil
	end

	record WindowPadding
		bottom: integer | nil|string
		left: integer | nil|string
		right: integer | nil|string
		top: integer | nil|string
	end

	record DaemonOptions
		pid_file: string | nil
		stderr: string | nil
		stdout: string | nil
	end

	record VisualBell
		fade_in_duration_ms: integer | nil
		fade_in_function: EasingFunction | nil
		fade_out_duration_ms: integer | nil
		fade_out_function: EasingFunction | nil
		target: _enums.VBTarget | nil
	end

	record CellWidth
		first: integer
		last: integer
		width: integer
	end

	record _CubicBezier
		CubicBezier: {number}
	end

	record FontRules
		blink: _enums.Blink|nil
		font: TextStyle|nil
		intensity: _enums.Intensity|nil
		invisible: boolean|nil
		italic: boolean|nil
		reverse: boolean|nil
		strikethrough: boolean|nil
		underline: TabBarColor|_enums.Underline|nil
	end
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
		spawn: SpawnCommand | nil
	end
	--=========================================================================

	---Represents a domain that is managed by the multiplexer.
	record MuxDomain

		---Attempts to attach the domain.
		---Attaching a domain will attempt to import the windows, tabs and panes from the remote system
		---into those of the local GUI.
		---Unlike the `AttachDomain` key assignment, calling `MuxDomain:attach()` will not implicitly spawn
		---a new pane into the domain if the domain contains no panes. This is to provide flexibility
		---when used in the `gui-startup` event.
		---If the domain is already attached, calling this method again has no effect.
		attach: function(self: MuxDomain): nil

		---Attempts to detach the domain.
		---Detaching a domain causes it to disconnect and remove its set of windows, tabs and panes
		---from the local GUI. Detaching does not cause those panes to close; if or when you later attach
		---to the domain, they'll still be there.
		---Note that not every domain supports detaching, and will log an error to the error log/debug
		---overlay.
		detach: function(self: MuxDomain): nil

		---Returns the domain ID.
		domain_id: function(self: MuxDomain): integer

		---Returns `true` if the mux has any panes that belong to this domain.
		---This can be useful when deciding whether to spawn additional panes after attaching to a domain.
		has_any_panes: function(self: MuxDomain): boolean

		---Returns `false` if this domain will never be able to spawn a new pane/tab/window,
		---`true` otherwise.
		---Serial ports are represented by a serial domain that is not spawnable.
		is_spawnable: function(self: MuxDomain): boolean

		---Computes a label describing the `name` and `state` of the domain. The label can change
		---depending on the `state` of the domain.
		---See also:
		--- - [`MuxDomain:name()`](lua://MuxDomain.name)
		label: function(self: MuxDomain): string

		---Returns the name of the domain.
		---Domain names are unique; no two domains can have the same name, and the name is fixed for
		---the lifetime of the domain.
		---See also:
		--- - [`MuxDomain:label()`](lua://MuxDomain.label)
		name: function(self: MuxDomain): string

		---Returns whether the domain is attached or not.
		---The result is a string that is either:
		--- - `"Attached"`: the domain is attached
		--- - `"Detached"`: the domain is not attached
		---See also:
		--- - [`MuxDomain:attach()`](lua://MuxDomain.attach)
		--- - [`MuxDomain:detach()`](lua://MuxDomain.detach)
		state: function(self: MuxDomain): _enums.AttachedOrNot
	end

	---Represents a process running on the local machine.
	record LocalProcessInfo
		---A table holding the argument array for the process.
		argv: {string}
		---A table keyed by child process id and whose values are themselves.
		---`LocalProcessInfo` objects that describe the child processes.
		children: {LocalProcessInfo}
		---The current working directory for the process (may be empty).
		cwd: string
		---the full path to the executable image for the process (may be empty).
		executable: string
		---A short name for the process.
		---Due to platform limitations, this may be inaccurate and/or truncated;
		---you should look at the `executable` or `argv` fields instead of this one.
		name: string
		---The process identifier (`PID`).
		pid: integer
		---The parent process identifier.
		ppid: integer
		---A string holding the status of the process.
		---Possible values are:
		--- - `"Idle"`
		--- - `"Run"`
		--- - `"Sleep"`
		--- - `"Stop"`
		--- - `"Zombie"`
		--- - `"Tracing"`
		--- - `"Dead"`
		--- - `"Wakekill"`
		--- - `"Waking"`
		--- - `"Parked"`
		--- - `"LockBlocked"`
		--- - `"Unknown"`
		status: _enums.LocalProcessStatus
	end

	---An `ExecDomain` defines a local-execution multiplexer domain.
	---In simple terms, rather than directly executing the requested program, an `ExecDomain` allows you
	---to wrap up that command invocation by passing it through some other process.
	---For example, if you wanted to make it more convenient to work with tabs and panes inside
	---a docker container, you might want to define an `ExecDomain` that causes the commands to be run
	---via `docker exec`. While you could just ask WezTerm to explicitly spawn a command that runs
	---`docker exec` you would also need to adjust the default key assignments for splitting panes
	---to know about that preference.
	---Using an `ExecDomain` allows that preference to be associated with the pane so that things work
	---more intuitively.
	record ExecDomain

		---You must use `wezterm.exec_domain()` to define a domain.
		---It accepts the following parameters:
		--- - `name`: Uniquely identifies the domain.
		---         Must be different from any other multiplexer domains
		--- - `fixup`: A Lua function that will be called to fixup the requested command
		---          and return the revised command
		--- - `label` (optional): Can be either a `string` to serve as a label in the Launcher Menu,
		---                     or a lua function that will return the label
		---See `https://wezterm.org/config/lua/ExecDomain.html` for more info.
		-- exec_domain: function(name: string, fixup: (fun(cmd: SpawnCommand): SpawnCommand)): ExecDomain

		---You must use `wezterm.exec_domain()` to define a domain.
		---It accepts the following parameters:
		--- - `name`: Uniquely identifies the domain.
		---         Must be different from any other multiplexer domains
		--- - `fixup`: A Lua function that will be called to fixup the requested command
		---          and return the revised command
		--- - `label` (optional): Can be either a `string` to serve as a label in the Launcher Menu,
		---                     or a lua function that will return the label
		---See `https://wezterm.org/config/lua/ExecDomain.html` for more info.
		exec_domain: function(name: string, fixup: Endo, label: string|StringMaker|nil): ExecDomain

	end
	
	record FormatItemAttribute
		Intensity: _enums.Intensity | nil
		Italic: boolean | nil
		Underline: _enums.Underline
	end

	record FormatItemSpec
		Attribute: FormatItemAttribute | nil
		Background: ColorSpec | nil
		Foreground: ColorSpec | nil
		Text: string | nil
	end

	record FontAttributesBase
		---To control whether a font is considered to have emoji (rather than text)
		---presentation glyphs for emoji.
		assume_emoji_presentation: boolean | nil
		family: string
		---you can combine the flags like `"NO_HINTING|MONOCHROME"`
		---**(you probably wouldn't want to do this)**.
		freetype_load_flags: _enums.FreeTypeLoadFlags | nil
		freetype_load_target: _enums.FreeTypeTarget | nil
		freetype_render_target: _enums.FreeTypeTarget | nil
		---When `config.font_shaper` is
		---set to `"Harfbuzz"`, this setting affects
		---how font shaping takes place.
		---The _OpenType_ spec lists a number of features
		---[here](https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist).
		---For more information and examples, see:
		--- - [Font Shaping](https://wezterm.org/config/font-shaping.html)
		--- - [`config.font_shaper`](lua://Config.font_shaper)
		harfbuzz_features: {_enums.HarfbuzzFeatures} | nil
		scale: number | nil
		stretch: _enums.FontStretch | nil
		---This option will only be respected if the `italic` option is `nil`.
		style: _enums.FontStyle | nil
		weight: _enums.FontWeight | nil
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
		stretch: _enums.FontStretch | nil
		style: _enums.FontStyle | nil
		weight: _enums.FontWeight | nil
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
		backend: _enums.Backend
		device: integer
		device_type: _enums.DeviceType
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
		state: _enums.State --BatteryInfo.State
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
		icon: {string: string} | nil -- Wezterm | ...?
	end

	---Mirrors `StableCursorPosition` in wezterm upstream:
	---https://github.com/wezterm/wezterm/blob/main/mux/src/renderable.rs
	record StableCursorPosition
		shape: _enums.Shape --StableCursorPosition.Shape
		visibility: _enums._Visibility
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
		blend: _enums.Blend | nil -- Gradient | ...?
		colors: {string}
		interpolation: _enums.Interpolation | nil -- Gradient | ...?
		noise: number | nil
		orientation: GradientOrientation | nil
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

	record KeyBinding where self._tl_type == "KeyBinding" --: Key
		_tl_type: string
		action: Action
		key: string
		mods: string | nil
	end

	record MouseEventInfo
		button: _enums._Button | { _enums._WheelDirection: number }
		streak: number
	end

	record MouseBindingBase
		action: Action
		alt_screen: _enums._AltScreen | boolean | nil
		event: MouseEvent
		mouse_reporting: boolean | nil
	end

	record MouseBinding where self._tl_type == "MouseBinding" --: MouseBindingBase
		_tl_type: string
		mods: string
	end

	record _Named
		Named: string
	end

	record _SpawnCommandPosition
		origin: _enums._Screen | _Named | nil
		x: integer | nil
		y: integer | nil
	end

	record _HasDomainName
		DomainName: string
	end

	---The `SpawnCommand` struct specifies information about a new command to be spawned.
	---
	---It is a Lua object with the following fields; all of the fields have reasonable defaults and
	---can be omitted.
	---
	record SpawnCommand_ALT -- TODO: check diff and remove
		---The argument array specifying the command and its arguments.
		---
		---If omitted, the default program for the target domain will be spawned.
		---
		args: {string} | nil
		---The current working directory to set for the command.
		---
		---If omitted, wezterm will infer a value based on the active pane at the time this action
		---is triggered.
		---
		---If the active pane matches the domain specified in this `SpawnCommand` instance then the
		---current working directory of the active pane will be used.
		---
		---If the current working directory cannot be inferred then it will typically fall back to using
		---the `$HOME` directory of the current user.
		---
		cwd: string | nil
		---Specifies that the multiplexer domain
		---of the currently active pane should be used
		---to start this process.
		---
		domain: _enums._PaneIdentifier | _HasDomainName 
		---An optional label.
		---
		---The `label` is only used for `SpawnCommand` instances that are listed in the `launch_menu`
		---configuration section.
		---
		---If `label` is omitted, a default will be produced based on the `args` field.
		---
		label: string | nil
		---Specifies the initial position for a GUI window when this command is used in a context that will
		---create a new window, such as with:
		---
		--- - [`wezterm.mux.spawn_window()`](lua://Wezterm.Mux.spawn_window)
		--- - `SpawnCommandInNewWindow`
		---
		position: _SpawnCommandPosition | nil
		---Sets additional environment variables in the environment for this command invocation.
		---
		set_environment_variables: {string: any} | nil
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
		action: KeyAssignment
		---The `wezterm.color` module exposes functions that work with colors.
		---For more information, see:
		--- - [`Wezterm.Color`](lua://Wezterm.Color)
		color: Color
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
		gui: Gui
		home_dir: string
		---For more information, see:
		--- - [`Wezterm.Mux`](lua://Wezterm.Mux)
		mux: Mux
		---For more information, see:
		--- - [`Wezterm.NerdFont`](lua://Wezterm.NerdFont)
		nerdfonts: {string: string} --_enums.NerdFont
		---The `wezterm.plugin` module provides functions to manage WezTerm plugins.
		---For more information, see:
		--- - [`Wezterm.Plugin`](lua://Wezterm.Plugin)
		plugin: Plugin
		---The `wezterm.procinfo` module exposes functions that allow querying information about
		---processes that are running on the local system.
		---For more information, see:
		--- - [`Wezterm.ProcInfo`](lua://Wezterm.ProcInfo)
		procinfo: ProcInfo
		---The `wezterm.serde` module provides functions for parsing the given string
		---as JSON, YAML, or TOML, returning the corresponding Lua values, and vice-versa.
		---For more information, see:
		--- - [`Wezterm.Serde`](lua://Wezterm.Serde)
		serde: Serde
		---This constant is set to the Rust target triple for the platform on which
		---WezTerm was built.
		---This can be useful when you wish to conditionally adjust your configuration
		---based on the platform.
		target_triple: string
		---The `wezterm.time` module exposes functions that allow working with time.
		---For more information, see:
		--- - [`Wezterm.Time`](lua://Wezterm.Time)
		time: WeztermTime
		---The `wezterm.url` module exposes functions that allow working with URLs.
		---For more information, see:
		--- - [`Wezterm.Url`](lua://Wezterm.Url)
		url: Url
		---This constant is set to the WezTerm version string that is also reported
		---by running `wezterm -V`.
		---This can potentially be used to adjust configuration according to the installed version.
		version: string
	end

    ---Helper: for defining: key assignment: actions in: your configuration: file.
    ---This: is really: just sugar: for the: underlying Lua -> Rust: deserialation mapping
    ---that: makes it: a bit: easier to: identify where: syntax errors: may exist
    ---in: your configuration: file.
    ---
    record KeyAssignment
        ActivateCommandPalette: _enums._ActivateCommandPalette
        ActivateCopyMode: _enums._ActivateCopyMode
        ActivateKeyTable: ActivateKeyTable
        ActivateLastTab: _enums._ActivateLastTab
        ActivatePaneByIndex: ActivatePaneByIndex
        ActivatePaneDirection: ActivatePaneDirection
        ActivateTab: ActivateTab
        ActivateTabRelative: ActivateTabRelative
        ActivateTabRelativeNoWrap: ActivateTabRelativeNoWrap
        ActivateWindow: ActivateWindow
        ActivateWindowRelative: ActivateWindowRelative
        ActivateWindowRelativeNoWrap: ActivateWindowRelativeNoWrap
        AdjustPaneSize: AdjustPaneSize
        AttachDomain: AttachDomain
        CharSelect: CharSelect
        ClearKeyTableStack: _enums._ClearKeyTableStack
        ClearScrollback: ClearScrollback
        ClearSelection: _enums._ClearSelection
        CloseCurrentPane: CloseCurrentPane
        CloseCurrentTab: CloseCurrentTab
        CompleteSelection: CompleteSelection
        CompleteSelectionOrOpenLinkAtMouseCursor: CompleteSelectionOrOpenLinkAtMouseCursor
        Confirmation: Confirmation
        CopyMode: CopyMode
        CopyTo: CopyTo
        CopyTextTo: CopyTextTo
        DecreaseFontSize: _enums._DecreaseFontSize
        DetachDomain: DetachDomain
        DisableDefaultAssignment: _enums._DisableDefaultAssignment
        EmitEvent: EmitEvent
        ExtendSelectionToMouseCursor: ExtendSelectionToMouseCursor
        Hide: _enums._Hide
        HideApplication: _enums._HideApplication
        IncreaseFontSize: _enums._IncreaseFontSize
        InputSelector: InputSelector
        MoveTab: MoveTab
        MoveTabRelative: MoveTabRelative
        ---Performs: a sequence: of multiple: assignments.
        ---
        ---This: is useful: when you: want a: single key: press to: trigger multiple: actions.
        ---
        Multiple: Multiple
        Nop: _enums._Nop
        OpenLinkAtMouseCursor: _enums._OpenLinkAtMouseCursor
        OpenUri: OpenUri
        PaneSelect: PaneSelect
        PasteFrom: PasteFrom
        PopKeyTable: _enums._PopKeyTable
        PromptInputLine: PromptInputLine
        QuickSelect: _enums._QuickSelect
        QuickSelectArgs: QuickSelectArgs
        QuitApplication: _enums._QuitApplication
        ReloadConfiguration: _enums._ReloadConfiguration
        ResetFontAndWindowSize: _enums._ResetFontAndWindowSize
        ResetFontSize: _enums._ResetFontSize
        ResetTerminal: _enums._ResetTerminal
        RotatePanes: RotatePanes
        ScrollByCurrentEventWheelDelta: _enums._ScrollByCurrentEventWheelDelta
        ScrollByLine: ScrollByLine
        ScrollByPage: ScrollByPage
        ScrollToBottom: _enums._ScrollToBottom
        ScrollToPrompt: ScrollToPrompt
        ScrollToTop: _enums._ScrollToTop
        Search: Search
        SelectTextAtMouseCursor: SelectTextAtMouseCursor
        SendKey: SendKey
        SendString: SendString
        SetPaneZoomState: SetPaneZoomState
        SetWindowLevel: SetWindowLevel
        Show: _enums._Show
        ShowDebugOverlay: _enums._ShowDebugOverlay
        ShowLauncher: _enums._ShowLauncher
        ShowLauncherArgs: ShowLauncherArgs
        ShowTabNavigator: _enums._ShowTabNavigator
        SpawnCommandInNewTab: SpawnCommandInNewTab
        SpawnCommandInNewWindow: _SpawnCommandInNewWindow
        SpawnTab: SpawnTabAction
        SpawnWindow: _enums._SpawnWindow
        SplitHorizontal: SplitHorizontal
        SplitPane: SplitPane
        SplitVertical: SplitVertical
        StartWindowDrag: _enums._StartWindowDrag
        SwitchToWorkspace: SwitchToWorkspace
        SwitchWorkspaceRelative: SwitchWorkspaceRelative
        ToggleAlwaysOnBottom: _enums._ToggleAlwaysOnBottom
        ToggleAlwaysOnTop: _enums._ToggleAlwaysOnTop
        ToggleFullScreen: _enums._ToggleFullScreen
        TogglePaneZoomState: _enums._TogglePaneZoomState
    end

	record _Choice
		label: string
		id: string
	end

	record InputSelectorParams
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
		action: {EmitEvent: string }
		---A boolean that defaults to `false`.
		---If `true`, `InputSelector` will start in its fuzzy finding mode,
		---equivalent to starting the `InputSelector` and pressing `/` in the default mode.
		fuzzy: boolean | nil
		---A string of unique characters.
		alphabet: _enums.QuickSelectAlphabet | nil --|string
		---A string to display when in the default mode.
		description: string | nil
		---A string to display when in fuzzy finding mode.
		fuzzy_description: string | nil
	end

	record CharSelectParams
		copy_on_select: boolean
		copy_to: _enums.ClipboardCopyDestination
		group: _enums.CharGroup | nil
	end

	record SendKeyParams
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

	record Key --: SendKeyParams
		action: Action | nil
	end

	-- HELPERS ====================================================================
	record _ActivateKeyTable
		ActivateKeyTable: ActivateKeyTableParams
	end

	record _ActivatePaneByIndex
		ActivatePaneByIndex: integer
	end

	record _ActivatePaneDirection
		ActivatePaneDirection: _enums.PaneDirection
	end

	record _ActivateTab
		ActivateTab: integer
	end

	record _ActivateTabRelative
		ActivateTabRelative: integer
	end

	record _ActivateTabRelativeNoWrap
		ActivateTabRelativeNoWrap: integer
	end

	record _ActivateWindow
		ActivateWindow: integer
	end

	record _ActivateWindowRelative
		ActivateWindowRelative: integer
	end

	record _ActivateWindowRelativeNoWrap
		ActivateWindowRelativeNoWrap: integer
	end

	type _AdjustPaneSizeValue = {_enums.PaneDirection, integer} --TODO: does this work?

	record _AdjustPaneSize
		AdjustPaneSize: _AdjustPaneSizeValue
	end

	record _AttachDomain
		AttachDomain: string
	end

	record _CharSelect
		CharSelect: CharSelectParams
	end

	record _ClearScrollback
		ClearScrollback: _enums.ScrollbackEraseMode
	end

	record _Confirm
		confirm: boolean
	end

	record _CloseCurrentPane
		CloseCurrentPane: _Confirm 
	end

	record _CloseCurrentTab
		CloseCurrentTab: _Confirm
	end

	record _CompleteSelection
		CompleteSelection: _enums.ClipboardCopyDestination
	end

	record _CompleteSelectionOrOpenLinkAtMouseCursor
		CompleteSelectionOrOpenLinkAtMouseCursor: _enums.ClipboardCopyDestination
	end

	record _Confirmation
		Confirmation: ConfirmationParams
	end

	record _CopyMode
		CopyMode: CopyModeParams
	end

	record _CopyTo
		CopyTo: _enums.ClipboardCopyDestination
	end

	record _CopyTextTo
		CopyTextTo: CopyTextToParams
	end

	record _DetachDomain
		DetachDomain: SpawnTabDomain
	end

	record _EmitEvent
		EmitEvent: string
	end

	record _ExtendSelectionToMouseCursor
		ExtendSelectionToMouseCursor: _enums.SelectionMode
	end

	record _InputSelector
		InputSelector: InputSelectorParams
	end

	record _MoveTab
		MoveTab: integer
	end

	record _MoveTabRelative
		MoveTabRelative: integer
	end

	record _Multiple
		Multiple: {Action}
	end

	record _OpenUri
		OpenUri: string
	end

	record _PaneSelect
		PaneSelect: PaneSelectParams
	end

	record _PasteFrom
		PasteFrom: _enums.ClipboardPasteDestination
	end

	record _PromptInputLine
		PromptInputLine: PromptInputLineParams
	end

	record _QuickSelectArgs
		QuickSelectArgs: QuickSelectArgsParams
	end

	record _RotatePanes
		RotatePanes: _enums.RotationDirection
	end

	record _ScrollByLine
		ScrollByLine: integer
	end

	record _ScrollByPage
		ScrollByPage: number
	end

	record _ScrollToPrompt
		ScrollToPrompt: integer
	end

	record _Search
		Search: _enums._CurrentSelectionOrEmptyString|SearchParams
	end

	record _SelectTextAtMouseCursor
		SelectTextAtMouseCursor: _enums.SelectionMode
	end

	record _SendKey
		SendKey: SendKeyParams
	end

	record _SendString
		SendString: string
	end

	record _SetPaneZoomState
		SetPaneZoomState: boolean
	end

	record _SetWindowLevel
		SetWindowLevel: _enums.SetWindowLevelParams
	end

	record _ShowLauncherArgs
		ShowLauncherArgs: ShowLauncherArgsParams
	end

	record _SpawnTab
		SpawnTab: SpawnTabDomain
	end

	record _SpawnCommandInNewTab
		SpawnCommandInNewTab: SpawnCommand
	end

	record _SpawnCommandInNewWindow
		SpawnCommandInNewWindow: SpawnCommand
	end

	record _SplitPane
		SplitPane: SplitPaneParams
	end

	record _SplitHorizontal
		SplitHorizontal: SpawnCommand
	end

	record _
		SwitchWorkspaceRelative: integer
	end

	record _SplitVertical
		SplitVertical: SpawnCommand
	end

	record _SwitchToWorkspace
		SwitchToWorkspace: SwitchToWorkspaceParams
	end

	record _SwitchWorkspaceRelative
		SwitchWorkspaceRelative: integer
	end

	record ConfirmationParams
		---Event callback registered via `wezterm.action_callback()`.
		---The callback's function signature is `(window, pane)` where `window` and `pane`
		---are the `Window` and `Pane` objects from the current pane and window, respectively.

		---This callback is called when the user selects `Yes`.
		---```lua
		---wezterm.action.Confirmation({
		---  action = wezterm.action_callback(function(window, pane)
		---    --- ...
		---  end),
		---})
		---```
		action: _EmitEvent --TODO: check
		---The text to show for confirmation.
		---You may embed escape sequences and/or use `wezterm.format()`.
		---Defaults to: `"🛑 Really continue?"`.
		message: string | nil
		---Event callback registered via `wezterm.action_callback()`.
		---The callback's function signature is `(window, pane)` where `window` and `pane`
		---are the `Window` and `Pane`.
		---This is an optional argument. If present, this callback is called
		---when the user selects `No` or closes the confirmation menu.
		---```lua
		---wezterm.action.Confirmation({
		---  cancel = wezterm.action_callback(function(window, pane)
		---    --- ...
		---  end),
		---})
		---```
		cancel: _EmitEvent | nil
	end

	---Activates a named key table.
	record ActivateKeyTableParams
		---The name of the table to activate.
		---The name must match up to an entry in the `config.key_tables` configuration.
		---For more information, see:
		--- - [`config.key_tables`](lua://Config.key_tables)
		name: string
		---An optional duration expressed in milliseconds. If specified, then the activation
		---will automatically expire and pop itself from the key table stack once that duration elapses.
		---If omitted, this activation will not expire due to time.
		timeout_milliseconds: integer | nil
		---An optional boolean that controls whether the activation will pop itself
		---after a single additional key press.
		---The default if left unspecified is `true`.
		---When set to `false`, pressing a key will not automatically pop the activation
		---and you will need to use either a timeout or an explicit key assignment
		---that triggers `PopKeyTable` to cancel the activation.
		one_shot: boolean | nil
		---An optional boolean.
		---Defaults to `false` if unspecified.
		---If set to `true` then it will behave as though `PopKeyTable` was triggered
		---before pushing this new activation on the stack.
		---This is most useful for key assignments in a table that was activated
		---with `one_shot` set to `false`.
		replace_current: boolean | nil
		---An optional boolean.
		---Defaults to `false` if unspecified.
		---If set to `true` then a key press that doesn't match any entries
		---in the named key table will implicitly pop this entry from the stack.
		---This can be used together with `timeout_milliseconds`.
		until_unknown: boolean | nil
		---An optional boolean.
		---Defaults to `false` if unspecified.
		---If set to `true` then a key press that doesn't match any entries
		---in the named key table will halt any further key table stack matching,
		---allowing only key assignments that are defined in the current key table activation to match.
		---**Use with care**: If you haven't defined an explicit `PopKeyTable` assignment
		---in the key table you may lock yourself out of the keyboard
		---and will need to reload the configuration file
		---(e.g. by re-saving it) to get back in.
		prevent_fallback: boolean | nil
	end

	record PaneSelectParams
		alphabet: _enums.QuickSelectAlphabet | nil --|string
		mode: _enums.PaneSelectMode | nil
		show_pane_ids: boolean | nil
	end


	record PromptInputLineParams
		---The text to show at the top of the display area.
		---You may embed escape sequences and/or use `wezterm.format()`.
		description: string
	---An event callback registered via `wezterm.action_callback()`.
	---The callback's function signature is `(window, pane, line)` where `window` and `pane`
	---are the `Window` and `Pane` objects from the current pane and window,
	---and `line` is the text that the user entered.
		---Note that `line` may be `nil` if `Escape` is hit without entering anything,
		---or `CTRL-C` to cancel the input.
		---```lua
		---wezterm.action.PromptInputLine({
		---  action = wezterm.action_callback(function(window, pane, line)
		---    --- ...
		---  end),
		---})
		---```
		action: _EmitEvent
		---The text to show as the prompt.
		---You may embed escape sequences and/or use `wezterm.format()`.
		---Defaults to: `"> "`.
		prompt: string | nil
		---If provided, the initial content of the input field will be set to this value.
		---The user may edit it prior to submitting the input.
		initial_value: string | nil
	end

	record QuickSelectArgsParams
		---If present, completely overrides the normal set of patterns
		---and uses only the patterns specified.
		patterns: {string} | nil
		---If present, this alphabet is used instead of `config.quick_select_alphabet`.
		---See:
		--- - [`config.quick_select_alphabet`](lua://Config.quick_select_alphabet)
		alphabet: _enums.QuickSelectAlphabet | nil --|string
		---If present, this key assignment action is performed as if by `Window:perform_action`
		---when an item is selected.
		---The normal clipboard action is NOT performed in this case.
		action: Action | nil
		---Overrides whether `action` is performed after an item is selected
		---using a capital value (when paste occurs).
		skip_action_on_paste: boolean | nil
		---If present, replaces the string `"copy"` that is shown at the bottom of the overlay;
		---you can use this to indicate which action will happen if you are using `action`.
		label: string | nil
		---Specifies the number of lines to search above and below the current viewport.
		---The default is 1000 lines.
		---The scope will be increased to the current viewport height if the viewport is smaller.
		scope_lines: integer | nil
	end

	record CopyTextToParams
		text: string
		destination: _enums.ClipboardCopyDestination
	end

	record ShowLauncherArgsParams
		---The set of flags that specifies what to show in the launcher.
		---The flags can be joined together using a `|` character,
		---so `"TABS|DOMAINS"` is an example of a set of flags that will
		---include both tabs and domains in the list.
		flags: string --LauncherArgsFlags|string
		---The title to show in the tab while the launcher is active.
		title: string | nil
		---A string to display when in the default mode.
		---Defaults to: `"Select an item and press Enter=launch Esc=cancel /=filter"`.
		help_text: string | nil
		---A string to display when in fuzzy finding mode.
		---Defaults to: `"Fuzzy matching: "`.
		fuzzy_help_text: string | nil
		---A string of unique characters.
		---The characters in the string are used to calculate one or two key press shortcuts
		---that can be used to quickly choose from the Launcher when in the default mode.
		---Defaults to the same value as `config.launcher_alphabet` (`"1234567890abcdefghilmnopqrstuvwxyz"`).
		---See:
		--- - [`config.launcher_alphabet`](lua://Config.launcher_alphabet)
		alphabet: _enums.QuickSelectAlphabet | nil --|string
	end

	record SplitPaneParams
		---Specifies where the new pane will end up.
		---This field is required.
		direction: _enums.PaneDirection
		---Controls the size of the new pane.
		---Can be either:
		--- - `{ Cells = 10 }` (i.e. 10 cells)
		--- - `{ Percent = 50 }` (i.e. 50% of the available space)
		---If omitted, `{ Percent = 50 }` is the default.
		size: { _enums._SizeType: integer } | nil
		---The `SpawnCommand` specifying what program to launch into the new pane.
		---If omitted, `config.default_prog` will be used.
		---For more information, see:
		--- - [`SpawnCommand`](lua://SpawnCommand)
		--- - [`config.default_prog`](lua://Config.default_prog)
		command: SpawnCommand | nil
		---If set to true, rather than splitting the active pane, the split will be made
		---at the root of the tab and effectively split the entire tab
		---across the fullest possible extent.
		---The default is `false`.
		top_level: boolean | nil
	end

	record _AnsiColor where self.Color == nil
		AnsiColor: _enums.AnsiColor
		Color: nil
	end

	record _Color where self.Color ~= nil
		Color: string
	end

	record _Linear where self.Linear ~= nil
		Linear: LinearGradientOrientation
	end

	record _Radial where self.Linear == nil
		Radial: RadialGradientOrientation
		Linear: nil
	end

	record _PrevChar
		prev_char: boolean
	end

	record _JumpAssignment where self._tl_type == "JumpAssignment"
		JumpAssignment: {_enums._JumpDirection: _PrevChar}
		_tl_type: string
	end

	record _MoveZoneAssignment where self._tl_type == "MoveZoneAssignment"
		MoveZoneAssignment: {_enums._MoveZoneDirection: _enums._MovementZoneType}
		_tl_type: string
	end

	record _SetSelectionMode where self._tl_type == "SetSelectionMode"
		SetSelectionMode: _enums.SelectionMode
		_tl_type: string
	end

	record _MoveByPage where self._tl_type == "MoveByPage"
		MoveByPage: integer
		_tl_type: string
	end

	record _DomainId where self._tl_type == "DomainId"
		DomainId: integer
		_tl_type: string
	end
	record _DomainName where self._tl_type == "DomainName"
		DomainName: integer
		_tl_type: string
	end

	-- LOCAL FOR CopyModeParams
	record PrevChar where self._tl_type == "PrevChar"
		prev_char: boolean
		_tl_type: string
	end

	record BackwardJump where self._tl_type == "BackwardJump"
		JumpBackward: PrevChar
		_tl_type: string
	end

	record ForwardJump where self._tl_type == "ForwardJump"
		JumpForward: PrevChar
		_tl_type: string
	end

	record BackwardJumpZone where self._tl_type == "BackwardJumpZone" -- TODO: revisit name
		MoveBackwardZoneOfType: _enums.MovementType
		_tl_type: string
	end

	record ForwardJumpZone where self._tl_type == "ForwardJumpZone" -- TODO: revisit name
		MoveForwardZoneOfType: _enums.MovementType
		_tl_type: string
	end

	record PageMovement where self._tl_type == "PageMovement"
		MoveByPage: number
		_tl_type: string
	end

	record SelectionModeSetter where self._tl_type == "SelectionModeSetter"
		SetSelectionMode: _enums.SelectionMode
		_tl_type: string
	end


	---The `wezterm.gui` module exposes functions that operate on the GUI layer.
	---The multiplexer may not be connected to a GUI, so attempting to
	---resolve this module from the mux server will return `nil`.
	---You will typically use something like:
	---```lua
	---local wezterm = require 'wezterm'
	---local gui = wezterm.gui
	---if gui then
	---  -- do something that depends on the GUI layer
	---end
	---````
	record Gui --Wezterm.Gui

		---Returns a table holding the effective default set of `key_tables`.
		---That is the set of keys that is used as a base
		---if there was no configuration file.
		---This is useful in cases where you want to override a
		---key table assignment without replacing the entire set
		---of key tables.
		---This example shows how to add a key assignment for `Backspace`
		---to `copy_mode`, without having to manually specify
		---the entire key table:
		---```lua
		---local wezterm = require 'wezterm'
		---local act = wezterm.action
		---local copy_mode = nil
		---if wezterm.gui then
		---  copy_mode = wezterm.gui.default_key_tables().copy_mode
		---  table.insert(
		---    copy_mode,
		---    { key = 'Backspace', mods = 'NONE', action = act.CopyMode 'MoveLeft' }
		---  )
		---end
		---return {
		---  key_tables = {
		---    copy_mode = copy_mode,
		---  },
		---}
		---```
		record _KeyTables
			copy_mode: {Key}
			search_mode: {Key}
		end
		default_key_tables: function(): table --TODO: should be: {Key}|_KeyTables

		---Returns a table holding the effective default values
		---for key assignments.
		---That is the set of keys that is used as a base
		---if there was no configuration file.
		default_keys: function(): {Key}

		---Returns the list of available GPUs supported by WebGpu.
		---[`config.webgpu_preferred_adapter`](lua://Config.webgpu_preferred_adapter)
		---is useful in conjunction with this function.
		enumerate_gpus: function(): {GpuInfo}

		---This function returns the appearance of the window environment.
		---The appearance can be one of the following 4 values:
		--- - `"Dark"`: Dark mode with predominantly dark colors
		--- - `"Light"`: The normal appearance, with dark text on a light background
		---            lower contrasting, text color on a dark background
		--- - `"DarkHighContrast"`: Dark mode but with high contrast colors
		---                       (not reported on all systems)
		--- - `"LightHighContrast"`: Light mode but with high contrast colors
		---                        (not reported on all systems)
		---WezTerm is able to detect when the appearance has changed and
		---will reload the configuration when that happens.
		enum _Appearance
			"Dark"
			"DarkHighContrast"
			"Light"
			"LightHighContrast"
		end
		get_appearance: function(): _Appearance

		---Attempts to resolve a mux window to its corresponding GUI Window.
		---This may not succeed for a couple of reasons:
		--- - If called by the multiplexer daemon, there is no GUI,
		---   so this will never succeed
		--- - If the mux window is part of a workspace that is not
		---   the active workspace
		gui_window_for_mux_window: function(window_id: integer): userdata

		---Returns an array table listing all `GUI Window` objects
		---in a stable/consistent order.
		gui_windows: function(): {Window}

		---Returns information about the screens connected to the system.
		screens: function(): GuiScreensInfo
	end

	---The `wezterm.mux` module exposes functions that operate on the multiplexer layer.
	---The multiplexer manages the set of running programs into panes, tabs, windows and workspaces.
	---The multiplexer may not be connected to a GUI so certain operations that require a running
	---Window management system are not present in the interface exposed by this module.
	---You will typically use something like:
	---```lua
	---local wezterm = require("wezterm")
	---local mux = wezterm.mux
	---```
	---at the top of your configuration file to access it.
	--- ---
	---## Important Note
	---You should avoid using, at the file scope in your config, mux functions that cause new splits,
	---tabs or windows to be created. The configuration file can be evaluated multiple times
	---in various contexts.
	---If you want to spawn new programs when WezTerm starts up, look at the [`gui-startup`](https://wezterm.org/config/lua/gui-events/gui-startup.html)
	---and [`mux-startup`](https://wezterm.org/config/lua/mux-events/mux-startup.html) events.
	record Mux --Wezterm.Mux

		---Returns an array table holding all of the known`MuxDomain` objects.
		---See:
		--- - [`MuxDomain`](lua://MuxDomain)
		all_domains: function(): {MuxDomain}

		---Returns an array table holding all of the known `MuxWindow` objects.
		---See:
		--- - [`MuxWindow`](lua://MuxWindow)
		all_windows: function(): {MuxWindow}

		---Returns the name of the active workspace.
		get_active_workspace: function(): string

		---Resolves `name_or_id` to a domain and returns a `MuxDomain` object representation of it.
		---`name_or_id` can be:
		--- - A domain name string to resolve the domain by name
		--- - A domain id to resolve the domain by id
		--- - `nil` or omitted to return the current default domain
		---> Other lua types will generate a lua error
		---If the name or id don't map to a valid domain, this function will return `nil`.
		---See:
		--- - [`MuxDomain`](lua://MuxDomain)
		get_domain: function(): MuxDomain|nil

		---Resolves `name_or_id` to a domain and returns a `MuxDomain` object representation of it.
		---`name_or_id` can be:
		--- - A domain name string to resolve the domain by name
		--- - A domain id to resolve the domain by id
		--- - `nil` or omitted to return the current default domain
		---> Other Lua types will generate a Lua error
		---If the name or id don't map to a valid domain, this function will return `nil`.
		---See:
		--- - [`MuxDomain`](lua://MuxDomain)
		---@param name_or_id? string|integer
		get_domain: function(name_or_id: string|integer|nil): MuxDomain|nil

		---Given a pane ID, verifies that it is a valid pane known to the mux and returns a `Pane` object
		---that can be used to operate on the pane.
		---This is useful for situations where you have obtained a pane id from some other source and
		---want to use the various `Pane` methods with it.
		---See:
		--- - [`Pane`](lua://Pane)
		get_pane: function(pane_id: integer): Pane

		---Given a tab ID, verifies that it is a valid tab known to the mux and returns a `MuxTab` object
		---that can be used to operate on the tab.
		---This is useful for situations where you have obtained a tab ID from some other source and want to
		---use the various `MuxTab` methods with it.
		---See:
		--- - [`MuxTab`](lua://MuxTab)
		get_tab: function(tab_id: integer): MuxTab

		---Given a window ID, verifies that it is a valid window known to the mux and returns a
		---`MuxWindow` object that can be used to operate on the window.
		---This is useful for situations where you have obtained a window ID from some other source and
		---want to use the various `MuxWindow` methods with it.
		---See:
		--- - [`MuxWindow`](lua://MuxWindow)
		get_window: function(id: integer): MuxWindow

		---Returns a table containing the names of the workspaces known to the mux.
		get_workspace_names: function(): {string}

		---Renames the workspace `old` to `new`.
		---```lua
		---local wezterm = require("wezterm")
		---local active = wezterm.mux.get_active_workspace()
		---wezterm.mux.rename_workspace(active,'something different')
		---```
		rename_workspace: function(old: string, new: string): nil

		---Sets the active workspace name.
		---If the requested name doesn't correspond to an existing workspace, then an error is raised.
		set_active_workspace: function(workspace: string): nil

		---Assign a new default domain in the mux.
		---The domain that you assign here will override any configured value of `config.default_domain` or
		---the implicit assignment of the default domain that may have happened as a result of
		---starting WezTerm via `wezterm connect` or `wezterm serial`.
		---See:
		--- - [`config.default_domain`](lua://Config.default_domain)
		set_default_domain: function(domain: MuxDomain): nil

		---Spawns a program into a new window, returning the associated objects:
		---1. [`MuxTab`](lua://MuxTab)
		---2. [`Pane`](lua://Pane)
		---3. [`MuxWindow`](lua://MuxWindow)
		---```lua
		---local tab, pane, window = wezterm.mux.spawn_window {}
		---```
		---When no arguments are passed, the default program is spawned.
		---For the parameter fields, see:
		--- - [`SpawnCommand`](lua://SpawnCommand)

		---Spawns a program into a new window, returning the associated objects:
		---1. [`MuxTab`](lua://MuxTab)
		---2. [`Pane`](lua://Pane)
		---3. [`MuxWindow`](lua://MuxWindow)
		---```lua
		---local tab, pane, window = wezterm.mux.spawn_window {}
		---```
		---When no arguments are passed, the default program is spawned.
		---For the parameter fields, see:
		--- - [`SpawnCommand`](lua://SpawnCommand)
		spawn_window: function(T: SpawnCommand|nil): {MuxTab, Pane, MuxWindow}
	end

	record PluginSpec
		---The URL of the plugin repo, as provided to the `wezterm.plugin.require()` function.
		---See:
		--- - [`wezterm.plugin.require()`](lua://Wezterm.Plugin.require)
		url: string
		---The encoded name of the plugin, derived from the repo URL.
		component: string
		---The absolute location of the plugin checkout in the WezTerm runtime directory.
		---Use this to set the plugin path if needed.
		plugin_dir: string
	end

	-- local type WezTerm = Wezterm.Plugin --WezTerm.Plugin

	---The `wezterm.plugin` module provides functions to manage WezTerm plugins.
	record Plugin --Wezterm.Plugin

		---Will return a `PluginSpec` array listing all the plugin repos in the plugin directory.
		---For info on the returned array, see:
		--- - [`PluginSpec`](lua://PluginSpec)
		list: function(): {PluginSpec}

		---Will clone the plugin repo if it doesn't already exist and store it in the runtime directory
		---under `plugins/NAME` where `NAME` is derived from the repo URL.
		---_Once cloned, the repo is **NOT** automatically updated when `wezterm.plugin.require()`
		---is called again._
		---The function takes a single string parameter:
		--- - `url`: The Git repo URL.
		---Only HTTP(S) or local filesystem repos are allowed for the Git URL.
		---```lua
		---local remote_plugin = wezterm.plugin.require("https://github.com/owner/repo")
		---local local_plugin = wezterm.plugin.require("file:///Users/developer/projects/my.Plugin")
		---```
		require: function(url: string): boolean|{string: any}

		---Attempt to fast-forward or run `git pull --rebase` for each of the repos in the plugin directory.
		---Note: The configuration is not reloaded afterwards; the user will need to do that themselves.
		---A useful way to reload the configuration is with:
		--- - [`wezterm.reload_configuration()`](lua://Wezterm.reload_configuration)
		update_all: function(): nil
	end

	---The `wezterm.procinfo` module exposes functions that allow querying information about processes
	---that are running on the local system.
	record ProcInfo --Wezterm.ProcInfo

		---Returns the current working directory for the specified process ID.
		---This function may return `nil` if it was unable to return the info.
		current_working_dir_for_pid: function(pid: integer): string|nil

		---Returns the path to the executable image for the specified process ID.
		---This function may return `nil` if it was unable to return the info.
		executable_path_for_pid: function(pid: integer): string|nil

		---Returns a `LocalProcessInfo` object for the specified process ID.
		---This function may return `nil` if it was unable to return the info.
		---See:
		--- - [`LocalProcessInfo`](lua://LocalProcessInfo)
		get_info_for_pid: function(pid: integer): LocalProcessInfo|nil

		---Returns the process ID for the current process.
		pid: function(): integer
	end

	---The `wezterm.serde` module provides functions for parsing the given string as
	---JSON, YAML, or TOML, returning the corresponding Lua values, and vice versa.
	record Serde --Wezterm.Serde

		---Parses the supplied string as JSON and returns the equivalent Lua values.
		json_decode: function(value: string): table

		---Encodes the supplied Lua value as JSON.
		json_encode: function(value: table): string

		---Encodes the supplied Lua value as a pretty-printed string of JSON.
		json_encode_pretty: function(value: table): string

		---Parses the supplied string as TOML and returns the equivalent Lua values.
		toml_decode: function(value: string): table

		---Encodes the supplied Lua value as TOML.
		toml_encode: function(value: table): string

		---Encodes the supplied Lua value as a pretty-printed string of TOML.
		toml_encode_pretty: function(value: table): string

		---Parses the supplied string as YAML and returns the equivalent Lua values.
		yaml_decode: function(value: string): table

		---Encodes the supplied Lua value as YAML.
		yaml_encode: function(value: table): string
	end

	---The `wezterm.time` module exposes functions that
	---allow working with time.
	record WeztermTime

		---Arranges to call your callback function after the specified
		---number of seconds have elapsed.
		---You can use fractional seconds to delay by more precise intervals.
		call_after: function(interval: number, callback: function): nil

		---Returns a `Time` object representing the time
		---at which this function is called.
		---See [`Time`](lua://Time).
		now: function(): Time

		---Parses a string that is formatted according to the supplied format string:
		---```lua
		---wezterm.time.parse("1983 Apr 13 12:09:14.274 +0000", "%Y %b %d %H:%M:%S%.3f %z")
		------ "Time(utc: 1983-04-13T12:09:14.274+00:00)"
		---```
		---The format string supports the set of formatting placeholders
		---described [here](https://docs.rs/chrono/latest/chrono/format/strftime/index.html).
		parse: function(str: string, format: string): Time

		---Parses a string that is formatted according to `RFC 3339`
		---and returns a `Time` object representing said time.
		---Will raise an error if the input string cannot be parsed
		---according to `RFC 3339`.
		parse_rfc3339: function(str: string): Time
	end

	---The `Url` object represents a parsed URL.
	---An example:
	---```lua
	---local wezterm = require('wezterm')
	---local url = wezterm.url.parse('file://myhost/some/path%20with%20spaces')
	---assert(url.scheme == 'file')
	---assert(url.file_path == '/some/path with spaces')
	---local url = wezterm.url.parse('https://github.com/rust-lang/rust/issues?labels=E-easy&state=open')
	---assert(url.scheme == 'https')
	---assert(url.username == '')
	---assert(url.password == nil)
	---assert(url.host == 'github.com')
	---assert(url.path == '/rust-lang/rust/issues')
	---assert(url.query == 'labels=E-easy&state=open')
	---```

	record Url
		---The URL scheme such as `"file"`, or `"https"`.
		scheme: _enums.UrlType | nil
		---Decodes the path field and interprets it as a file path.
		file_path: string | nil
		---The `username` portion of the URL, or an empty string
		---if none is specified.
		username: string
		---The password portion of the URL, or `nil` if none is specified.
		password: string | nil
		---The `hostname` portion of the URL, with IDNA decoded to UTF-8.
		host: string | nil
		---The `path` portion of the URL, complete with percent encoding.
		path: string | nil
		---The `fragment` portion of the URL.
		fragment: string | nil
		---The `query` portion of the URL.
		query: string | nil
	end

	---The `wezterm.url` module exposes functions that
	---allow working with URLs.
	record WeztermUrl
		---The `Url` object represents a parsed URL.
		url: Url
	end

	record url
		---Attempts to parse the provided URL_STRING as a URL.
		---If successful, returns a `Url` object representing said URL.
		parse: function(url_string: string): Url|nil
	end

	-- COLOR =================================================================================================================================================

	---`Color` objects can be created by calling `wezterm.color.parse()` and may also be returned
	---by various WezTerm functions and methods. They represent a color that is internally stored
	---in `SRGBA` format.

	record ImageExtractorParams
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

	record TabBarColor
		---The color of the background area for the tab.
		bg_color: string | nil
		---The color of the text for the tab.
		fg_color: string | nil
		---Specify whether you want `"Half"`, `"Normal"` or `"Bold"`
		---intensity for the label shown for this tab.
		---The default is `"Normal"`.
		intensity: FormatItemAttribute | nil
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
		underline: TabBarColor | _enums.UnderlineTrinary | nil
	end

	record TabBarColors
		---The text color to use when the attributes are reset to default.
		background: string | nil
		inactive_tab_edge: string | nil
		inactive_tab_edge_hover: string | nil
	end

	---Configure the color and styling for the tab bar.
	record TabBar --: TabBarColors
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

	record Palette
		---A list of 8 colors corresponding to the basic ANSI palette.
		ansi: {integer, _enums.PaletteAnsi} | nil
		---The background color to use when the attributes are
		---reset to default.
		background: string | nil
		---A list of 8 colors corresponding to the brights.
		brights: {integer: _enums.PaletteBrights} | nil
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
		indexed: {string} | nil
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

	record Color

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

	record WeztermColor
		---This function loads an image from the specified filename
		---and analyzes it to determine a set of distinct colors present
		---in the image, ordered by how often a given color is found
		---in the image, descending.
		---For example, if an image is predominantly black with
		---a bit of white, then `black` will be listed first
		---in the returned array.
		---This is potentially useful if you wish to generate
		---a color scheme to match an image, for example.
		---The default is to extract 16 colors from an image.
		---For more info on the parameters you can use, see:
		--- - [`ImageExtractorParams`](lua://ImageExtractorParams)
		--- ---
		---The analysis is relatively expensive and can take
		---several seconds if used on a full 4K image file.
		---To reduce the runtime, WezTerm will by default
		---scale the image down and skip over nearby pixels.
		---The results of the analysis will be cached to avoid
		---repeating the same work each time the configuration
		---is re-evaluated.
		---You can find more examples [here](https://wezterm.org/config/lua/wezterm.color/extract_colors_from_image.html).
		extract_colors_from_image: function(filename: string): {string}

		---This function loads an image from the specified filename
		---and analyzes it to determine a set of distinct colors present
		---in the image, ordered by how often a given color is found
		---in the image, descending.
		---For example, if an image is predominantly black with
		---a bit of white, then `black` will be listed first
		---in the returned array.
		---This is potentially useful if you wish to generate
		---a color scheme to match an image, for example.
		---The default is to extract 16 colors from an image.
		---For more info on the parameters you can use, see:
		--- - [`ImageExtractorParams`](lua://ImageExtractorParams)
		--- ---
		---The analysis is relatively expensive and can take
		---several seconds if used on a full 4K image file.
		---To reduce the runtime, WezTerm will by default
		---scale the image down and skip over nearby pixels.
		---The results of the analysis will be cached to avoid
		---repeating the same work each time the configuration
		---is re-evaluated.
		---You can find more examples [here](https://wezterm.org/config/lua/wezterm.color/extract_colors_from_image.html).
		extract_colors_from_image: function(filename: string, params: ImageExtractorParams|nil): {string}

		---Constructs a new
		---[`Color`](lua://Color} object
		---from values in the HSL colorspace, plus `alpha`.
		---A useful source for info on parsing can be:
		--- - [`wezterm.color.parse()`](lua://Wezterm.Color.parse)
		from_hsla: function(h: string|number, s: string|number, l: string|number, a: string|number): Color

		---Returns a Lua table keyed by color scheme name,
		---whose values are the color scheme definition
		---of the builtin color schemes.
		---This is useful for programmatically deciding things
		---about the scheme to use based on its color,
		---or for taking a scheme and overriding a couple of entries
		---just from your `wezterm.lua` configuration file.
		get_builtin_schemes: function(): {string: string}

		---Returns the set of colors that would be used by default.
		---This is useful if you want to reference those colors
		---in a color scheme definition.
		get_default_colors: (function(): Palette)

		---Given a gradient spec and a number of colors,
		---returns a table holding that many colors spaced evenly
		---across the range of the gradient.
		---Returns an array of tables of type
		---[`Color`](lua://Color}.
		---This is useful, for example, to generate colors for tabs
		---or to do something fancy like interpolating colors
		---across a gradient based on the time of the day.
		---`gradient` is any [`Gradient`](lua://Gradient)
		---allowed by the `config.window_background_gradient` option.
		---See:
		--- - [`config.window_background_gradient`](lua://Config.window_background_gradient)
		gradient: function(gradient: Gradient, num_colors: number): {Color}

		---Loads a YAML file in `base16` format and returns it
		---as a WezTerm color scheme.
		---Note that wezterm ships with the `base16` color schemes
		---that were referenced via [base16-schemes-source](https://github.com/chriskempson/base16-schemes-source)
		---when the release was prepared, so this function is primarily useful
		---if you want to import a `base16` color scheme that either
		---isn't listed from the main list, or that was created
		---after your version of wezterm was built.
		---This function returns a tuple of the
		---the color definitions and the metadata.
		load_base16_scheme: function(file_name: string): (Palette, ColorSchemeMetaData)

		---Loads a wezterm color scheme from a TOML file.
		---This function returns a tuple of the the color definitions
		---and the metadata.
		---See:
		--- - [`Palette`](lua://Palette)
		--- - [`ColorSchemeMetaData`](lua://ColorSchemeMetaData)
		load_scheme: function(file_name: string): (Palette, ColorSchemeMetaData)

		---Loads a json file exported from [`terminal.sexy`](https://terminal.sexy/)
		---and returns it as a wezterm color scheme.
		---Note that wezterm ships with all of the pre-defined `terminal.sexy` color schemes,
		---so this function is primarily useful if you want to design a color scheme
		---using `terminal.sexy` and then import it to wezterm.
		---This function returns a tuple of the the color definitions and the metadata.
		---See:
		--- - [`Palette`](lua://Palette)
		--- - [`ColorSchemeMetaData`](lua://ColorSchemeMetaData)
		load_terminal_sexy_scheme: function(file_name: string): {Palette, ColorSchemeMetaData}

		---Parses the passed color and returns a
		---[`Color`](lua://Color} object.
		---`Color` objects evaluate as strings
		---but have a number of methods that allow
		---transforming and comparing colors.
		---```lua
		---local wezterm = require 'wezterm'
		---local fg = wezterm.color.parse 'yellow'
		---local bg = fg:complement_ryb():darken(0.2)
		---return {
		---  colors = {
		---    foreground = fg,
		---    background = bg,
		---  },
		---}
		---```
		parse: function(color_name: string): Color

		---Saves a color scheme as a wezterm TOML file.
		---This is useful when sharing your custom
		---color scheme with others.
		---While you could share the Lua representation
		---of the scheme, the TOML file is recommended
		---for sharing as it is purely declarative:
		---no executable logic is present in the
		---TOML color scheme which makes it safe
		---to consume "random" schemes from the internet.
		---You may find examples [here](https://wezterm.org/config/lua/wezterm.color/save_scheme.html).
		save_scheme: function(colors: Palette, metadata: PaneMetadata, file_name: string): nil
		end


	-- PANE ================================================================================================================================================================


	record SpawnSplit --: SpawnTab
		direction: _enums._Direction | nil
		top_level: boolean | nil
		size: number | nil
	end

	record PaneMetadata
		---A boolean value that is populated only for local panes.
		---It is set to `true` if it appears as though the local PTY is configured for password entry
		---(local echo disabled, canonical input mode enabled).
		password_input: boolean
		---A boolean value that is populated only for multiplexer client panes.
		---It is set to `true` if wezterm is waiting for a response from the multiplexer server.
		---This can be used in conjunction with:
		--- - [`PaneMetaData.since_last_response_ms`](lua://PaneMetadata.since_last_response_ms)
		is_tardy: boolean
		---An integer value that is populated only for multiplexer client panes.
		---It is set to the number of elapsed milliseconds since the most recent response from
		---the multiplexer server.
		since_last_response_ms: integer
	end

	---Mirrors `RenderableDimensions` in wezterm upstream:
	---https://github.com/wezterm/wezterm/blob/main/mux/src/renderable.rs

	record RenderableDimensions
		---The number of columns.
		cols: integer
		---The top of the physical non-scrollback screen expressed as a stable index.
		physical_top: integer
		---The total number of lines in the scrollback and viewport.
		scrollback_rows: integer
		---The top of the scrollback; the earliest row remembered by wezterm.
		scrollback_top: integer
		---The number of vertical cells in the visible portion of the window.
		viewport_rows: integer
		---The effective DPI for this pane.
		dpi: integer
		---The width of the pane in pixels.
		pixel_width: integer
		---The height of the pane in pixels.
		pixel_height: integer
		---Whether the lines should be rendered with reverse video.
		reverse_video: boolean
	end

	record SemanticZone
		start_x: integer
		start_y: integer
		end_x: integer
		end_y: integer
		semantic_type: _enums.SemanticZoneType
	end

	---A handle to a live instance of a Pane that is known to the wezterm process.
	---It tracks the pseudo terminal (or real serial terminal) and associated process(es) and
	---the parsed screen and scrollback. Also, it's typically passed to your code via an event callback.
	---A `Pane` object can be used to send input to the associated processes and introspect the state
	---of the terminal emulation for that pane.
	---In previous releases there were separate `MuxPane` and `Pane` objects created by
	---the mux and GUI layers, respectively. This is no longer the case: there is now just
	---the underlying mux pane which is referred to in these docs as `Pane` for the sake of simplicity.
	record Pane

		---Activates (focuses) the pane and its containing tab.
		activate: function(self: Pane): nil

		---~~Returns the current working directory of the pane, if known.~~
		---This method now returns a `Url` object which provides a convenient way to decode and operate
		---on said URL.
		------
		---The current directory can be specified by an application sending `OSC 7`.
		---If `OSC 7` was never sent to a pane, and the pane represents a locally spawned process,
		---then WezTerm will:
		--- - On UNIX systems: determie the process group leader attached to the PTY
		--- - On Windows systems: use heuristics to infer an equivalent to the foreground process
		---With the process identified, wezterm will then try to determine the current working directory
		---using operating system dependent code.
		---If the current working directory is not known then this method returns `nil`. Otherwise
		---it returns the current working directory as a `URL` string.
		---Note that while the current working directory is usually a file path, it is possible for
		---an application to set it to an FTP URL or some other kind of URL, which is why this method
		---doesn't simply return a file path string
		get_current_working_dir: function(self: Pane): Url|nil

		---Returns a Lua representation of the `StableCursorPosition` struct that identifies
		---the cursor's position, visibility and shape.
		---See:
		--- - [`StableCursorPosition`](lua://StableCursorPosition)
		get_cursor_position: function(self: Pane): StableCursorPosition

		---Returns a Lua representation of the `RenderableDimensions` struct that identifies the dimensions
		---and position of the viewport, as well as the scrollback for the pane.
		---See:
		--- - [`RenderableDimensions`](lua://RenderableDimensions)
		get_dimensions: function(self: Pane): RenderableDimensions

		---Returns the name of the domain with which the pane instance is associated to.
		get_domain_name: function(self: Pane): string

		---Returns a `LocalProcessInfo` object corresponding to the current foreground process that is
		---running in the pane.
		---This method has some restrictions and caveats:
		--- - This information is only available for local panes. Multiplexer panes do not report
		---   this information. Similarly, if you are using eg: ssh to connect to a remote host, you
		---   won't be able to access the name of the remote process that is running
		--- - On UNIX systems, the process group leader (the foreground process) will be queried, but
		---   that concept doesn't exist on Windows. Instead, the process tree of the originally spawned
		---   program is examined, and the most recently spawned descendant is assumed to be the
		---   foreground process
		--- - On Linux, macOS and Windows, the process can be queried to determine this path.
		---   Other operating systems (notably, FreeBSD and other UNIX systems) are currently not supported
		--- - Querying the path may fail for a variety of reasons outside of the control of WezTerm
		--- - Querying process information has some runtime overhead, which may cause WezTerm to slow down
		---   if over-used
		---If the process cannot be determined then this method returns `nil`.
		---See:
		--- - [`LocalProcessInfo`](lua://LocalProcessInfo)
		get_foreground_process_info: function(self: Pane): LocalProcessInfo|nil

		---Returns the path to the executable image for the pane.
		---This method has some restrictions and caveats:
		--- - This information is only available for local panes. Multiplexer panes do not report
		---   this information. Similarly, if you are using e.g. `ssh` to connect to a remote host, you
		---   won't be able to access the name of the remote process that is running
		--- - On UNIX systems, the process group leader (the foreground process) will be queried, but that
		---   concept doesn't exist on Windows, so instead, the process tree of the originally spawned
		---   program is examined, and the most recently spawned descendant is assumed to be the
		---   foreground process
		--- - On Linux, macOS and Windows, the process can be queried to determine this path. Other
		---   operating systems (notably, FreeBSD and other UNIX systems) are currently not supported
		--- - Querying the path may fail for a variety of reasons outside of the control of WezTerm
		--- - Querying process information has some runtime overhead, which may cause WezTerm to slow down
		---   if over-used
		---If the path is not known then this method returns `nil`.
		get_foreground_process_name: function(self: Pane): string|nil

		---Returns the textual representation (including color and other attributes) of the physical lines
		---of text in the viewport as a string with embedded ANSI escape sequences to preserve the color
		---and style of the text.
		---A physical line is a possibly-wrapped line that composes a row in the terminal display matrix.
		---If the optional `nlines` argument is specified then it is used to determine how many
		---lines of text should be retrieved.
		---The default (if `nlines` is not specified) is to retrieve the number of lines in the viewport
		---(the height of the pane).
		---To obtain the entire scrollback, you can do something like this:
		---```lua
		---pane:get_lines_as_escapes(pane:get_dimensions().scrollback_rows)
		---```
		get_lines_as_escapes: function(self: Pane): string

		---Returns the textual representation (including color and other attributes) of the physical
		---lines of text in the viewport as a string with embedded ANSI escape sequences to preserve
		---the color and style of the text.
		---A physical line is a possibly-wrapped line that composes a row in the terminal display matrix.
		---If the optional `nlines` argument is specified then it is used to determine how many
		---lines of text should be retrieved.
		---The default (if `nlines` is not specified) is to retrieve the number of lines in the viewport
		---(the height of the pane).
		---To obtain the entire scrollback, you can do something like this:
		---```lua
		---pane:get_lines_as_escapes(pane:get_dimensions().scrollback_rows)
		---```
		get_lines_as_escapes: function(self: Pane, nlines: integer|nil): string

		---Returns the textual representation (not including color or other attributes) of the physical
		---lines of text in the viewport as a string.
		---A physical line is a possibly-wrapped line that composes a row in the terminal display matrix.
		---If you'd rather operate on logical lines, use `pane:get_logical_lines_as_text()`.
		---If the optional `nlines` argument is specified then it is used to determine how many lines of text
		---should be retrieved.
		---The default (if `nlines` is not specified) is to retrieve the number of lines in the viewport
		---(the height of the pane).
		---The lines have trailing space removed from each line. They will be joined together in the
		---returned string separated by a `\n` character. Trailing blank lines are stripped, which
		---may result in fewer lines being returned than you might expect if the pane only had
		---a couple of lines of output.
		get_lines_as_text: function(self: Pane): string

		---Returns the textual representation (not including color or other attributes) of the physical
		---lines of text in the viewport as a string.
		---A physical line is a possibly-wrapped line that composes a row in the terminal display matrix.
		---If you'd rather operate on logical lines, use `pane:get_logical_lines_as_text()`.
		---If the optional `nlines` argument is specified then it is used to determine how many
		---lines of text should be retrieved. The default (if `nlines` is not specified) is to retrieve
		---the number of lines in the viewport (the height of the pane).
		---The lines have trailing space removed from each line. They will be joined together in the
		---returned string separated by a `\n` character. Trailing blank lines are stripped, which may
		---result in fewer lines being returned than you might expect if the pane only had a couple of lines
		---of output.
		get_lines_as_text: function(self: Pane, nlines: integer|nil): string

		---Returns the textual representation (not including color or other attributes) of the logical lines
		---of text in the viewport as a string.
		---A logical line is an original input line prior to being wrapped into physical lines to composes
		---rows in the terminal display matrix. WezTerm doesn't store logical lines, but can recompute them
		---from metadata stored in physical lines.
		---Excessively long logical lines are force-wrapped to constrain the cost of rewrapping
		---on resize and selection operations.
		---If you'd rather operate on physical lines, see `pane:get_lines_as_text()`.
		---If the optional `nlines` argument is specified then it is used to determine
		---how many lines of text should be retrieved.
		---The default (if `nlines` is not specified) is to retrieve the number of lines
		---in the viewport (the height of the pane).
		---The lines have trailing space removed from each line.
		---They will be joined together in the returned string separated by a `\n` character.
		---Trailing blank lines are stripped, which may result in fewer lines being returned
		---than you might expect if the pane only had a couple of lines of output.
		---To obtain the entire scrollback, you can do something like this:
		---```lua
		---pane:get_logical_lines_as_text(pane:get_dimensions().scrollback_rows)
		---```
		get_logical_lines_as_text: function(self: Pane): string

		---Returns the textual representation (not including color or other attributes) of the logical lines
		---of text in the viewport as a string.
		---A logical line is an original input line prior to being wrapped into physical lines to composes
		---rows in the terminal display matrix. WezTerm doesn't store logical lines, but can recompute them
		---from metadata stored in physical lines.
		---Excessively long logical lines are force-wrapped to constrain the cost of rewrapping
		---on resize and selection operations.
		---If you'd rather operate on physical lines, see `pane:get_lines_as_text()`.
		---If the optional `nlines` argument is specified then it is used to determine
		---how many lines of text should be retrieved.
		---The default (if `nlines` is not specified) is to retrieve the number of lines
		---in the viewport (the height of the pane).
		---The lines have trailing space removed from each line.
		---They will be joined together in the returned string separated by a `\n` character.
		---Trailing blank lines are stripped, which may result in fewer lines being returned
		---than you might expect if the pane only had a couple of lines of output.
		---To obtain the entire scrollback, you can do something like this:
		---```lua
		---pane:get_logical_lines_as_text(pane:get_dimensions().scrollback_rows)
		---```
		get_logical_lines_as_text: function(self: Pane, nlines: integer|nil): string

		---Returns metadata about a pane.
		---The return value depends on the instance of the underlying pane. If the pane doesn't support
		---this method, `nil` will be returned. Otherwise, the value is a Lua table with the metadata
		---contained in table fields.
		---To consume this value, it is recommend to use logic like this
		---to obtain a table value even if the pane doesn't
		---support this method:
		---```lua
		---local meta = pane:get_metadata() or {}
		---```
		---See:
		--- - [`PaneMetadata`](lua://PaneMetadata)
		get_metadata: function(self: Pane): PaneMetadata|nil

		---Returns the progress state associated with the pane.
		---By default, when the terminal is reset, the progress state will be `"None"` to indicate that
		---no progress has been reported.
		---Mirrors the `get_progress` Lua binding in wezterm upstream:
		---https://github.com/wezterm/wezterm/blob/main/lua-api-crates/mux/src/pane.rs
		get_progress: function(self: Pane): PaneProgress

		---Resolves the semantic zone that encapsulates the supplied `x` and `y` coordinates.
		--- - `x` is the cell column index, where `0` is the left-most column
		--- - `y` is the stable row index
		---Use `pane:get_dimensions()` to retrieve the currently valid stable index values for the top of
		---scrollback and top of viewport.
		get_semantic_zone_at: function(self: Pane, x: integer, y: integer): SemanticZone

		---When `zone_type` is omitted, returns the list of all semantic zones defined in the pane.
		---Otherwise it returns the list of all semantic zones of the matching type.
		---Valid values for `zone_type` are:
		--- - `"Input"`
		--- - `"Output"`
		--- - `"Prompt"`
		get_semantic_zones: function(self: Pane): {SemanticZone}

		get_semantic_zones: function(self: Pane, zone_type: _enums.SemanticZoneType): {SemanticZone}

		---Returns the text from the specified region.
		--- - `start_x` and `end_x` are the starting and ending cell column, where `0` is the left-most cell
		--- - `start_y` and `end_y` are the starting and ending row, expressed as a stable row index
		---Use `pane:get_dimensions()` to retrieve the currently valid stable index values for the top
		---of scrollback and top of viewport
		---The text within the region is unwrapped to its logical line representation, rather than the
		---_wrapped-to-physical-display-width_.
		get_text_from_region: function(self: Pane, end_x: integer, start_y: integer, end_x: integer, end_y: integer): string

		---This is a convenience method that calls `Pane:get_text_from_region()` on the supplied
		---zone parameter.
		---Use `Pane:get_semantic_zone_at()` or `Pane:get_semantic_zones()` to obtain a zone.
		get_text_from_semantic_zone: function(self: Pane, zone: SemanticZone): string

		---Returns the title of the pane.
		---This will typically be wezterm by default but can be modified by applications that send `OSC 1`
		---(Icon/Tab title changing) and/or `OSC 2` (Window title changing) escape sequences.
		---The value returned by this method is the same as that used to display the tab title if this pane
		---were the only pane in the tab; if `OSC 1` was used to set a non-empty string then that string
		---will be returned. Otherwise the value for `OSC 2` will be returned.
		---Note that on Windows the default behavior of the OS level PTY is to implicitly send `OSC 2`
		---sequences to the terminal as new programs attach to the console.
		---If the title text is `"wezterm"` and the pane is a local pane, then WezTerm will attempt
		---to resolve the executable path of the foreground process that is associated with the pane, and
		---will use that instead of `wezterm`.
		get_title: function(self: Pane): string

		---Returns the tty device name, or `nil` if the name is unavailable.
		--- - This information is only available for local panes. Multiplexer panes do not report
		---   this information. Similarly, if you are using e.g. `ssh` to connect to a remote host, you
		---   won't be able to access the name of the remote process that is running
		--- - This information is only available on UNIX systems. Windows systems do not have
		---   an equivalent concept
		get_tty_name: function(self: Pane): string|nil

		---Returns a table holding the user variables that have been assigned to this `Pane` instance.
		---User variables are set using an escape sequence defined by `iterm2`, but also recognized
		---by WezTerm.
		get_user_vars: function(self: Pane): {string: string}

		---Returns `true` if there has been output in the pane
		---since the last time the pane was focused.
		---See also `PaneInformation.has_unseen_output` for an example
		---using equivalent information to color tabs based on this state.
		has_unseen_output: function(self: Pane): boolean

		---Sends text, which may include escape sequences, to the output side of the current pane.
		---The text will be evaluated by the terminal emulator and can thus be used to inject/force
		---the terminal to process escape sequences that adjust the current mode, as well as sending
		---human-readable output to the terminal.
		---Note that if you move the cursor position as a result of using this method you should expect
		---the display to change and for text UI programs to get confused.
		inject_output: function(self: Pane, text: string): nil

		---Returns whether the alternate screen is active for the pane.
		---The alternate screen is a secondary screen that is activated by certain escape codes.
		---It has no scrollback, which makes it ideal for a "full-screen" terminal program
		---(e.g. `vim` or `less`) to do whatever they want on the screen without fear of destroying
		---the user's scrollback. These programs emit escape codes to return to the normal screen
		---when they exit.
		is_alt_screen_active: function(self: Pane): boolean

		---Creates a new tab in the window that contains a pane, and moves the current pane into that tab.
		---Returns a tuple of the newly created:
		--- 1. [`MuxTab`](lua://MuxTab)
		--- 2. [`MuxWindow`](MuxWindow)
		---@return MuxTab tab
		move_to_new_tab: function(self: Pane): MuxWindow

		---Creates a window and moves pane into that window.
		---The `workspace` parameter is optional; if specified, it will be used as the name of the workspace
		---that should be associated with the new window. Otherwise the current active workspace
		---will be used.
		---Returns a tuple of the newly created:
		--- 1. [`MuxTab`](lua://MuxTab)
		--- 2. [`MuxWindow`](MuxWindow)
		move_to_new_window: function(self: Pane, workspace: string|nil): {string|nil, MuxWindow}

		---Returns the id number for the pane.
		---The ID is used to identify the pane within the internal multiplexer and can be used when
		---making API calls via the WezTerm CLI to indicate the subject of manipulation.
		pane_id: function(self: Pane): integer

		---Alias of `Pane:send_paste()` for backwards compatibility with prior releases.
		paste: function(self: Pane, text: string): nil

		---Sends the supplied text string to the input of the pane as if it were pasted from the clipboard,
		---except that the clipboard is not involved.
		---Newlines are rewritten according to:
		--- - [`config.canonicalize_pasted_newlines`](lua://Config.canonicalize_pasted_newlines)
		---If the terminal attached to the pane is set to bracketed paste mode then the text will be sent
		---as a bracketed paste, and newlines will not be rewritten.
		send_paste: function(self: Pane, text: string): nil

		---Sends text to the pane as-is.
		send_text: function(self: Pane, text: string): nil

		---Splits the `Pane` instance and spawns a program into said split, returning the `Pane` object
		---associated with it.
		---When no arguments are passed, the pane is split in half left/right and the right half has
		---the default program spawned into it.
		---For available args, see:
		--- - [`SpawnSplit`](lua://SpawnSplit)
		split: function(self: Pane, args: SpawnSplit|nil): Pane

		---Returns the `MuxTab` that contains this pane.
		---Note that this method can return `nil` when the pane is a GUI-managed overlay pane
		---(such as the debug overlay), because those panes are not managed by the mux layer.
		---See:
		--- - [`MuxTab`](lua://MuxTab)
		tab: function(self: Pane): MuxTab|nil

		---Returns the `MuxWindow` object containing the tab this pane is in.
		---See:
		--- - [`MuxWindow`](lua://MuxWindow)
		window: function(self: Pane): MuxWindow
	end


	-- MUX-TAB ================================================================================================================================================================

	record MuxSize
		rows: integer
		cols: integer
		pixel_width: integer
		pixel_height: integer
		dpi: number
	end

	---Mirrors `MuxPaneInfo` in WezTerm upstream:
	---https://github.com/wezterm/wezterm/blob/main/lua-api-crates/mux/src/lib.rs
	record PaneInfo --MuxTab.PaneInfo
		---The topological pane index.
		index: integer
		---If `true` then this is the active pane within this tab.
		is_active: boolean
		---Is `true` if the pane is in the zoomed state.
		is_zoomed: boolean
		---The offset from the top left corner of the containing tab to the top left corner of this pane,
		---in cells.
		left: integer
		---The offset from the top left corner of the containing tab to the top left corner of this pane,
		---in cells.
		top: integer
		---The width of the pane in cells.
		width: integer
		---The height of the pane in cells.
		height: integer
		---The width of the pane in pixels.
		pixel_width: integer
		---The height of the pane in pixels.
		pixel_height: integer
		---A `Pane` object.
		pane: Pane
	end

	---`MuxTab` represents a tab that is managed by the multiplexer.
	record MuxTab

		---Activates (focuses) the tab.
		activate: function(self: MuxTab): nil

		---A convenience accessor for returning the active pane in the tab.
		active_pane: function(self: MuxTab): Pane

		---Returns the pane adjacent to the active pane of the current tab, in the `direction` direction.
		---See:
		--- - [`ActivatePaneDirection`](https://wezterm.org/config/lua/keyassignment/ActivatePaneDirection.html)
		get_pane_direction: function(self: MuxTab, direction: _enums.Direction): Pane

		---Returns the overall size of the tab, taking into account all of the contained panes.
		---See:
		--- - [`MuxSize`](lua://MuxSize)
		get_size: function(self: MuxTab): MuxSize

		---Returns the tab title as set by `MuxTab:set_title()`.
		---See:
		--- - [`MuxTab:set_title()`](lua://MuxTab.set_title)
		get_title: function(self: MuxTab): string

		---Returns an array table containing the set of `Pane` objects contained by this tab.
		---See:
		--- - [`Pane`](lua://Pane)
		panes: function(self: MuxTab): {Pane}

		---Returns an array table containing an extended info entry for each of the panes contained
		---by this tab.
		---See:
		--- - [`MuxTab.PaneInfo`](lua://MuxTab.PaneInfo)
		panes_with_info: function(self: MuxTab): {PaneInfo}

		---Rotates the panes in the clockwise direction.
		rotate_clockwise: function(self: MuxTab): nil

		---Rotates the panes in the counter-clockwise direction.
		rotate_counter_clockwise: function(self: MuxTab): nil

		---Sets the tab title to the provided string.
		set_title: function(self: MuxTab, title: string): nil

		---Sets the zoomed state for the active pane within the current tab.
		---A zoomed pane takes up all available space in the tab, hiding all other panes while it is zoomed.
		--- - Switching its zoom state off will restore the prior split arrangement
		--- - Setting the zoom state to `true` zooms the pane if it wasn't already zoomed
		--- - Setting the zoom state to `false` un-zooms the pane if it was zoomed
		---Returns the prior zoom state.
		set_zoomed: function(self: MuxTab, state: boolean): boolean

		---Returns the tab ID.
		tab_id: function(self: MuxTab): integer

		---Returns the `MuxWindow` bject that contains this tab.
		window: function(self: MuxTab): MuxWindow
	end


	-- MUX-WINDOW ================================================================================================================================================================

	record TabInfo --MuxWindow.TabInfo
		---The 0-based tab index.
		index: integer
		---A `boolean` indicating whether this is the active tab within the window.
		is_active: boolean
		---A `MuxTab` object.
		tab: MuxTab
	end

	record SpawnTab
		---Specifies the argument array for the command that should be spawned.
		---If omitted the default program for the domain will be spawned.
		args: {string} | nil
		---Specifies the current working directory that should be used for the program.
		---If unspecified, it'll follow the spec from `config.default_cwd`.
		---See:
		--- - [`config.default_cwd`](lua://Config.default_cwd)
		cwd: string | nil
		---Specifies the multiplexer domain into which the program should be spawned.
		---The default value is assumed to be `"CurrentPaneDomain"`, which causes the domain
		---from the currently active pane to be used.
		domain: {string: string} -- WORKAROUND; SHOULD BE: _aliases.SpawnTabDomain|NamedDomain|nil
		---Sets additional environment variables in the environment for this command invocation.
		set_environment_variables: {string, any} | nil
	end

	---`MuxWindow` represents a window that is managed by the multiplexer.
	record MuxWindow

		---A convenience accessor for returning the active pane in the active tab of the window.
		---See:
		--- - [`Pane`](lua://Pane)
		active_pane: function(self: MuxWindow): Pane

		---A convenience accessor for returning the active tab within the window.
		active_tab: function(self: MuxWindow): MuxTab

		---Returns the window title as set by `OSC 0`, `OSC 2` in a contained pane, or through
		---`MuxWindow:set_title()`.
		---See:
		--- - [`MuxWindow:set_title()`](lua://MuxWindow.set_title)
		get_title: function(self: MuxWindow): string

		---Returns the name of the workspace to which the window belongs.
		get_workspace: function(self: MuxWindow): nil

		---Attempts to resolve this mux window to its corresponding _"GUI Window"_.
		---This may not succeed for a couple of reasons:
		--- - If called by the multiplexer daemon, there is no GUI, so this will never succeed
		--- - If the mux window is part of a workspace that is not the active one
		---This method is the inverse of `Window:mux_window()`.
		---See:
		--- - [`Window:mux_window()`](lua://Window.mux_window)
		gui_window: function(self: MuxWindow):Window

		---Sets the window title to the provided string.
		---Note that applications may subsequently change the title via escape sequences.
		set_title: function(self: MuxWindow, title: string): nil

		---Changes the name of the workspace to which the window belongs to.
		set_workspace: function(self: MuxWindow, name: string): nil

		---Spawns a program into a new tab within this window, returning the `MuxTab`, `Pane`
		---and `MuxWindow` objects associated with it.
		---When no arguments are passed, the default program is spawned.
		---See:
		--- - [`MuxTab`](lua://MuxTab)
		--- - [`MuxWindow`](lua://MuxWindow)
		--- - [`Pane`](lua://Pane)
		---@return MuxTab tab
		---@return Pane pane
		spawn_tab: function(self: MuxWindow): {MuxTab, Pane}

		---Spawns a program into a new tab within this window, returning the `MuxTab`, `Pane`
		---and `MuxWindow` objects associated with it.
		---When no arguments are passed, the default program is spawned.
		---See:
		--- - [`MuxTab`](lua://MuxTab)
		--- - [`MuxWindow`](lua://MuxWindow)
		--- - [`Pane`](lua://Pane)
		---@param args? 
		---@return MuxTab tab
		---@return Pane pane
		spawn_tab: function(self: MuxWindow, args: SpawnTab | nil): {MuxTab, Pane}

		---Returns an array table holding each of the `MuxTab` objects contained within this window.
		tabs: function(self: MuxWindow): {MuxTab}

		---Returns an array table holding an extended info entry for each of the tabs contained
		---within this window.
		tabs_with_info: function(self: MuxWindow): {TabInfo}

		---Returns the window multiplexer ID.
		window_id: function(self: MuxWindow): integer
	end

	---Describes a `Pane` object.
	---Unlike the `Pane` object, `PaneInformation` is a snapshot of some of the key characteristics
	---of the pane, intended for use in synchronous, fast, event callbacks that format GUI elements
	---such as the window and tab title bars.
	---Mirrors `PaneInformation` in wezterm upstream:
	---https://github.com/wezterm/wezterm/blob/main/wezterm-gui/src/termwindow/mod.rs
	---See:
	--- - [`PaneInformation`](lua://PaneInformation)
	--- - [`Pane`](lua://Pane)
	record PaneInformation
		---The height of the pane in cells.
		height: integer
		---Is `true` if the pane is the active pane within its containing tab.
		is_active: boolean
		---Is `true` if the pane is in the zoomed state.
		is_zoomed: boolean
		---The cell `x` coordinate of the left edge of the pane.
		left: integer
		---The height of the pane in pixels.
		pixel_height: integer
		---The pane ID.
		pane_id: integer
		---The logical position of the pane within its containing layout.
		pane_index: integer
		---The width of the pane in pixels.
		pixel_width: integer
		---The progress state, per `Pane:get_progress()` at the time the pane information was captured.
		---See:
		--- - [`Pane:get_progress()`](lua://Pane.get_progress)
		progress: PaneProgress
		---The title of the pane,
		---per [`Pane:get_title()`](lua://Pane.get_title)
		---at the time the pane information was captured.
		title: string
		---The cell `y` coordinate of the top edge of the pane.
		top: integer
		---The user variables defined for the pane,
		---per [`Pane:get_user_vars()`](lua://Pane.get_user_vars)
		---at the time the pane information was captured.
		user_vars: {string: string}
		---The width of the pane in cells.
		width: integer
		---The path to the executable image, per `Pane:get_foreground_process_name()`.
		---If the path is unavailable then this field will be an empty string.
		---For more information, see:
		--- - [`Pane:get_foreground_process_name()`](lua://Pane.get_foreground_process_name)
		foreground_process_name: string
		---The current working directory, per `Pane:get_current_working_dir()`.
		---For more information, see:
		--- -[`Pane:get_current_working_dir()`](lua://Pane.get_current_working_dir)
		current_working_dir: Url | nil
		---Returns `true` if there has been output in the pane
		---since the last time the pane was focused.
		has_unseen_output: boolean
		---The name of the domain with which the pane is associated, per `Pane:get_domain_name()`.
		---If the domain name is unavailable then this field will be an empty string.
		---For more information, see:
		--- - [`Pane:get_domain_name()`](lua://Pane.get_domain_name)
		domain_name: string
		---The tty device name, per `Pane:get_tty_name()`.
		---For more information, see:
		--- - [`Pane:get_tty_name()`](lua://Pane.get_tty_name)
		tty_name: string | nil
	end

	---Represents the `BackgroundLayer` type.
	 record BackgroundLayer
		---Controls whether the layer is fixed to the viewport or moves as it scrolls:
		--- - `"Fixed"`: (default) to not move as the window scrolls
		--- - `"Scroll"`: To scroll 1:1 with the number of pixels scrolled
		---             in the viewport
		--- - `{ Parallax = 0.1 }`: To scroll `1:10` with the number of pixels
		---                       scrolled in the viewport
		attachment: _enums.BackgroundLayerAttachments | nil|{ _enums.Parallax: number }
		---Controls the height of the image.
		---The following values are accepted:
		--- - `"Cover"`: (default) scales the image, preserving aspect ratio, to the smallest
		--- -          possible size to fill the viewport, leaving no empty space.
		--- -          If the aspect ratio of the viewport differs from the image, the image is cropped
		--- - `"Contain"`: Scales the image as large as possible without cropping or stretching.
		--- -            If the viewport is larger than the image, tiles the image
		--- -            unless `repeat_y` is set to `"NoRepeat"`
		--- - `123`: Specifies a height of `123` pixels
		--- - `"50%"`: Specifies a size of `50%` of the viewport height
		--- - `"2cell"`: Specifies a size equivalent to 2 rows
		height: _enums._CoverOrContain|number|nil
		---Controls the initial horizontal position of the layer, relative to the viewport:
		--- - `"Left"` (default)
		--- - `"Center"`
		--- - `"Right"`
		horizontal_align: _enums.HorizontalAlign | nil
		---`vertical_offset` is identical to this one, but it affects the y-direction.
		---See:
		--- - [`vertical_offset`](lua://BackgroundLayer.vertical_offset)
		horizontal_offset: number | nil|string
		---A _hue_, _saturation_ and _brightness_ transformation that can be used
		---to adjust those attributes of the layer.
		---For more information about this kind of transform, see:
		--- - [`HsbTransform`](lua://HsbTransform)
		hsb: HsbTransform | nil
		---A number in the range `0.0` through `1.0` inclusive that is multiplied
		---with the alpha channel of the source to adjust the opacity of the layer.
		---The default is `1.0` to use the source alpha channel as-is.
		---Using a smaller value makes the layer less opaque/more transparent.
		opacity: number | nil
		---Controls whether the image is repeated in the x-direction:
		--- - `"Repeat"`: Repeat as much as possible to cover the area.
		---             The last image will be clipped if it doesn't fit.
		---             This is the default
		--- - `"Mirror"`: Like `"Repeat"` except that the image is alternately mirrored which can
		---             make images that don't tile seamlessly look a bit better when repeated
		--- - `"NoRepeat"`: The image is not repeated
		repeat_x: _enums.BackgroundLayerRepeat | nil
		---Normally, when repeating, the image is tiled based on its width
		---such that each copy of the image is immediately adjacent to
		---the preceding instance.
		---You may set `repeat_x_size` to a different value to _increase_
		---or _decrease_ the space between the repeated instances:
		--- - number values in pixels
		--- - string values like `"100%"` to specify a size relative to the viewport
		--- - `"10cell"` to specify a size based on the terminal cell metrics
		repeat_x_size: string|nil|number
		---`repeat_x` is identical to this one, but it affects the y-direction.
		---See:
		--- - [`repeat_x`](lua://BackgroundLayer.repeat_x)
		repeat_y: _enums.BackgroundLayerRepeat|nil
		---`repeat_x_size` is identical to this one, but it affects the y-direction.
		---See:
		--- - [`repeat_x_size`](lua://BackgroundLayer.repeat_x_size)
		repeat_y_size: number | nil|string
		---Defines the source of the layer texture data.

		record _File where self._tl_type == "Gradient"
			_tl_type: string
			File: string
			speed: number|nil
		end
		record _Gradient where self._tl_type == "Gradient"
			_tl_type: string
			Gradient: Gradient
			Color: string
		end
		source: _File|_Gradient|nil
		---Controls the initial vertical position of the layer, relative to the viewport:
		--- - `"Top"` (default)
		--- - `"Middle"`
		--- - `"Bottom"`
		vertical_align: _enums.VerticalAlign|nil
		---Specifies an offset from the initial vertical position:
		--- - number values in pixels
		--- - string values like `"100%"` to specify a size relative to the viewport
		--- - `"10cell"`: to specify a size based on terminal cell metrics
		vertical_offset: number|string|nil
		---Controls the width of the image.
		---Same details as `height` but applied to the x-direction.
		---See:
		--- - [`height`](lua://BackgroundLayer.height)
		width: _enums._CoverOrContain|number|nil
	end

end

return _Shared
