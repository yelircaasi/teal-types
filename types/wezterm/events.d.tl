local type GuiEvent =
	"gui-attached"|"gui-startup"
local type TabsetsEvent =
	"delete_tabset"|"load_tabset"|"rename_tabset"|"save_tabset"
local type MultiplexerEvent =
	"mux-is-process-stateful"|"mux-startup"

local type WindowEvent =
	"augment-command-palette"
	| "bell"
	| "format-tab-title"
	| "format-window-title"
	| "new-tab-button-click"
	| "open-uri"
	| "update-status"
	| "user-var-changed"
	| "window-config-reloaded"
	| "window-focus-changed"
	| "window-resized"

local type DevWeztermEvent =
	"dev.wezterm-plugin-not-found"
	| "dev.wezterm.invalid_hashkey"
	| "dev.wezterm.invalid_opts"
	| "dev.wezterm.no_keywords"
	| "dev.wezterm.require_path_not_set"

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
