-- vim: ft=teal expandtab sw=3 ts=3

-- require("_shared")
-- require("_enums")

global enum WeztermEvent
   "TODO"
end

global enum ActionString
    "TODO"
end

global type EventCallback = (function(): TODO)
-- function|CallbackWindowPane|CallbackInputSelector|CallbackPromptInputLine
   
global record Config
   --[[from docs: https://wezterm.org/config/lua/config/index.html

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
   ]]
end

global record WeztermColor
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


global record wezterm

end


global record WeztermConfig

end

global record Events

end

global record Harfbuzz

end

global record Color

end

global record Gui

end

global record Mux

end

global record Nerdfonts

end

global record ProcInfo

end

global record Serde

end

global record Time

end

global record Url

end

global record WindowDecorations

end
