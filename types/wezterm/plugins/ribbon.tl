---@diagnostic disable:unused-local

local type Ribbon.Attribute string|string[]
local type Ribbon.FormatItem string|table

local record Ribbon.LogConfig
	enabled: boolean
	threshold: "DEBUG"|"INFO"|"WARN"|"ERROR"|integer
	sinks: table | nil Accepted for compatibility with older layout options.
end

local record Ribbon.Defaults
	foreground: string | nil Default foreground color.
	background: string | nil Default background color.
	attributes: table<string, table|string> Named text attributes.
	colors: table<string, boolean> ANSI color-name lookup table.

local record Ribbon.TextConfig
	strip: boolean Trim text before inserting it.
	max_length: integer | nil Maximum text length before truncation.
	transform: fun | nil(text: string): string Text transform callback.
end

local record Ribbon.Config
	log: Ribbon.LogConfig
	defaults: Ribbon.Defaults
	attribute_aliases: table<string, string|string[]> Attribute aliases.
	validate_attributes: boolean Warn or error on unknown attributes.
	strict_mode: boolean Error on unknown attributes when validation is enabled.
	text: Ribbon.TextConfig
	atomic: boolean Reset attributes after every text segment.

local record Ribbon.ConfigModule
local Config = {}

---Configure Ribbon.
---@param opts? table Partial Ribbon configuration.
function Config.setup(opts): Ribbon.Config

---Return the active Ribbon configuration.
function Config.get(): Ribbon.Config

---Return a copy of Ribbon defaults.
function Config.defaults(): Ribbon.Config

local record Ribbon
	atomic: boolean | nil Whether attributes reset after each segment.
	log: table Logger instance.
local R = {}

---Add an element to the ribbon.
---@param action "append"|"prepend"
---@param background? string Background color name or value.
---@param foreground? string Foreground color name or value.
---@param text? string Text to insert.
---@param attributes? Ribbon.Attribute Text attributes or aliases.
function R:add(action, background, foreground, text, attributes): Ribbon|nil|? | nil

---Append a formatted text segment.
---@param background? string Background color name or value.
---@param foreground? string Foreground color name or value.
---@param text? string Text to insert.
---@param attributes? Ribbon.Attribute Text attributes or aliases.
function R:append(background, foreground, text, attributes): Ribbon|nil|? | nil

---Prepend a formatted text segment.
---@param background? string Background color name or value.
---@param foreground? string Foreground color name or value.
---@param text? string Text to insert.
---@param attributes? Ribbon.Attribute Text attributes or aliases.
function R:prepend(background, foreground, text, attributes): Ribbon|nil|? | nil

---Append raw `wezterm.format` items.
---@param items? Ribbon.FormatItem[]|Ribbon.FormatItem Format item or list of items.
function R:append_items(items): Ribbon

---Prepend raw `wezterm.format` items.
---@param items? Ribbon.FormatItem[]|Ribbon.FormatItem Format item or list of items.
function R:prepend_items(items): Ribbon

---Clear all ribbon items.
function R:clear(): Ribbon

---Append a reset-attributes marker.
function R:reset_attributes() end

---Render with `wezterm.format`.
function R:format(): string

---Log the ribbon contents.
function R:debug(formatted: boolean Log rendered text when true, raw items when false.) end

---Return the raw format items.
function R:items(): Ribbon.FormatItem[]

local record Ribbon.Api
	config: Ribbon.ConfigModule Configuration helpers.
local M = {}

---Create a Ribbon instance.
---@param self_or_name? Ribbon.Api|string Ribbon API table when called with `:`, or a name when called with `.`.
---@param name_or_atomic? string|boolean Ribbon name when called with `:`, or atomic flag when called with `.`.
---@param atomic? boolean Atomic flag when called with `:`.
function M.new(self_or_name, name_or_atomic, atomic): Ribbon

---Configure Ribbon.
---@param opts? table Partial Ribbon configuration.
function M.setup(opts): Ribbon.Config

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
