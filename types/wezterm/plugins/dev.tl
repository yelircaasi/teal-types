---@diagnostic disable:unused-local

local type Behavior =
	"error"|"keep"|"force"

local record DevOpts
	auto: boolean | nil
	fetch_branch: boolean | nil
	ignore_branch: string | nil[]|string
	keywords: string | nil[]
end

local record CacheElement
	auto: boolean | nil
	branch: string | nil
	error: boolean | nil
	fetch_branch: boolean | nil
	file: string | nil
	ignore_branch: string | nil[]|string
	keywords: string | nil[]
	plugin_path: string | nil
	require_path: string | nil
end

local record Dev
	bootstrap: boolean
	cache: table<string, CacheElement>
	dev_cache_element: CacheElement
	substitutions: table | nil<string, string>
	utils: boolean
local M = {}

get_plugin_path: function(hashkey: string): string|nil|? | nil

get_require_path: function(hashkey: string): string|nil|? | nil

---@param url string
---@param opts? DevOpts
require: function(url, opts)(): any?

set_substitutions: function(substitute_dict: table<string, string>) end

---Set the wezterm require path for the plugin.
set_wezterm_require_path: function(hashkey: string): nil

---@param opts? DevOpts
---@return string|nil|? hashkey
setup: function(opts): string|nil|? | nil

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
