---@diagnostic disable:unused-local

local type Sigil.Padding boolean|"left"|"right"|"both"
local type Sigil.FormatItem string|table

local record Sigil.Entry
	key: string | nil Normalized registry key.
	name: string | nil Human-readable display name.
	icon: string Icon glyph.
	color: string | nil Icon color.
	aliases: string | nil[] Alternative lookup names.
end

local record Sigil.FallbackConfig
	enabled: boolean Return a fallback entry when no key matches.
	icon: string Fallback icon.
	color: string Fallback color.
	name: string Fallback display name.

local record Sigil.FormattingConfig
	reset: boolean Append `ResetAttributes` after formatted icons.
	padding: Sigil.Padding Default icon padding.

local record Sigil.Config
	fallback: Sigil.FallbackConfig
	formatting: Sigil.FormattingConfig
	overrides: table<string, Sigil.Entry> Entry overrides merged into defaults.
	symbols: table<string, any> Symbol overrides merged into defaults.

local record Sigil.LookupOptions
	fallback: boolean | nil Return fallback entry when no key matches.
end

local record Sigil.ItemsOptions: Sigil.LookupOptions
	padding: Sigil | nil.Padding Padding to apply around the icon.
	reset: boolean | nil Append `ResetAttributes` after the icon.
end

local record Sigil
	config: Sigil.Config
local M = {}

---Configure Sigil.
---@param opts? table Partial Sigil configuration.
setup: function(opts): Sigil.Config

---Register or replace a Sigil entry.
add: function(key: string Lookup key., entry: Sigil.Entry Entry to register.): Sigil.Entry

---Return a Sigil entry by key or alias.
---@param key any Lookup key.
---@param opts? Sigil.LookupOptions Lookup options.
get: function(key, opts): Sigil.Entry|nil|? | nil

---Return only the icon for a key or alias.
---@param key any Lookup key.
---@param opts? Sigil.LookupOptions Lookup options.
icon: function(key, opts): string|nil|? | nil

---Return only the color for a key or alias.
---@param key any Lookup key.
---@param opts? Sigil.LookupOptions Lookup options.
color: function(key, opts): string|nil|? | nil

---Return raw `wezterm.format` items for a key or alias.
---@param key any Lookup key.
---@param opts? Sigil.ItemsOptions Formatting options.
items: function(key, opts): Sigil.FormatItem[]

---Render a key or alias with `wezterm.format`.
---@param key any Lookup key.
---@param opts? Sigil.ItemsOptions Formatting options.
format: function(key, opts): string

---Return a symbol by dotted path, such as `Sep.tb.left`.
symbol: function(path: string Dotted symbol path.): any

---Return all configured symbols.
symbols: function(): table

---Return all registered entries.
all: function(): table<string,

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
