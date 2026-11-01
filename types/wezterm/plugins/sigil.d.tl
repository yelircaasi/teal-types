local _tmp = require("_tmp")

local enum _LeftRightBoth
	"left"
	"right"
	"both"
end

local type Padding    =  boolean|_LeftRightBoth --Sigil.Padding
local type FormatItem = string|table --Sigil.FormatItem

local record Entry --Sigil.Entry
	key:     string   | nil --Normalized registry key.
	name:    string   | nil --Human-readable display name.
	icon:    string         --Icon glyph.
	color:   string   | nil --Icon color.
	aliases: {string} | nil --Alternative lookup names.
end

local record FallbackConfig --Sigil.FallbackConfig
	enabled: boolean --Return a fallback entry when no key matches.
	icon:  string     --Fallback icon.
	color: string    --Fallback color.
	name:  string     --Fallback display name.
end

local record FormattingConfig --Sigil.FormattingConfig
	reset: boolean --Append `ResetAttributes` after formatted icons.
	padding: Padding --Default icon padding.
end

local record SigilConfig --Sigil.Config
	fallback:   FallbackConfig
	formatting: FormattingConfig
	overrides:  {string: Entry} --Entry overrides merged into defaults.
	symbols:    {string: any} --Symbol overrides merged into defaults.
end

local record LookupOptions --Sigil.LookupOptions
	fallback: boolean | nil --Return fallback entry when no key matches.
end

local record ItemsOptions --Sigil.ItemsOptions: Sigil.LookupOptions
	padding: Sigil | Padding | nil --Padding to apply around the icon.
	reset:   boolean | nil --Append `ResetAttributes` after the icon.
end

local record Sigil
	config: SigilConfig
	setup:   function(opts: table|nil): SigilConfig                    ---Configure Sigil.
	add:     function(key: string, entry: Entry): Entry                ---Register or replace a Sigil entry.
	get:     function(key: any, opts: LookupOptions|nil): Entry|nil    ---Return a Sigil entry by key or alias.
	icon:    function(key: any, opts: LookupOptions|nil): string|nil   ---Return only the icon for a key or alias.
	color:   function(key: any, opts: LookupOptions|nil): string|nil   ---Return only the color for a key or alias.
	items:   function(key: any, opt: ItemsOptions|nil): {FormatItem}   ---Return raw `wezterm.format` items for a key or alias.
	format:  function(key: any, opts: ItemsOptions|nil): string        ---Render a key or alias with `wezterm.format`.
	symbol:  function(path: string): any                               ---Return a symbol by dotted path, such as `Sep.tb.left`.
	symbols: function(): table                                         ---Return all configured symbols.
	all:     function(): {string}                                      ---Return all registered entries.
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
