local _tmp = require("_tmp")

local type Attribute = string|{string} --Ribbon.Attribute
local type FormatItem = string|table --Ribbon.FormatItem

local record LogConfig --Ribbon.LogConfig
	enabled: boolean
	enum _Threshold
		"DEBUG"
		"INFO"
		"WARN"
		"ERROR"
	end
	threshold: _Threshold | integer
	sinks: table | nil
end

local record Defaults --Ribbon.Defaults
	foreground: string | nil --Default foreground color.
	background: string | nil --Default background color.
	attributes: {string: table|string} --Named text attributes.
	colors: {string: boolean} --ANSI color-name lookup table.
end

local record TextConfig --Ribbon.TextConfig
	strip: boolean --Trim text before inserting it.
	max_length: integer | nil --Maximum text length before truncation.
	transform: nil | function(text: string): string --Text transform callback.
end

local record Config --RibbonConfig
	log:                 LogConfig
	defaults:            Defaults
	attribute_aliases:   {string: string|{string}} --Attribute aliases.
	validate_attributes: boolean     --Warn or error on unknown attributes.
	strict_mode:         boolean     --Error on unknown attributes when validation is enabled.
	text:                TextConfig
	atomic:              boolean     --Reset attributes after every text segment.
end

local record RibbonConfig --Ribbon.ConfigModule

	---Configure Ribbon.
	setup: function(opts: table|nil): RibbonConfig

	---Return the active Ribbon configuration.
	get: function(): RibbonConfig

	---Return a copy of Ribbon defaults.
	defaults: function(): RibbonConfig
end

local record Ribbon
	atomic: boolean | nil --Whether attributes reset after each segment.
	log: table --Logger instance.

	enum _AppendPrepend
		"append"
		"prepend"
	end
	---Add an element to the ribbon.
	---@param action _AppendPrepend
	---@param background? string Background color name or value.
	---@param foreground? string Foreground color name or value.
	---@param text? string Text to insert.
	---@param attributes? Ribbon.Attribute Text attributes or aliases.
	add: function(
		self:       Ribbon,
		action:     _AppendPrepend,
		background: string|nil,
		foreground: string|nil,
		text:       string|nil, 
		attributes: {Attribute}|nil
	): Ribbon|nil

	---Append a formatted text segment.
	---@param background? string Background color name or value.
	---@param foreground? string Foreground color name or value.
	---@param text? string Text to insert.
	---@param attributes? Ribbon.Attribute Text attributes or aliases.
	append: function(self: Ribbon, background: string|nil, foreground: string|nil, text: string|nil, attributes: {Attribute}|nil): Ribbon|nil

	---Prepend a formatted text segment.
	---@param background? string Background color name or value.
	---@param foreground? string Foreground color name or value.
	---@param text? string Text to insert.
	---@param attributes? Ribbon.Attribute Text attributes or aliases.
	prepend: function(self: Ribbon, background: string|nil, foreground: string|nil, text: string|nil, attributes: {Attribute}|nil): Ribbon|nil

	---Append raw `wezterm.format` items.
	---@param items? Ribbon.{FormatItem}|Ribbon.FormatItem Format item or list of items.
	append_items: function(self: Ribbon, items: {FormatItem}|FormatItem): Ribbon

	---Prepend raw `wezterm.format` items.
	---@param items? Ribbon.{FormatItem}|Ribbon.FormatItem Format item or list of items.
	prepend_items: function(self: Ribbon, items: {FormatItem}|FormatItem): Ribbon

	---Clear all ribbon items.
	clear: function(self: Ribbon): Ribbon

	---Append a reset-attributes marker.
	reset_attributes: function(self: Ribbon): nil

	---Render with `wezterm.format`.
	format: function(self: Ribbon): string

	---Log the ribbon contents.
	debug: function(self: Ribbon, formatted: boolean): nil

	---Return the raw format items.
	items: function(self: Ribbon): {FormatItem}
end

local record Api
	config: RibbonConfig

	---Create a Ribbon instance.
	---@param self_or_name? Ribbon.Api|string Ribbon API table when called with `:`, or a name when called with `.`.
	---@param name_or_atomic? string|boolean Ribbon name when called with `:`, or atomic flag when called with `.`.
	---@param atomic? boolean Atomic flag when called with `:`.
	new: function(self_or_name: string|boolean|nil, name_or_atomic: boolean|nil, atomic: boolean|nil): Ribbon

	---Configure Ribbon.
	setup: function(opts: table|nil): RibbonConfig
end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
